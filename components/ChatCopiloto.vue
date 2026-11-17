<script setup lang="ts">
/**
 * Conversación ilustrativa del copiloto de captura. El mensaje de rechazo del
 * relleno es el texto real del nodo de validación determinista
 * (ruts-tesis/src/copiloto/nodos.py); el resto es una muestra de cómo se verá.
 */
type Turno = { de: 'copiloto' | 'persona', texto: string, alerta?: boolean, opciones?: string[] }

const turnos: Turno[] = [
  { de: 'copiloto', texto: '¿El trámite tiene costo?', opciones: ['Sí', 'No'] },
  { de: 'persona', texto: 'Sí' },
  { de: 'copiloto', texto: '¿Cuál es el monto, en pesos?' },
  { de: 'persona', texto: 'N/A' },
  {
    de: 'copiloto',
    alerta: true,
    texto: '«N/A» es un marcador de relleno. O el dato existe, o el campo se declara vacío con su motivo. ¿Cuál es el monto, en pesos?',
  },
]
</script>

<template>
  <div class="chat" role="img" aria-label="Conversación ilustrativa con el copiloto de captura">
    <header class="chat__barra">
      <span class="chat__punto" />
      <span>Copiloto de captura</span>
      <span class="chat__estado">Ficha en borrador · 14 pendientes</span>
    </header>

    <ol class="chat__turnos">
      <li
        v-for="(t, i) in turnos"
        :key="i"
        class="chat__turno"
        :class="[`chat__turno--${t.de}`, { 'chat__turno--alerta': t.alerta }]"
      >
        <p class="chat__globo">{{ t.texto }}</p>
        <p v-if="t.opciones" class="chat__opciones">
          <span v-for="o in t.opciones" :key="o" class="chat__chip">{{ o }}</span>
        </p>
      </li>
    </ol>

    <footer class="chat__pie">
      <span class="chat__chip chat__chip--sec">Lo contesto después</span>
      <span class="chat__chip chat__chip--sec">Corregir</span>
      <span class="chat__entrada">Escriba su respuesta…</span>
    </footer>
  </div>
</template>

<style scoped>
.chat {
  background-color: var(--surface-card);
  border: 1px solid var(--border-default);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-md, var(--shadow-sm));
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.chat__barra {
  align-items: center;
  background-color: var(--brand-primary);
  color: var(--text-inverse);
  display: flex;
  font-size: 0.66rem;
  font-weight: var(--font-weight-semibold);
  gap: var(--space-2);
  padding: var(--space-2) var(--space-3);
}

.chat__punto {
  background-color: var(--brand-secondary);
  border-radius: 999px;
  height: 0.5rem;
  width: 0.5rem;
}

.chat__estado {
  font-weight: var(--font-weight-regular);
  margin-left: auto;
  opacity: 0.8;
}

.slidev-layout .chat__turnos {
  background-color: var(--surface-app);
  display: flex;
  flex-direction: column;
  gap: 0.4rem;
  list-style: none;
  margin: 0;
  padding: var(--space-3);
}

.slidev-layout .chat__turno {
  display: flex;
  flex-direction: column;
  margin: 0;
  max-width: 86%;
}

.chat__turno--copiloto { align-self: flex-start; }
.chat__turno--persona { align-items: flex-end; align-self: flex-end; }

.slidev-layout .chat__globo {
  border-radius: var(--radius-md);
  font-size: 0.64rem;
  line-height: 1.4;
  margin: 0;
  padding: 0.4rem 0.65rem;
}

.slidev-layout .chat__turno--copiloto .chat__globo {
  background-color: var(--surface-card);
  border: 1px solid var(--border-default);
  border-bottom-left-radius: 2px;
  color: var(--text-primary);
}

.slidev-layout .chat__turno--persona .chat__globo {
  background-color: var(--xl-encabezado);
  border-bottom-right-radius: 2px;
  color: #fff;
}

.slidev-layout .chat__turno--alerta .chat__globo {
  background-color: var(--surface-alert-bg-warning);
  border-color: var(--alert-warning, #EAB308);
  border-left: 3px solid var(--alert-warning, #EAB308);
}

.slidev-layout .chat__opciones {
  display: flex;
  gap: var(--space-1);
  margin: 0.3rem 0 0;
}

.chat__chip {
  border: 1px solid var(--brand-primary);
  border-radius: 999px;
  color: var(--brand-primary);
  font-size: 0.58rem;
  font-weight: var(--font-weight-medium);
  padding: 0.1rem 0.55rem;
}

.chat__chip--sec {
  border-color: var(--gray-300);
  color: var(--text-secondary);
}

.chat__pie {
  align-items: center;
  border-top: 1px solid var(--border-default);
  display: flex;
  gap: var(--space-2);
  padding: var(--space-2) var(--space-3);
}

.chat__entrada {
  border: 1px solid var(--border-default);
  border-radius: var(--radius-sm);
  color: var(--text-disabled);
  flex: 1;
  font-size: 0.6rem;
  padding: 0.25rem 0.5rem;
}
</style>
