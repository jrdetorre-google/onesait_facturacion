view: cuentas {
  sql_table_name: `onesait_facturacion.cuentas` ;;
  label: "Información del cliente"

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${cliente_id}, ${cuenta_facturacion_id} ;;
  }

  dimension: cif {
    label: "NIF"
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

  dimension: cuenta_facturacion_id {
    type: string
    sql: ${TABLE}.cuenta_facturacion_id ;;
  }

  dimension: iban {
    label: "IBAN"
    type: string
    sql: ${TABLE}.IBAN ;;
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

  dimension: nombre_cliente {
    label: "Titular"
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
