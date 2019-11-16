connection: "athena_datalake"

include: "*.view.lkml"

explore: ranking_purchase_by_artist_for_test {
  join: dim_material_for_test {
      sql_on: ${ranking_purchase_by_artist_for_test.content_id} = CAST(${dim_material_for_test.material_id} AS VARCHAR) AND ${dim_material_for_test.valid_end} IS NULL ;;
      type: inner
      relationship: one_to_many
    }
}
explore: fact_purchase_summary_for_test {}
explore: dim_material_for_test {}
explore: dim_expression_for_test {}
