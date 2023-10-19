# The name of this view in Looker is "Cuentas"
view: cuentas {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `onesait_facturacion.cuentas` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cif" in Explore.

  dimension: cif {
    type: string
    sql: ${TABLE}.CIF ;;
  }

  dimension: clave__de_cobro {
    type: number
    sql: ${TABLE}.clave__de_cobro ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_clave__de_cobro {
    type: sum
    sql: ${clave__de_cobro} ;;  }
  measure: average_clave__de_cobro {
    type: average
    sql: ${clave__de_cobro} ;;  }

  dimension: cliente_id {
    type: string
    sql: ${TABLE}.cliente_id ;;
  }

  dimension: codigo_postal {
    type: number
    sql: ${TABLE}.codigo_postal ;;
  }

  dimension: cuenta_facturacion_id {
    type: string
    sql: ${TABLE}.cuenta_facturacion_id ;;
  }

  dimension: direccion_1 {
    type: string
    sql: ${TABLE}.direccion_1 ;;
  }

  dimension: direccion_2 {
    type: string
    sql: ${TABLE}.direccion_2 ;;
  }

  dimension: iban {
    type: string
    sql: ${TABLE}.IBAN ;;
  }

  dimension: municipio {
    type: string
    sql: ${TABLE}.municipio ;;
  }

  dimension: nombre_cliente {
    type: string
    sql: ${TABLE}.nombre_cliente ;;
  }

  dimension: ventanilla {
    type: string
    sql: ${TABLE}.ventanilla ;;
  }
  measure: count {
    type: count
  }
}
