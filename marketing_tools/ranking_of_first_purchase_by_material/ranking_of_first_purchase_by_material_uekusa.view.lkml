include: "../ranking_of_purchase_by_material/ranking_of_purchase_by_material_uekusa.view.lkml"

view: ranking_of_first_purchase_by_material_uekusa {
  extends: [ranking_of_purchase_by_material_uekusa]

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
