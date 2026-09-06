// ============================================================
// LA TRANSACCIÓN PERFECTA — Sesión 7: Soluciones de Pago y
// Definición del Proyecto E-business
// ------------------------------------------------------------
// Objetivo pedagógico: cerrar el ciclo de compra de extremo a
// extremo (Pedido de la Sesión 3 → Pago confirmado) usando el
// mismo flujo que usaría una pasarela real (Stripe, PayPal,
// MercadoPago): formulario de tarjeta → validación → procesamiento
// → webhook que actualiza el pedido.
//
// Un alumno no tiene, al hacer esta prueba de concepto, una cuenta
// real de Stripe/PayPal/MercadoPago (requieren registro y, para
// producción, datos de la empresa). Por eso esta "pasarela" es una
// SANDBOX PROPIA que:
//   1. Valida el número de tarjeta con el algoritmo de Luhn (el
//      mismo algoritmo matemático real que usan las tarjetas de
//      crédito de verdad para detectar errores de tipeo).
//   2. Usa los mismos números de tarjeta de prueba que publica
//      Stripe en su documentación oficial de testing, para que el
//      alumno reconozca el patrón si más adelante usa una pasarela
//      real: 4242 4242 4242 4242 (éxito), 4000 0000 0000 0002
//      (rechazada), 4000 0000 0000 9995 (fondos insuficientes).
//   3. Simula la latencia de red de un cobro real (~1.5s).
//   4. Al confirmar el pago, dispara el "webhook": en un backend
//      real esto sería una llamada HTTP de la pasarela a tu
//      servidor; aquí, sin servidor propio, se simula llamando
//      directamente a marcarPedidoComoPagado() (Sesión 3/7) —
//      mismo contrato de datos, misma responsabilidad.
// ============================================================

const TARJETAS_DE_PRUEBA = {
  "4242424242424242": "exito",
  "4000000000000002": "rechazada",
  "4000000000009995": "fondos_insuficientes",
};

const MENSAJES_RECHAZO = {
  numero_invalido: "El número de tarjeta no es válido (no pasa la verificación de Luhn).",
  rechazada: "Tu banco rechazó la operación (tarjeta de prueba de rechazo).",
  fondos_insuficientes: "Fondos insuficientes (tarjeta de prueba).",
};

function limpiarNumeroTarjeta(numero) {
  return String(numero).replace(/\s+/g, "");
}

/** Algoritmo de Luhn real, el mismo que usan las tarjetas de crédito reales. */
function validarLuhn(numero) {
  if (!/^\d{13,19}$/.test(numero)) return false;
  let suma = 0;
  let alternar = false;
  for (let i = numero.length - 1; i >= 0; i--) {
    let digito = parseInt(numero[i], 10);
    if (alternar) {
      digito *= 2;
      if (digito > 9) digito -= 9;
    }
    suma += digito;
    alternar = !alternar;
  }
  return suma % 10 === 0;
}

/**
 * Inicia un cobro simulado. Devuelve una Promise, igual que el SDK
 * real de cualquier pasarela de pago.
 * @param {{pedidoId:number, monto:number, numeroTarjeta:string}} datos
 * @returns {Promise<{exito:boolean, transaccionId?:string, motivo?:string, mensaje?:string, pedido?:Object, pago?:Object}>}
 */
function iniciarPago({ pedidoId, monto, numeroTarjeta }) {
  return new Promise((resolve) => {
    const numeroLimpio = limpiarNumeroTarjeta(numeroTarjeta);

    setTimeout(() => {
      if (!validarLuhn(numeroLimpio)) {
        if (typeof registrarEvento === "function") {
          registrarEvento("pago_rechazado", { pedidoId, motivo: "numero_invalido" });
        }
        resolve({ exito: false, motivo: "numero_invalido", mensaje: MENSAJES_RECHAZO.numero_invalido });
        return;
      }

      // Cualquier tarjeta válida por Luhn que no sea una de las de
      // prueba de rechazo se trata como exitosa, para no bloquear
      // las pruebas de cada alumno con su propio número inventado.
      const escenario = TARJETAS_DE_PRUEBA[numeroLimpio] || "exito";

      if (escenario !== "exito") {
        if (typeof registrarEvento === "function") {
          registrarEvento("pago_rechazado", { pedidoId, motivo: escenario });
        }
        resolve({ exito: false, motivo: escenario, mensaje: MENSAJES_RECHAZO[escenario] });
        return;
      }

      const transaccionId = "sim_" + Date.now().toString(36) + Math.random().toString(36).slice(2, 6);

      // ==== "WEBHOOK" ====
      // En una pasarela real, este paso ocurre en TU SERVIDOR cuando
      // la pasarela le hace un POST a tu endpoint de webhook. Aquí,
      // sin servidor propio, se llama directamente a la función que
      // haría ese mismo trabajo.
      const { pedido, pago } = marcarPedidoComoPagado(pedidoId, { metodo: "Tarjeta (sandbox)", transaccionId });

      if (typeof registrarEvento === "function") {
        registrarEvento("pago_exitoso", { pedidoId, monto, transaccionId });
      }

      resolve({ exito: true, transaccionId, pedido, pago });
    }, 1500);
  });
}

if (typeof module !== "undefined" && module.exports) {
  module.exports = { iniciarPago, validarLuhn, TARJETAS_DE_PRUEBA };
}
