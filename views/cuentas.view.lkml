view: cuentas {
  sql_table_name: `onesait_facturacion.cuentas` ;;

  dimension: pk {
    primary_key: yes
    type: string
    sql: CONCAT(${cliente_id}, ${cuenta_facturacion_id} ;;
  }

  dimension: cif {
    type: string
    sql: ${TABLE}.CIF ;;
  }

  dimension: clave_de_cobro {
    type: number
    sql: ${TABLE}.clave__de_cobro ;;
  }

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
