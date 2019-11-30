include: "../ranking_of_purchase_by_material/ranking_of_purchase_by_material_uekusa.view.lkml"

view: ranking_of_first_purchase_by_material_uekusa {
  extends: [ranking_of_purchase_by_material_uekusa]

  suggestions: yes
  dimension_group: process_date {
    timeframes: [date, year, month, week]
  }
  measure: first_purchase_within_1_day_after_subscription {
    description: "入会後初回購入数合計"
    label: "入会後初回購入数合計"
    sql: SUM(CASE WHEN ${TABLE}.measure = 'first_purchase_within_1_day_after_subscription' THEN ${TABLE}.value ELSE 0 END) ;;
  }
}
