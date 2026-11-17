# Libro de validación y copiloto de captura — 17 de noviembre de 2026

Deck ejecutivo (8 a 9 minutos) para la reunión con la Secretaría de Contraloría y los
municipios de Omitlán de Juárez y Mineral del Chico, el piloto de la tesis del RUTS:
cómo se llena el libro de validación del gold set y qué hará el copiloto de captura.

Publicado en https://vmanuelsm.github.io/ruts-piloto-validacion-2026-11-17/

```bash
npm install      # requiere ../slidev-theme-hidalgo
npm run dev      # abre el deck; las notas del orador están en /presenter
npm run export   # PDF
./deploy.sh      # compila y publica en GitHub Pages
```

- Las cifras de fichas salen de `ruts-tesis/informes/folio/linea_base_piloto.json`
  (corte del 12 de agosto de 2026); las de preguntas, de
  `ruts-tesis/datos/folio/gold_set/preguntas_para_redactar.csv` (34 / 33 / 33 + 8).
- Las columnas y la lista de fuentes repiten `paquete_validacion.py`.
- El mensaje del «N/A» del copiloto es el real (`ruts-copiloto-agente/src/agente/nodos.py`);
  el resto de la conversación es ilustrativo.
- El deck no contiene texto de solicitudes ciudadanas.
