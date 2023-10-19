view: invoice_header {
  sql_table_name: `onesait_facturacion.invoice_header` ;;
  label: "Información de facturas"

  dimension: invoice_id {
    label: "Número de factura"
    primary_key: yes
    type: number
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: cliente_id {
    label: "Código de cliente"
    type: string
    sql: ${TABLE}.cliente_id ;;
  }

  dimension: cuenta_facturacion_id {
    type: string
    sql: ${TABLE}.cuenta_facturacion_id ;;
  }

  dimension_group: fecha_factura {
    label: "Fecha de emisión"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha_factura ;;
  }

  measure: count_invoice_id {
    label: "Número de facturas"
    type: count_distinct
    sql: ${invoice_id} ;;
    drill_fields: [cliente_id, fecha_factura_date]
  }
}
