// ============================================================
// LA ARQUITECTURA DEL GIGANTE — Sesión 4: Modelo de Negocio
// Canvas y Mercados Electrónicos
// ------------------------------------------------------------
// Objetivo pedagógico: mostrar, con números reales, por qué el
// patrón de catálogo usado hasta ahora (tarjetas de producto
// escritas a mano en el HTML, una por una) NO ESCALA como lo
// hacen los grandes marketplaces (eBay, Alibaba, Amazon).
//
// El sitio real de Grafiluz (Codigo/Implementado-.../index.html)
// tiene cada producto de cada categoría escrito directamente en
// el HTML: funciona con unas decenas de productos, pero renderizar
// así miles de productos (lo normal en un marketplace) sería lento
// y el HTML sería imposible de mantener.
//
// La alternativa (igual a la de cualquier plataforma grande) es:
//   1. Los productos son DATOS (productos-data.js), no HTML.
//   2. Se construye un ÍNDICE en memoria (por id y por categoría)
//      para no tener que recorrer todo el catálogo en cada
//      búsqueda (búsqueda O(1) por id/categoría en vez de O(n)).
//   3. Solo se RENDERIZA la página actual (paginación), nunca
//      todo el catálogo de una sola vez.
// ============================================================

/**
 * Genera un catálogo sintético de prueba a partir de un catálogo
 * base pequeño, para poder simular una tienda con miles de
 * productos (como tendría un marketplace real) sin inventar datos
 * de negocio nuevos.
 * @param {Array} catalogoBase - productos reales (productos-data.js)
 * @param {number} cantidad - tamaño del catálogo sintético a generar
 */
function generarCatalogoSintetico(catalogoBase, cantidad) {
  const catalogo = [];
  for (let i = 0; i < cantidad; i++) {
    const base = catalogoBase[i % catalogoBase.length];
    catalogo.push({
      ...base,
      id: `${base.id}-${i}`,
      nombre: `${base.nombre} #${i + 1}`,
    });
  }
  return catalogo;
}

/**
 * Construye el índice en memoria del catálogo: acceso O(1) por id
 * y por categoría, en vez de recorrer el arreglo completo (O(n))
 * cada vez que se necesita filtrar o buscar un producto.
 */
function construirIndice(productos) {
  const porId = new Map();
  const porCategoria = new Map();

  productos.forEach((producto) => {
    porId.set(producto.id, producto);

    if (!porCategoria.has(producto.categoria)) {
      porCategoria.set(producto.categoria, []);
    }
    porCategoria.get(producto.categoria).push(producto);
  });

  return { porId, porCategoria, total: productos.length };
}

/**
 * Busca productos usando el índice (por categoría y/o texto) y
 * devuelve solo UNA página de resultados, tal como lo hace
 * cualquier marketplace real (nunca devuelve el catálogo completo).
 * @param {{porId:Map, porCategoria:Map}} indice
 * @param {{texto?:string, categoria?:string, pagina?:number, porPagina?:number}} opciones
 */
function buscarProductos(indice, opciones = {}) {
  const { texto = "", categoria = "", pagina = 1, porPagina = 10 } = opciones;

  let candidatos = categoria
    ? indice.porCategoria.get(categoria) || []
    : [...indice.porId.values()];

  if (texto) {
    const textoBusqueda = texto.toLowerCase();
    candidatos = candidatos.filter((p) => p.nombre.toLowerCase().includes(textoBusqueda));
  }

  const total = candidatos.length;
  const totalPaginas = Math.max(1, Math.ceil(total / porPagina));
  const inicio = (pagina - 1) * porPagina;
  const resultados = candidatos.slice(inicio, inicio + porPagina);

  return { resultados, total, totalPaginas, pagina };
}

/**
 * Simula el patrón "ingenuo" (el que usa hoy el sitio real): crea
 * una tarjeta de HTML por CADA producto del catálogo, sin importar
 * cuántos sean. Sirve solo para medir cuánto tarda, en comparación
 * con buscarProductos() + paginación.
 */
function renderizarTodoSinIndice(productos, contenedor) {
  const inicio = performance.now();
  contenedor.innerHTML = productos
    .map((p) => `<div class="catalogo-item">${p.nombre} — S/ ${p.precioReferencialPEN.toFixed(2)}</div>`)
    .join("");
  return performance.now() - inicio;
}

/**
 * Patrón escalable: usa el índice + paginación, renderizando solo
 * la página pedida (por defecto 10 productos), sin importar si el
 * catálogo tiene 50 o 50,000 productos.
 */
function renderizarConIndice(indice, opciones, contenedor) {
  const inicio = performance.now();
  const { resultados } = buscarProductos(indice, opciones);
  contenedor.innerHTML = resultados
    .map((p) => `<div class="catalogo-item">${p.nombre} — S/ ${p.precioReferencialPEN.toFixed(2)}</div>`)
    .join("");
  return performance.now() - inicio;
}

if (typeof module !== "undefined" && module.exports) {
  module.exports = { generarCatalogoSintetico, construirIndice, buscarProductos };
}
