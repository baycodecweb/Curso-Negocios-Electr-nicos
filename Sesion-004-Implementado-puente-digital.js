// ============================================================
// EL PUENTE DIGITAL — Sesión 2: E-business & E-commerce
// ------------------------------------------------------------
// Objetivo pedagógico: demostrar, con una prueba de concepto real,
// que una tienda puede CONECTARSE a un servicio externo mediante
// una API para ampliar su alcance de negocio. Aquí no compramos
// nada ni vendemos nada: E-COMMERCE sería la transacción en sí.
// Este script pertenece al mundo del E-BUSINESS: es un proceso de
// integración/soporte que hace más inteligente al negocio.
//
// Caso elegido: Grafiluz vende a empresas que podrían tener
// clientes o proveedores en otros países. Este script consulta el
// tipo de cambio del día (Soles -> Dólares / Euros) usando una API
// pública GRATUITA y SIN NECESIDAD DE API KEY, y muestra los
// precios referenciales del catálogo ya convertidos.
//
// API utilizada: open.er-api.com (Exchange Rate API - Open Access)
// Documentación: https://www.exchangerate-api.com/docs/free
// ============================================================

const API_TIPO_CAMBIO = "https://open.er-api.com/v6/latest/PEN";

/**
 * Obtiene las tasas de cambio actuales desde la API externa.
 * @returns {Promise<Object>} objeto con tasas, ej: { USD: 0.27, EUR: 0.25, ... }
 */
async function obtenerTasasDeCambio() {
  const respuesta = await fetch(API_TIPO_CAMBIO);

  if (!respuesta.ok) {
    throw new Error(`La API respondió con error: ${respuesta.status}`);
  }

  const datos = await respuesta.json();

  if (datos.result !== "success") {
    throw new Error("La API no devolvió tasas de cambio válidas.");
  }

  return datos.rates; // { USD: 0.27, EUR: 0.25, ... }
}

/**
 * Actualiza EN VIVO el precio de cada producto real del catálogo
 * (todas las categorías) usando las tasas de cambio obtenidas de la
 * API. Cada tarjeta de producto ya trae su propio precio de
 * referencia en Soles marcado con data-pen="..." en el HTML.
 * @param {Object} tasas - tasas de cambio devueltas por la API
 */
function actualizarPreciosCatalogoReal(tasas) {
  const elementos = document.querySelectorAll(".card-precio[data-pen]");

  elementos.forEach((el) => {
    const precioPEN = parseFloat(el.dataset.pen);
    const spanConvertido = el.querySelector(".card-precio-convertido");
    if (!spanConvertido || Number.isNaN(precioPEN)) return;

    const partes = [];
    if (tasas.USD) partes.push(`$${(precioPEN * tasas.USD).toFixed(2)} USD`);
    if (tasas.EUR) partes.push(`€${(precioPEN * tasas.EUR).toFixed(2)} EUR`);

    spanConvertido.textContent = partes.length ? ` \u2248 ${partes.join(" \u00b7 ")}` : "";
  });
}

/**
 * Punto de entrada: conecta con la API de tipo de cambio y actualiza
 * en pantalla el precio convertido de todo el catálogo. Si algo falla
 * (sin internet, API caída, etc.) se informa el error sin romper el
 * resto del sitio.
 */
async function iniciarPuenteDigital() {
  const estado = document.getElementById("pd-estado");

  try {
    if (estado) estado.textContent = "Consultando tipo de cambio...";

    const tasas = await obtenerTasasDeCambio();
    actualizarPreciosCatalogoReal(tasas);

    if (estado) {
      estado.textContent = `Tipo de cambio actualizado. 1 PEN = ${tasas.USD} USD | ${tasas.EUR} EUR. Revisa el precio convertido junto a cada producto del catálogo.`;
    }
  } catch (error) {
    console.error("Error en el Puente Digital:", error);
    if (estado) {
      estado.textContent =
        "No se pudo conectar con la API externa. Intenta nuevamente más tarde.";
    }
  }
}
