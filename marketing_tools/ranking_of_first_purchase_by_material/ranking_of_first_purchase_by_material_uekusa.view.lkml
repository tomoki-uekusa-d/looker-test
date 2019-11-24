include: "../../tableau_tool/fact_purchase_summary.view.lkml"

view: ranking_of_first_purchase_by_material_uekusa {
  extends: [fact_purchase_summary]

  suggestions: yes
  dimension_group: process_date {
    timeframes: [date, year, month, week]
  }
}
