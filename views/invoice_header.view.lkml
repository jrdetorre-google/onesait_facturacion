# The name of this view in Looker is "Invoice Header"
view: invoice_header {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `onesait_facturacion.invoice_header` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cliente ID" in Explore.

  dimension: cliente_id {
    type: string
    sql: ${TABLE}.cliente_id ;;
  }

  dimension: cuenta_facturacion_id {
    type: string
    sql: ${TABLE}.cuenta_facturacion_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fecha_factura {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha_factura ;;
  }

  dimension: invoice_id {
    type: number
    sql: ${TABLE}.invoice_id ;;
  }
  measure: count {
    type: count
  }
}
