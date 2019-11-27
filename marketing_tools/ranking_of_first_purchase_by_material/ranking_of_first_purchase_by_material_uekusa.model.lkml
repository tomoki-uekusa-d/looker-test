include: "*.view.lkml"
include: "../../tableau_tool/*.view.lkml"
include: "../ranking_of_purchase_by_material/*.lkml"

explore: ranking_of_first_purchase_by_material_uekusa {
  extends: [ranking_of_purchase_by_material_uekusa]
  label: "素材別入会後初回購入数"
  description: "素材別入会後初回購入数"
  # sql_always_where: ${ranking_of_purchase_by_material_uekusa.process_date_date} < DATE_FORMAT((CURRENT_DATE - INTERVAL '1' DAY), '%Y-%m-%d') ;;
}
