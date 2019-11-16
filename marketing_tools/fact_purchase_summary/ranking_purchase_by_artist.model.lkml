connection: "athena_datalake"

include: "*.view.lkml"

explore: ranking_purchase_by_artist_for_test {
  join: dim_material_for_test {
    sql_on:
      ${ranking_purchase_by_artist_for_test.content_id} = CAST(${dim_material_for_test.material_id} AS VARCHAR) AND
      ${dim_material_for_test.valid_end} IS NULL
      ;;
    type: inner
    relationship: many_to_many
  }
  join: dim_exp_1 {
    from: dim_expression_for_test
    sql_on:
      ${ranking_purchase_by_artist_for_test.project} = ${dim_exp_1.project} AND
      ${dim_material_for_test.file_type_id} = ${dim_exp_1.key} AND
      ${dim_exp_1.measure} = 'file_type_id' AND
      ${dim_exp_1.property} = 'name'
      ;;
    relationship: many_to_many
  }
  join: dim_exp_2 {
    from: dim_expression_for_test
    sql_on:
      ${ranking_purchase_by_artist_for_test.project} = ${dim_exp_2.project} AND
      ${ranking_purchase_by_artist_for_test.site_id} = ${dim_exp_2.key} AND
      ${dim_exp_2.measure} = 'site' AND
      ${dim_exp_2.property} = 'name'
      ;;
    relationship: many_to_many
  }
  join: dim_exp_3 {
    from: dim_expression_for_test
    sql_on:
      ${ranking_purchase_by_artist_for_test.project} = ${dim_exp_3.project} AND
      ${ranking_purchase_by_artist_for_test.site_id} = ${dim_exp_3.key} AND
      ${dim_exp_3.measure} = 'site' AND
      ${dim_exp_3.property} = 'category'
      ;;
    relationship: many_to_many
  }
  join: dim_exp_4 {
    from: dim_expression_for_test
    sql_on:
      ${ranking_purchase_by_artist_for_test.project} = ${dim_exp_4.project} AND
      CAST(${ranking_purchase_by_artist_for_test.payment_method_id} AS VARCHAR) = ${dim_exp_4.key} AND
      ${dim_exp_4.measure} = 'payment_method_id' AND
      ${dim_exp_4.property} = 'name'
      ;;
    relationship: many_to_many
  }
}
explore: fact_purchase_summary_for_test {}
explore: dim_material_for_test {}
explore: dim_expression_for_test {}
