// ============================================================
// LA TIENDA QUE OBSERVA — Sesión 5: Marketing y Tecnologías
// Digitales
// ------------------------------------------------------------
// Objetivo pedagógico: demostrar que el sitio ya tiene "inyectado"
// un código de rastreo que registra cada visita, clic de interés
// (WhatsApp, precios internacionales) y pedido generado, tal como
// lo haría un píxel de Google Analytics o de Meta — pero sin
// depender de una cuenta externa real (que un alumno no tiene al
// momento de hacer esta prueba de concepto).
//
// En un despliegue real (Sesión 8), este archivo se reemplazaría
// o convivería con el snippet real de Google Analytics / Meta
// Pixel; el patrón de instrumentación (marcar eventos clave del
// negocio) es exactamente el mismo.
//
// Los eventos se guardan en localStorage como una tabla más,
// igual que las tablas de db-modelo.js (Sesión 3), y se leen desde
// panel-control.html para simular el "panel de control corporativo".
// ============================================================

const ANALITICA_CLAVE = "grafiluz-s5-eventos";

function obtenerEventos() {
  const guardado = localStorage.getItem(ANALITICA_CLAVE);
  return guardado ? JSON.parse(guardado) : [];
}

/**
 * Registra un evento de negocio (visita, clic de interés, pedido
 * generado, búsqueda, etc.). Nunca envía nada a un servidor externo:
 * todo queda en el navegador del propio visitante, como el resto de
 * las pruebas de concepto del curso.
 * @param {string} tipo - "visita" | "clic_whatsapp" | "clic_precios_internacionales" | "busqueda_catalogo" | "pedido_generado"
 * @param {Object} detalle - datos propios del evento (ej. { producto })
 */
function registrarEvento(tipo, detalle = {}) {
  const eventos = obtenerEventos();
  eventos.push({
    id: eventos.length + 1,
    tipo,
    detalle,
    pagina: (location.pathname.split("/").pop() || "index.html"),
    fecha: new Date().toISOString(),
  });
  localStorage.setItem(ANALITICA_CLAVE, JSON.stringify(eventos));
}

/** Se llama una vez por carga de página: equivalente a un "page view". */
function trackVisita() {
  registrarEvento("visita", {});
}

function reiniciarAnalitica() {
  localStorage.removeItem(ANALITICA_CLAVE);
}

/**
 * Calcula el resumen que vería un panel de control corporativo:
 * visitas, clics de interés, búsquedas, pedidos generados y una
 * tasa de conversión simple (pedidos / interés mostrado).
 */
function calcularResumen() {
  const eventos = obtenerEventos();

  const totalVisitas = eventos.filter((e) => e.tipo === "visita").length;
  const clicsWhatsApp = eventos.filter((e) => e.tipo === "clic_whatsapp");
  const clicsPrecios = eventos.filter((e) => e.tipo === "clic_precios_internacionales").length;
  const busquedas = eventos.filter((e) => e.tipo === "busqueda_catalogo").length;
  const pedidosGenerados = eventos.filter((e) => e.tipo === "pedido_generado");

  const productosConMasInteres = {};
  clicsWhatsApp.forEach((e) => {
    const nombre = e.detalle.producto || "Consulta general";
    productosConMasInteres[nombre] = (productosConMasInteres[nombre] || 0) + 1;
  });

  const valorTotalPedidos = pedidosGenerados.reduce((acc, e) => acc + (e.detalle.total || 0), 0);
  const interesTotal = clicsWhatsApp.length + clicsPrecios;
  const tasaConversion = interesTotal > 0 ? (pedidosGenerados.length / interesTotal) * 100 : 0;

  return {
    totalVisitas,
    totalClicsWhatsApp: clicsWhatsApp.length,
    clicsPrecios,
    busquedas,
    totalPedidos: pedidosGenerados.length,
    valorTotalPedidos,
    productosConMasInteres,
    tasaConversion,
    eventos,
  };
}

if (typeof module !== "undefined" && module.exports) {
  module.exports = { registrarEvento, trackVisita, obtenerEventos, calcularResumen, reiniciarAnalitica };
}
