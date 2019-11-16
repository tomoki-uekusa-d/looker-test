include: "fact_purchase_summary.view.lkml"

view: ranking_purchase_by_artist_for_test {
  extends: [fact_purchase_summary_for_test]
  suggestions: yes

  # dimensions
  dimension: content_name {
    description: "コンテンツ名"
    label: "コンテンツ名"
    hidden: no
    sql: ${dim_material_for_test.material_name} ;;
  }
  #############################################
  dimension: content_id {
    description: "コンテンツID"
    label: "コンテンツID"
    hidden: no
    sql: ${TABLE}.content_id;;
  }
  # dimension: content_name {
  #   description: "コンテンツ名"
  #   label: "コンテンツ名"
  #   hidden: no
  #   sql: MAX(${TABLE}.material_name) ;;
  # }
  # dimension: artist_id {
  #   description: "アーティストID"
  #   label: "アーティストID"
  #   hidden: no
  #   sql: MAX(${TABLE}.artist_id) ;;
  # }
  # dimension: artist_name {
  #   description: "アーティスト名"
  #   label: "アーティスト名"
  #   hidden: no
  #   sql: MAX(${TABLE}.artist_name) ;;
  # }
  # dimension: music_name {
  #   description: "アーティスト名"
  #   label: "アーティスト名"
  #   hidden: no
  #   sql: MAX(${TABLE}.artist_name) ;;
  # }
  # dimension: file_type_id {
  #   description: "ファイルタイプID"
  #   label: "ファイルタイプID"
  #   hidden: no
  #   sql: MAX(${TABLE}.file_type_id) ;;
  # }
  # dimension: display_type_id {
  #   description: "ディスプレイタイプID"
  #   label: "ディスプレイタイプID"
  #   hidden: no
  #   sql: MAX(${TABLE}.display_type_id) ;;
  # }
  #############################################

  # measures
  #############################################
  # measure: total_sells {
  #   description: "購入数"
  #   label: "購入数"
  #   type: number
  #   sql: ${sells_point} + ${sells_payment} ;;
  # }
  # measure: sells_point {
  #   description: "購入数[ポイント消費]"
  #   label: "購入数[ポイント消費]"
  #   type: sum
  #   sql: ${value} ;;
  #   filters: {
  #     field: measure
  #     value: "purchase[point]"
  #   }
  # }
  # measure: sells_payment {
  #   description: "購入数[個別課金]"
  #   label: "購入数[個別課金]"
  #   type: sum
  #   sql: ${value} ;;
  #   filters: {
  #     field: measure
  #     value: "purchase[payment]"
  #   }
  # }
  # measure: rank {
  #   description: "購入数順位"
  #   label: "購入数順位"
  #   type: number
  #   sql: ROW_NUMBER() OVER(ORDER BY ${total_sells} DESC) ;;
  # }
  #############################################
}
