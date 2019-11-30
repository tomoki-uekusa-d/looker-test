include: "../ranking_of_purchase_by_material/ranking_of_purchase_by_material_uekusa.view.lkml"

view: ranking_of_first_purchase_by_material_uekusa {
  extends: [ranking_of_purchase_by_material_uekusa]

  suggestions: yes
  dimension_group: process_date {
    timeframes: [date, year, month, week]
  }
}
