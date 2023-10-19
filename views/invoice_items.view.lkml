# The name of this view in Looker is "Invoice Items"
view: invoice_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `onesait_facturacion.invoice_items` ;;
  drill_fields: [invoice_item_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: invoice_item_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Invoice_item_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Abonado" in Explore.

  dimension: abonado {
    type: number
    sql: ${TABLE}.Abonado ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  dimension: descripcion_servicio {
    type: string
    sql: ${TABLE}.Descripcion_servicio ;;
  }

  dimension: destino {
    type: number
    sql: ${TABLE}.Destino ;;
  }

  dimension: duracion_servicio {
    type: number
    sql: ${TABLE}.Duracion_servicio ;;
  }


  measure: total_duracion {
    type: sum
    sql: ${duracion_servicio} ;;  }

  measure: average_duracion {
    type: average
    sql: ${duracion_servicio} ;;  }

  measure: max_duracion {
    type: max
    sql: ${duracion_servicio} ;;  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  dimension: importe_servicio {
    type: number
    sql: ${TABLE}.Importe_servicio ;;
  }
  measure: total_importe{
    type: sum
    value_format_name: "eur"
    sql: ${importe_servicio}
    drill_fields: [abonado, importe_servicio];;
    }

  measure: average_importe{
    type: average
    value_format_name: "eur"
    sql: ${importe_servicio} ;;  }

  measure: max_importe {
    type: max
    value_format_name: "eur"
    sql: ${importe_servicio} ;;  }

  dimension: invoice_id {
    type: number
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: kb_servicio {
    type: number
    sql: ${TABLE}.KB_servicio ;;
  }

  measure: total_KB{
    type: sum
    sql: ${kb_servicio} ;;  }

  measure: average_KB{
    type: average
    sql: ${kb_servicio} ;;  }

  measure: max_KB {
    type: max
    sql: ${kb_servicio} ;;  }
  dimension: servicio {
    type: string
    sql: ${TABLE}.Servicio ;;
  }
  measure: count {
    type: count
    drill_fields: [invoice_item_id]
  }
}
