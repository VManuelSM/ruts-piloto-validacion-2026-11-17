<script setup lang="ts">
/**
 * Las doce columnas de la hoja «Preguntas», en los colores del libro real
 * (gris = bloqueada, amarillo = se llena), para que en la reunión se
 * reconozcan al abrir el archivo. Orden y nombres tomados de
 * ruts-tesis/src/ruts_tesis/paquete_validacion.py (COLUMNAS_LIBRO).
 */
const fijas = [
  { col: 'id_pregunta', que: 'Clave de la pregunta' },
  { col: 'tramite', que: 'Nombre del trámite' },
  { col: 'idtram', que: 'Número de la ficha' },
  { col: 'tipo', que: 'Directa o desambiguación' },
  { col: 'campo_que_consulta', que: 'El dato que se pregunta' },
  { col: 'pregunta', que: 'Lo que pregunta la persona' },
]

const llenar = [
  { col: 'respuesta_correcta', que: 'Lo que le diría a la persona, en lenguaje llano. Varios requisitos: uno por renglón en la misma celda.' },
  { col: 'fundamento', que: 'De dónde sale: artículo y ordenamiento, acuerdo, tarifa o «práctica de la oficina».' },
  { col: 'fuente_de_la_respuesta', que: 'Se elige de la lista que aparece al dar clic en la celda.' },
  { col: 'verifico', que: 'Nombre y cargo de quien contesta.' },
  { col: 'fecha_de_verificacion', que: 'Fecha en que se contestó: AAAA-MM-DD.' },
  { col: 'nota', que: 'Opcional: el trámite cambió, la pregunta no aplica o depende de algo que no dice.' },
]
</script>

<template>
  <div class="lc">
    <section class="lc__bloque lc__bloque--fijas">
      <p class="lc__rotulo">
        <span class="lc__muestra lc__muestra--gris" />
        A a F · ya vienen llenas
      </p>
      <ul>
        <li v-for="c in fijas" :key="c.col">
          <code>{{ c.col }}</code>
          <span>{{ c.que }}</span>
        </li>
      </ul>
    </section>

    <section class="lc__bloque lc__bloque--llenar">
      <p class="lc__rotulo">
        <span class="lc__muestra lc__muestra--amarillo" />
        G a L · las llenan ustedes
      </p>
      <ul>
        <li v-for="c in llenar" :key="c.col">
          <code>{{ c.col }}</code>
          <span>{{ c.que }}</span>
        </li>
      </ul>
    </section>
  </div>
</template>

<style scoped>
.lc {
  display: grid;
  gap: var(--space-4);
  grid-template-columns: 0.9fr 1.55fr;
  margin-top: var(--space-4);
}

.lc__bloque {
  border: 1px solid var(--border-default);
  border-radius: var(--radius-md);
  padding: var(--space-3) var(--space-4);
}

.lc__bloque--fijas { background-color: var(--xl-gris); }
.lc__bloque--llenar { background-color: var(--xl-amarillo); }

.slidev-layout .lc__rotulo {
  align-items: center;
  color: var(--text-primary);
  display: flex;
  font-size: 0.78rem;
  font-weight: var(--font-weight-semibold);
  gap: var(--space-2);
  letter-spacing: 0.04em;
  margin: 0 0 var(--space-2);
  text-transform: uppercase;
}

.lc__muestra {
  border: 1px solid var(--gray-400);
  border-radius: 2px;
  display: inline-block;
  height: 0.8rem;
  width: 0.8rem;
}

.lc__muestra--gris { background-color: var(--xl-gris); }
.lc__muestra--amarillo { background-color: var(--xl-amarillo); border-color: var(--brand-secondary); }

.slidev-layout .lc ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.slidev-layout .lc li {
  align-items: baseline;
  border-top: 1px solid rgba(0, 0, 0, 0.07);
  display: grid;
  font-size: 0.8rem;
  gap: var(--space-3);
  line-height: 1.35;
  margin: 0;
  padding: 0.5rem 0;
}

.slidev-layout .lc li:first-child { border-top: none; }

.lc__bloque--fijas li { grid-template-columns: 8rem 1fr; }
.lc__bloque--llenar li { grid-template-columns: 9.9rem 1fr; }

.slidev-layout .lc code {
  background: none;
  color: var(--xl-encabezado);
  font-size: 0.68rem;
  font-weight: 600;
  padding: 0;
}

.lc__bloque--fijas code { opacity: 0.75; }

.lc span { color: var(--text-secondary); }
.lc__bloque--llenar span { color: var(--text-primary); }
</style>
