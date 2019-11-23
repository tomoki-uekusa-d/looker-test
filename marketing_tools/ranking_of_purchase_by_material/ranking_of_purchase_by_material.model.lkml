connection: "athena_datalake"

include: "*.view.lkml"
include: "../../tableau_tool/*.view.lkml"

explore: ranking_of_purchase_by_material_uekusa {
  label: "素材別購入ランキング"
  description: "素材別購入ランキング"
  join: dim_material {
    sql_on:
      ${ranking_of_purchase_by_material.content_id} = CAST(${dim_material.material_id} AS VARCHAR) AND
      ${dim_material.valid_end} IS NULL
      ;;
    type: inner
    relationship: many_to_many
  }
  join: dim_exp_1 {
    from: dim_expression
    sql_on:
      ${ranking_of_purchase_by_material.project} = ${dim_exp_1.project} AND
      ${dim_material.file_type_id} = ${dim_exp_1.key} AND
      ${dim_exp_1.measure} = 'file_type_id' AND
      ${dim_exp_1.property} = 'name'
      ;;
    relationship: many_to_many
  }
  join: dim_exp_2 {
    from: dim_expression
    sql_on:
      ${ranking_of_purchase_by_material.project} = ${dim_exp_2.project} AND
      ${ranking_of_purchase_by_material.site_id} = ${dim_exp_2.key} AND
      ${dim_exp_2.measure} = 'site' AND
      ${dim_exp_2.property} = 'name'
      ;;
    relationship: many_to_many
  }
  join: dim_exp_3 {
    from: dim_expression
    sql_on:
      ${ranking_of_purchase_by_material.project} = ${dim_exp_3.project} AND
      ${ranking_of_purchase_by_material.site_id} = ${dim_exp_3.key} AND
      ${dim_exp_3.measure} = 'site' AND
      ${dim_exp_3.property} = 'category'
      ;;
    relationship: many_to_many
  }
  join: dim_exp_4 {
    from: dim_expression
    sql_on:
      ${ranking_of_purchase_by_material.project} = ${dim_exp_4.project} AND
      CAST(${ranking_of_purchase_by_material.payment_method_id} AS VARCHAR) = ${dim_exp_4.key} AND
      ${dim_exp_4.measure} = 'payment_method_id' AND
      ${dim_exp_4.property} = 'name'
      ;;
    relationship: many_to_many
  }
}
