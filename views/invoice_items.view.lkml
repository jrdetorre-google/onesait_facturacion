view: invoice_items {
  sql_table_name: `onesait_facturacion.invoice_items` ;;
  drill_fields: [invoice_item_id]
  label: "Detalles de facturas"

  dimension: invoice_item_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Invoice_item_id ;;
  }

  dimension: abonado {
    type: string
    sql: ${TABLE}.Abonado ;;
  }

  dimension: servicio {
    type: string
    sql: ${TABLE}.Servicio ;;
  }

  dimension: descripcion_servicio {
    type: string
    sql: ${TABLE}.Descripcion_servicio ;;
  }

  dimension: destino {
    type: string
    sql: ${TABLE}.Destino ;;
  }

  dimension_group: fecha_servicio {
    type: time
    timeframes: [raw, date, week, month, quarter, year, day_of_week, day_of_month]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha_servicio ;;
  }

  dimension: hora_servicio {
    type: string
    sql: ${TABLE}.Hora_servicio ;;
  }

  dimension: duracion_servicio {
    label: "Duración (segundos)"
    type: number
    sql: ${TABLE}.Duracion_servicio ;;
  }

  dimension: importe_servicio {
    type: number
    sql: ${TABLE}.Importe_servicio ;;
  }

  dimension: invoice_id {
    type: string
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: kb_servicio {
    type: number
    sql: ${TABLE}.KB_servicio ;;
  }

  measure: total_duracion {
    label: "Duración total (segundos)"
    type: sum
    sql: ${duracion_servicio} ;;
  }

  measure: total_duracion_minutos {
    label: "Duración total (minutos)"
    type: sum
    sql: ${duracion_servicio} / 60 ;;
    value_format_name: "decimal_2"
  }

  measure: average_duracion {
    label: "Duración media (segundos)"
    type: average
    sql: ${duracion_servicio} ;;
  }

  measure: average_duracion_minutos {
    label: "Duración media (minutos)"
    type: average
    sql: ${duracion_servicio} / 60;;
    value_format_name: "decimal_2"
  }

  measure: max_duracion {
    label: "Duración máxima (segundos)"
    type: max
    sql: ${duracion_servicio} ;;
  }

  measure: max_duracion_minutos {
    label: "Duración máxima (minutos)"
    type: max
    sql: ${duracion_servicio} / 60;;
    value_format_name: "decimal_2"
  }

  measure: total_importe{
    label: "Importe total"
    type: sum
    value_format_name: "eur"
    drill_fields: [abonado, importe_servicio]
    sql: ${importe_servicio};;
  }

  measure: average_importe{
    label: "Importe promedio"
    type: average
    value_format_name: "eur"
    sql: ${importe_servicio} ;;
  }

  measure: max_importe {
    label: "Importe máximo"
    type: max
    value_format_name: "eur"
    sql: ${importe_servicio} ;;
  }

  measure: total_KB{
    type: sum
    sql: ${kb_servicio} ;;  }

  measure: total_MB{
    type: sum
    value_format_name: "decimal_3"
    sql: ${kb_servicio}/(1024) ;;
  }

  measure: total_GB{
    type: sum
    value_format_name: "decimal_3"
    sql: ${kb_servicio}/(1024*1024) ;;
  }

  measure: average_KB{
    type: average
    sql: ${kb_servicio} ;;
  }

  measure: max_KB {
    type: max
    sql: ${kb_servicio} ;;
  }

  measure: count {
    type: count
    drill_fields: [invoice_item_id]
  }

  measure: lineas {
    type: count_distinct
    sql: ${abonado} ;;
  }

}
