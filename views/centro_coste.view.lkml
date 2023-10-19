view: centro_coste {
  sql_table_name: `onesait_facturacion.centro_coste` ;;
  drill_fields: [centro_coste_id]
  label: "Centros de coste"

  dimension: centro_coste_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.centro_coste_id ;;
  }

  dimension: cuenta_facturacion_id {
    type: string
    sql: ${TABLE}.cuenta_facturacion_id ;;
  }

  dimension: direccion_1 {
    group_label: "Dirección"
    group_item_label: "Dirección 1"
    type: string
    sql: ${TABLE}.direccion_1 ;;
  }

  dimension: direccion_2 {
    group_label: "Dirección"
    group_item_label: "Dirección 2"
    type: string
    sql: ${TABLE}.direccion_2 ;;
  }

  dimension: municipio {
    group_label: "Dirección"
    group_item_label: "Municipio"
    type: string
    sql: ${TABLE}.municipio ;;
  }

  dimension: codigo_postal {
    group_label: "Dirección"
    group_item_label: "Código postal"
    type: number
    sql: ${TABLE}.codigo_postal ;;
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
