connection: "athena_datalake"

include: "*.view.lkml"

explore: ranking_purchase_by_artist_for_test {
  join: dim_material_for_test {
    sql_on:
      ${ranking_purchase_by_artist_for_test.content_id} = CAST(${dim_material_for_test.material_id} AS VARCHAR) AND
      ${dim_material_for_test.valid_end} IS NULL
      ;;
    type: inner
    relationship: one_to_many
  }
  join: dim_exp_1 {
    from: dim_expression_for_test
    sql_on:
      ${ranking_purchase_by_artist_for_test.project} = ${dim_exp_1.project} AND
      ${dim_material_for_test.file_type_id} = ${dim_exp_1.key} AND
      ${dim_exp_1.measure} = 'file_type_id' AND
      ${dim_exp_1.property} = 'name'
      ;;
    relationship: one_to_many
  }
}
explore: fact_purchase_summary_for_test {}
explore: dim_material_for_test {}
explore: dim_expression_for_test {}
