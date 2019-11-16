connection: "athena_datalake"

include: "*.view.lkml"
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: ranking_purchase_by_artist_for_test {
  join: dim_material_for_test {
      sql_on: ${ranking_purchase_by_artist_for_test.content_id} = CAST(${dim_material_for_test.material_id} AS VARCHAR) ;;
    }
}
explore: fact_purchase_summary_for_test {}
explore: dim_material_for_test {}
explore: dim_expression_for_test {}
