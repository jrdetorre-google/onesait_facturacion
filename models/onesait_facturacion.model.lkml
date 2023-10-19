# Define the database connection to be used for this model.
connection: "onesait_facturacion"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: onesait_facturacion_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: onesait_facturacion_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Onesait Facturacion"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

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
