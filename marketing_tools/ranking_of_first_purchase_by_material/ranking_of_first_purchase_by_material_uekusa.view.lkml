include: "../../tableau_tool/fact_purchase_summary.view.lkml"

view: ranking_of_first_purchase_by_material_uekusa {
  extends: [fact_purchase_summary]

  suggestions: yes
  dimension_group: process_date {
    timeframes: [date, year, month, week]
  }

  measure: rank_of_first_purchase_within_1_day_after_subscription {
    description: "期間入会後初回購入数順位"
    label: "期間入会後初回購入数順位"
    type: number
    sql: ROW_NUMBER() OVER(ORDER BY ${first_purchase_within_1_day_after_subscription} DESC) ;;
  }
}
