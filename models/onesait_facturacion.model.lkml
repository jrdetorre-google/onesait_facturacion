# Define the database connection to be used for this model.
connection: "onesait_facturacion"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
datagroup: onesait_facturacion_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

persist_with: onesait_facturacion_default_datagroup

explore: centro_coste {}

explore: invoice_header {}

explore: cuentas {}

explore: facturacion {
  from: invoice_items
  join: invoice_header {
    relationship: many_to_one
    type: left_outer
    sql_on: ${facturacion.invoice_id} = ${invoice_header.invoice_id} ;;
  }
  join: centro_coste {
    relationship: one_to_many
    type: left_outer
    sql_on: ${invoice_header.cuenta_facturacion_id} = ${centro_coste.cuenta_facturacion_id};;
  }
  join: cuentas {
    relationship: one_to_one
    type: left_outer
    sql_on: ${invoice_header.cliente_id} = ${cuentas.cliente_id};;
  }

}
