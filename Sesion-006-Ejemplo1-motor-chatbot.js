// ============================================================
// EL ASISTENTE VIRTUAL EN ACCIÓN — Sesión 6: Herramientas,
// Análisis de Mercado y Chatbots con IA
// ------------------------------------------------------------
// Objetivo pedagógico: incrustar en la tienda un asistente que
// responda preguntas frecuentes y oriente sobre el catálogo en
// tiempo real, sin depender de una API de IA de pago (un alumno
// no tiene, al momento de esta prueba de concepto, una clave de
// OpenAI/Anthropic ni presupuesto para usarla).
//
// La técnica usada aquí SÍ es una técnica real de NLP: coincidencia
// de palabras clave (bag-of-words) sobre una base de conocimiento
// (FAQ + catálogo), normalizando texto (minúsculas, sin tildes) y
// puntuando cada posible respuesta por cuántas palabras del mensaje
// del usuario coinciden con sus palabras clave. Es el mismo
// principio que usan muchos chatbots reales de primer nivel de
// atención, antes de escalar a un modelo de lenguaje más grande.
//
// Cada pregunta y si tuvo o no respuesta se registra con
// motor-analitica.js (Sesión 5), para poder medir en el Panel de
// Control qué tanto está resolviendo el asistente por sí solo.
// ============================================================

const PALABRAS_VACIAS = new Set([
  "el", "la", "los", "las", "un", "una", "unos", "unas", "de", "del", "al",
  "y", "o", "a", "en", "es", "son", "que", "cual", "cuales", "como", "para",
  "por", "con", "se", "su", "sus", "mi", "tu", "me", "te", "lo", "le",
  "hay", "tiene", "tienen", "puedo", "quiero", "necesito", "hola", "buenas",
]);

const BASE_CONOCIMIENTO = [
  {
    id: "horario",
    palabrasClave: ["horario", "horarios", "atienden", "atencion", "hora", "abren", "cierran"],
    respuesta: "Atendemos consultas por WhatsApp de lunes a sábado. Escríbenos al 910169539 / 930910829 y te respondemos a la brevedad.",
  },
  {
    id: "ubicacion",
    palabrasClave: ["ubicacion", "direccion", "donde", "local", "tienda", "queda", "ubicados"],
    respuesta: "Estamos en Calle Pizarro 312 int. 38, Galerías Unión y Progreso, Cercado, Arequipa.",
  },
  {
    id: "personalizacion",
    palabrasClave: ["logo", "personalizar", "personalizado", "personalizacion", "marca", "imprimir", "grabado", "grabar"],
    respuesta: "Sí, todos nuestros productos se personalizan con el logo de tu empresa. Cuéntanos tu pedido por WhatsApp y te asesoramos sobre la técnica de impresión o grabado según el producto.",
  },
  {
    id: "pago",
    palabrasClave: ["pago", "pagar", "transferencia", "yape", "plin", "tarjeta", "factura", "boleta", "ruc"],
    respuesta: "Coordinamos el pago por transferencia bancaria; para pedidos pequeños también aceptamos Yape/Plin. A empresas les emitimos factura con RUC.",
  },
  {
    id: "mayoreo",
    palabrasClave: ["minimo", "cantidad", "mayor", "mayorista", "empresa", "volumen", "descuento"],
    respuesta: "Trabajamos tanto pedidos corporativos al por mayor (con mejor precio por volumen) como consultas individuales más pequeñas. Cuéntanos cuántas unidades necesitas y te cotizamos.",
  },
  {
    id: "entrega",
    palabrasClave: ["entrega", "demora", "tiempo", "plazo", "cuando", "listo", "envio", "despacho", "delivery", "provincia"],
    respuesta: "El tiempo de entrega depende del producto y la cantidad; coordinamos el plazo exacto contigo por WhatsApp al confirmar tu pedido. También coordinamos envíos a otras provincias.",
  },
  {
    id: "cotizar",
    palabrasClave: ["cotizar", "cotizacion", "presupuesto", "precio", "precios", "consultar", "comprar"],
    respuesta: "Puedes usar el botón \"Consultar\" de cualquier producto del catálogo, o escribirnos directo por WhatsApp indicando el producto y la cantidad que necesitas.",
  },
];

function normalizarTexto(texto) {
  return texto
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .replace(/[^a-z0-9\s]/g, " ")
    .split(/\s+/)
    .filter((palabra) => palabra.length > 2 && !PALABRAS_VACIAS.has(palabra));
}

function contarCoincidencias(palabrasUsuario, palabrasClave) {
  const setUsuario = new Set(palabrasUsuario);
  return palabrasClave.filter((clave) => setUsuario.has(clave)).length;
}

/** Busca, en el catálogo, el producto/categoría con más palabras en común con la pregunta. */
function buscarProductoRelacionado(palabrasUsuario, catalogoProductos) {
  let mejor = null;
  let mejorPuntaje = 0;

  catalogoProductos.forEach((producto) => {
    const palabrasProducto = normalizarTexto(`${producto.nombre} ${producto.categoria}`);
    const puntaje = contarCoincidencias(palabrasUsuario, palabrasProducto);
    if (puntaje > mejorPuntaje) {
      mejorPuntaje = puntaje;
      mejor = producto;
    }
  });

  return { producto: mejor, puntaje: mejorPuntaje };
}

/**
 * Responde una pregunta del usuario usando la base de conocimiento
 * (FAQ) y el catálogo. Registra el evento en motor-analitica.js si
 * está disponible (integración con la Sesión 5).
 * @param {string} textoUsuario
 * @param {Array} catalogoProductos - productos-data.js
 */
function responderPregunta(textoUsuario, catalogoProductos = []) {
  const palabrasUsuario = normalizarTexto(textoUsuario);

  let mejorFaq = null;
  let mejorPuntajeFaq = 0;
  BASE_CONOCIMIENTO.forEach((entrada) => {
    const puntaje = contarCoincidencias(palabrasUsuario, entrada.palabrasClave);
    if (puntaje > mejorPuntajeFaq) {
      mejorPuntajeFaq = puntaje;
      mejorFaq = entrada;
    }
  });

  const { producto, puntaje: puntajeProducto } = buscarProductoRelacionado(palabrasUsuario, catalogoProductos);

  let resultado;
  if (puntajeProducto > 0 && puntajeProducto >= mejorPuntajeFaq) {
    resultado = {
      tipo: "producto",
      respuesta: `Tenemos "${producto.nombre}" en nuestra categoría de ${producto.categoria}, desde S/ ${producto.precioReferencialPEN.toFixed(2)} (precio referencial, personalizable con tu logo). ¿Quieres que te ayudemos a cotizarlo por WhatsApp?`,
      coincidencias: puntajeProducto,
    };
  } else if (mejorFaq) {
    resultado = { tipo: "faq", respuesta: mejorFaq.respuesta, coincidencias: mejorPuntajeFaq };
  } else {
    resultado = {
      tipo: "sin_respuesta",
      respuesta: "No encontré una respuesta exacta para eso. Escríbenos directo por WhatsApp y un asesor te ayuda: https://wa.me/51930910829",
      coincidencias: 0,
    };
  }

  if (typeof registrarEvento === "function") {
    registrarEvento("chatbot_pregunta", { texto: textoUsuario, tipoRespuesta: resultado.tipo });
  }

  return resultado;
}

if (typeof module !== "undefined" && module.exports) {
  module.exports = { responderPregunta, normalizarTexto, BASE_CONOCIMIENTO };
}
