connection: "athena_datalake"

include: "*.view.lkml"
include: "../../tableau_tool/*.view.lkml"

explore: ranking_of_first_purchase_by_material_uekusa {
  label: "素材別入会後初回購入数"
  description: "素材別入会後初回購入数"
}
