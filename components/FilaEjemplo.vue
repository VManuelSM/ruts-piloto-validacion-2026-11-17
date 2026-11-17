<script setup lang="ts">
/**
 * Una fila del libro, vuelta vertical para que se lea en la lámina.
 * El contenido es ilustrativo a propósito: no corresponde a ninguna pregunta
 * real de los libros, para no adelantar respuestas ni sesgar a quien conteste.
 */
const filas = [
  {
    col: 'pregunta',
    gris: true,
    valor: '¿Cuánto cuesta la constancia de residencia y qué tengo que llevar?',
  },
  {
    col: 'respuesta_correcta',
    valor: 'Cuesta $120.00.\nIdentificación oficial vigente.\nComprobante de domicilio de no más de tres meses.',
  },
  {
    col: 'fundamento',
    valor: 'Ley de Ingresos del Municipio para 2026, art. X (costo). Requisitos: formato que se entrega en ventanilla.',
  },
  { col: 'fuente_de_la_respuesta', valor: 'Ley de ingresos o tarifa publicada', lista: true },
  { col: 'verifico', valor: 'Nombre Apellido · Cargo' },
  { col: 'fecha_de_verificacion', valor: '2026-11-24' },
]
</script>

<template>
  <figure class="fe">
    <figcaption class="fe__aviso">
      Ejemplo ilustrativo · no es una pregunta de su libro
    </figcaption>
    <dl class="fe__tabla">
      <div
        v-for="f in filas"
        :key="f.col"
        class="fe__fila"
        :class="f.gris ? 'fe__fila--gris' : 'fe__fila--amarillo'"
      >
        <dt>{{ f.col }}</dt>
        <dd>
          <span class="fe__valor">{{ f.valor }}</span>
          <span v-if="f.lista" class="fe__flecha" aria-hidden="true">▾</span>
        </dd>
      </div>
    </dl>
  </figure>
</template>

<style scoped>
.fe { margin: 0; }

.slidev-layout .fe__aviso {
  color: var(--text-muted);
  font-size: 0.7rem;
  font-style: italic;
  margin-bottom: var(--space-2);
}

.fe__tabla {
  border: 1px solid var(--gray-300);
  border-radius: var(--radius-sm);
  box-shadow: var(--shadow-sm);
  margin: 0;
  overflow: hidden;
}

.fe__fila {
  border-top: 1px solid var(--gray-300);
  display: grid;
  grid-template-columns: 10rem 1fr;
}

.fe__fila:first-child { border-top: none; }

.fe__fila dt {
  background-color: var(--xl-encabezado);
  color: #fff;
  font-family: var(--slidev-code-font-family, ui-monospace, monospace);
  font-size: 0.66rem;
  font-weight: 600;
  padding: 0.55rem 0.7rem;
}

.fe__fila dd {
  align-items: flex-start;
  display: flex;
  font-size: 0.8rem;
  gap: var(--space-2);
  justify-content: space-between;
  line-height: 1.4;
  margin: 0;
  padding: 0.55rem 0.7rem;
}

.fe__fila--gris dd { background-color: var(--xl-gris); color: var(--text-secondary); }
.fe__fila--amarillo dd { background-color: var(--xl-amarillo); color: var(--text-primary); }

.fe__valor { white-space: pre-line; }

.fe__flecha {
  color: var(--text-muted);
  font-size: 0.6rem;
}
</style>
