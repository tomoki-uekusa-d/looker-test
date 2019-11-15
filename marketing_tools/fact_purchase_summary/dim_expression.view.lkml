view: dim_expression_for_test {
  sql_table_name: tableau_tool.fact_purchase_summary ;;

  suggestions: yes

  # dimensins
  # dimension: content_id {
  #   description: "コンテンツID"
  #   label: "コンテンツID"
  #   type: string
  #   sql: ${TABLE}.content_id ;;
  # }

  # measures
  # measure: total_sells {
  #   description: "購入数"
  #   label: "購入数"
  #   type: number
  #   sql: ${sells_point} + ${sells_payment} ;;
  # }
}
