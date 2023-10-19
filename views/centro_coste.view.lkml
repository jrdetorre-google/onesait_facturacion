view: centro_coste {
  sql_table_name: `onesait_facturacion.centro_coste` ;;
  drill_fields: [centro_coste_id]

  dimension: centro_coste_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.centro_coste_id ;;
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

  dimension: municipio {
    type: string
    sql: ${TABLE}.municipio ;;
  }

  dimension: nombre_centro_coste {
    type: string
    sql: ${TABLE}.nombre_centro_coste ;;
  }

  measure: count {
    type: count
    drill_fields: [centro_coste_id]
  }

  measure: total_codigo_postal {
    type: sum
    sql: ${codigo_postal} ;;  }

  measure: average_codigo_postal {
    type: average
    sql: ${codigo_postal} ;;  }
}
