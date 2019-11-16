include: "dim_material.view.lkml"

view: fact_purchase_summary_for_test {
  extends: [dim_material_for_test]
  suggestions: yes

  # dimensions
  dimension: content_id {
    description: "コンテンツID"
    label: "コンテンツID"
    sql: ${TABLE}.content_id ;;
  }
  dimension: content_name {
    description: "コンテンツ名"
    label: "コンテンツ名"
    sql: MAX(${TABLE}.material_name) ;;
  }
  dimension: artist_id {
    description: "アーティストID"
    label: "アーティストID"
    sql: MAX(${TABLE}.artist_id) ;;
  }
  dimension: artist_name {
    description: "アーティスト名"
    label: "アーティスト名"
    sql: MAX(${TABLE}.artist_name) ;;
  }
  dimension: music_name {
    description: "アーティスト名"
    label: "アーティスト名"
    sql: MAX(${TABLE}.artist_name) ;;
  }
  dimension: file_type_id {
    description: "ファイルタイプID"
    label: "ファイルタイプID"
    sql: MAX(${TABLE}.file_type_id) ;;
  }
  dimension: display_type_id {
    description: "ディスプレイタイプID"
    label: "ディスプレイタイプID"
    sql: MAX(${TABLE}.display_type_id) ;;
  }


  #############################################
  # dimension: content_id {
  #   description: "コンテンツID"
  #   label: "コンテンツID"
  #   type: string
  #   sql: ${TABLE}.content_id ;;
  # }
  # dimension_group: process_date {
  #   description: "対象年月日"
  #   label: "対象年月日"
  #   type: time
  #   timeframes: [date]
  #   sql: date_parse(${TABLE}.process_date,'%Y-%m-%d') ;;
  # }
  # dimension: point_consumed {
  #   description: "消費ポイント数"
  #   label: "消費ポイント数"
  #   type: number
  #   sql: ${TABLE}.point_consumed ;;
  # }
  # dimension: measure {
  #   description: "measure"
  #   label: "measure"
  #   type: string
  #   sql: ${TABLE}.measure ;;
  # }
  # dimension: value {
  #   description: "value"
  #   label: "value"
  #   type: number
  #   sql: ${TABLE}.value ;;
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
