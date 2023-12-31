view: invoice_items {
  sql_table_name: `onesait_facturacion.invoice_items` ;;
  label: "Detalles de facturas"

  dimension: invoice_item_id {
    label: "Id de línea de factura"
    primary_key: yes
    type: string
    sql: ${TABLE}.Invoice_item_id ;;
  }

  dimension: abonado {
    type: number
    sql: ${TABLE}.Abonado ;;
    value_format_name: id
  }

  dimension: servicio {
    type: string
    sql: ${TABLE}.Servicio ;;
  }

  dimension: descripcion_servicio {
    label: "Descripción del servicio"
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
    label: "Hora de la llamada"
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
    label: "Número de factura"
    type: string
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: kb_servicio {
    label: "Volumen datos (Kb)"
    type: number
    sql: ${TABLE}.KB_servicio ;;
  }

  parameter: date_granularity {
    hidden: yes
    type: unquoted
    allowed_value: {
      label: "Día"
      value: "day"
    }
    allowed_value: {
      label: "Mes"
      value: "month"
    }
  }

  dimension: date {
    hidden: yes
    sql:
    {% if date_granularity._parameter_value == 'day' %}
      ${fecha_servicio_date}
    {% elsif date_granularity._parameter_value == 'month' %}
      ${fecha_servicio_month}
    {% else %}
      ${fecha_servicio_date}
    {% endif %};;
  }

  measure: total_duracion {
    group_label: "Duración"
    group_item_label: "Duración total (segundos)"
    type: sum
    sql: ${duracion_servicio} ;;
    value_format_name: "id"
  }

  measure: total_duracion_minutos {
    group_label: "Duración"
    group_item_label: "Duración total (minutos)"
    type: sum
    sql: ${duracion_servicio} / 60 ;;
    value_format_name: "decimal_2"
  }

  measure: average_duracion {
    group_label: "Duración"
    group_item_label: "Duración media (segundos)"
    type: average
    sql: ${duracion_servicio} ;;
    value_format_name: "id"
  }

  measure: average_duracion_minutos {
    group_label: "Duración"
    group_item_label: "Duración media (minutos)"
    type: average
    sql: ${duracion_servicio} / 60;;
    value_format_name: "decimal_2"
  }

  measure: max_duracion {
    group_label: "Duración"
    group_item_label: "Duración máxima (segundos)"
    type: max
    sql: ${duracion_servicio} ;;
    value_format_name: "id"
  }

  measure: max_duracion_minutos {
    group_label: "Duración"
    group_item_label: "Duración máxima (minutos)"
    type: max
    sql: ${duracion_servicio} / 60 ;;
    value_format_name: "decimal_2"
  }

  measure: total_importe {
    group_label: "Importe"
    group_item_label: "Importe total"
    type: sum
    value_format_name: "eur"
    drill_fields: [abonado, importe_servicio]
    sql: ${importe_servicio};;
  }

  measure: average_importe {
    group_label: "Importe"
    group_item_label: "Importe promedio"
    type: average
    value_format_name: "eur"
    sql: ${importe_servicio} ;;
  }

  measure: max_importe {
    group_label: "Importe"
    group_item_label: "Importe máximo"
    type: max
    value_format_name: "eur"
    sql: ${importe_servicio} ;;
  }

  measure: total_KB {
    group_label: "Volumen de datos"
    group_item_label: "Volumen total (KB)"
    type: sum
    sql: ${kb_servicio} ;;
  }

  measure: total_MB {
    group_label: "Volumen de datos"
    group_item_label: "Volumen total (MB)"
    type: sum
    value_format_name: "decimal_2"
    sql: ${kb_servicio}/(1024) ;;
  }

  measure: total_GB {
    group_label: "Volumen de datos"
    group_item_label: "Volumen total (GB)"
    type: sum
    value_format_name: "decimal_2"
    sql: ${kb_servicio}/(1024*1024) ;;
  }

  measure: average_KB {
    group_label: "Volumen de datos"
    group_item_label: "Volumen promedio (KB)"
    type: average
    sql: ${kb_servicio} ;;
  }

  measure: average_MB {
    group_label: "Volumen de datos"
    group_item_label: "Volumen promedio (MB)"
    type: average
    value_format_name: "decimal_2"
    sql: ${kb_servicio}/(1024) ;;
  }

  measure: average_GB {
    group_label: "Volumen de datos"
    group_item_label: "Volumen promedio (GB)"
    type: average
    value_format_name: "decimal_2"
    sql: ${kb_servicio}/(1024*1024) ;;
  }

  measure: max_KB {
    group_label: "Volumen de datos"
    group_item_label: "Volumen máximo (KB)"
    type: max
    sql: ${kb_servicio} ;;
  }

  measure: count {
    type: count
    value_format_name: "id"
  }

  measure: lineas {
    type: count_distinct
    sql: ${abonado} ;;
  }

}
