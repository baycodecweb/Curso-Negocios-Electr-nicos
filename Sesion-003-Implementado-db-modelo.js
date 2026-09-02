// ============================================================
// EL PLANO MAESTRO DE LA MEMORIA — Sesión 3: Negocios y Empresas
// Digitales (B2B, B2C, C2C)
// ------------------------------------------------------------
// Objetivo pedagógico: pasar de "datos sueltos en el navegador"
// (Sesión 2: productos-data.js) a un MODELO RELACIONAL explícito:
// tablas con claves primarias y foráneas, tal como se documentaría
// en un Diagrama Entidad-Relación (DER) antes de construir una
// base de datos real.
//
// No hay servidor ni base de datos real todavía (eso se conecta
// recién en la Sesión 7 con la pasarela de pago y el webhook). Aquí
// se simulan las 5 tablas del DER usando localStorage como
// almacenamiento persistente en el navegador, respetando las
// mismas relaciones que tendría una base de datos SQL real:
//
//   Cliente (1) ----< (N) Pedido (1) ----< (N) DetallePedido >---- (N) Producto
//                        Pedido (1) ----< (N) Pago
//
// Entidades y atributos (ver también Codigo/demo-modelo-datos.html
// para el diagrama visual):
//
//   Cliente        { id, nombre, tipo [B2B|B2C], empresa, ruc, email, telefono }
//   Producto       { id, categoria, nombre, ... }  (ya modelado en productos-data.js)
//   Pedido         { id, clienteId (FK->Cliente), fecha, estado [Pendiente|Pagado], total }
//   DetallePedido  { id, pedidoId (FK->Pedido), productoId (FK->Producto), cantidad, precioUnitario, subtotal }
//   Pago           { id, pedidoId (FK->Pedido), metodo, monto, estado [Pendiente|Pagado], fecha }
// ============================================================

const BD_CLAVE = "grafiluz-s3-bd-relacional";

const BD_TABLAS_VACIAS = {
  clientes: [],
  pedidos: [],
  detallePedido: [],
  pagos: [],
  _correlativos: { cliente: 0, pedido: 0, detalle: 0, pago: 0 },
};

function bdLeer() {
  const guardado = localStorage.getItem(BD_CLAVE);
  if (!guardado) return structuredClone(BD_TABLAS_VACIAS);
  return JSON.parse(guardado);
}

function bdGuardar(bd) {
  localStorage.setItem(BD_CLAVE, JSON.stringify(bd));
}

function bdReiniciar() {
  localStorage.removeItem(BD_CLAVE);
}

/**
 * Inserta un nuevo cliente en la tabla "clientes".
 * @param {{nombre:string, tipo:"B2B"|"B2C", empresa?:string, ruc?:string, email?:string, telefono?:string}} datos
 * @returns {Object} el registro de cliente creado (con id)
 */
function crearCliente(datos) {
  const bd = bdLeer();
  const id = ++bd._correlativos.cliente;
  const cliente = {
    id,
    nombre: datos.nombre,
    tipo: datos.tipo, // "B2B" (empresa que compra al por mayor) o "B2C" (cliente individual)
    empresa: datos.tipo === "B2B" ? (datos.empresa || "") : "",
    ruc: datos.tipo === "B2B" ? (datos.ruc || "") : "",
    email: datos.email || "",
    telefono: datos.telefono || "",
  };
  bd.clientes.push(cliente);
  bdGuardar(bd);
  return cliente;
}

/**
 * Crea un pedido a partir de un carrito simple, generando también
 * sus filas de DetallePedido y un Pago en estado "Pendiente"
 * (el cobro real y el webhook se implementan en la Sesión 7).
 * @param {number} clienteId - FK hacia la tabla clientes
 * @param {{productoId:string, cantidad:number}[]} items
 * @param {Array} catalogoProductos - arreglo de productos-data.js
 * @returns {{pedido:Object, detalle:Object[], pago:Object}}
 */
function crearPedido(clienteId, items, catalogoProductos) {
  const bd = bdLeer();

  const detalle = items.map((item) => {
    const producto = catalogoProductos.find((p) => p.id === item.productoId);
    const precioUnitario = producto ? producto.precioReferencialPEN : 0;
    const subtotal = Number((precioUnitario * item.cantidad).toFixed(2));
    return {
      id: ++bd._correlativos.detalle,
      pedidoId: null, // se completa abajo una vez creado el pedido
      productoId: item.productoId,
      cantidad: item.cantidad,
      precioUnitario,
      subtotal,
    };
  });

  const total = Number(detalle.reduce((acc, d) => acc + d.subtotal, 0).toFixed(2));

  const pedido = {
    id: ++bd._correlativos.pedido,
    clienteId,
    fecha: new Date().toISOString(),
    estado: "Pendiente", // cambia a "Pagado" recién en la Sesión 7 (webhook de la pasarela)
    total,
  };

  detalle.forEach((d) => (d.pedidoId = pedido.id));

  const pago = {
    id: ++bd._correlativos.pago,
    pedidoId: pedido.id,
    metodo: null, // se define en la Sesión 7 (Stripe / PayPal / MercadoPago)
    monto: total,
    estado: "Pendiente",
    fecha: null,
  };

  bd.pedidos.push(pedido);
  bd.detallePedido.push(...detalle);
  bd.pagos.push(pago);
  bdGuardar(bd);

  return { pedido, detalle, pago };
}

/** Devuelve las 5 tablas del modelo, ya relacionadas para lectura. */
function obtenerTablas(catalogoProductos = []) {
  const bd = bdLeer();
  return {
    clientes: bd.clientes,
    productos: catalogoProductos,
    pedidos: bd.pedidos,
    detallePedido: bd.detallePedido,
    pagos: bd.pagos,
  };
}

if (typeof module !== "undefined" && module.exports) {
  module.exports = { crearCliente, crearPedido, obtenerTablas, bdReiniciar };
}
