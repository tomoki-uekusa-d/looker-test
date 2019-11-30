include: "../../tableau_tool/fact_purchase_summary.view.lkml"

view: ranking_of_purchase_by_material_uekusa {
  extends: [fact_purchase_summary]

  suggestions: yes

  # dimensions
  dimension: content_id {
    primary_key: yes
  }
  dimension: payment_method_id {
    description: "payment_method_id"
    label: "payment_method_id"
    sql: ${TABLE}.payment_method_id ;;
  }
  dimension: content_name {
    description: "コンテンツ名"
    label: "コンテンツ名"
    sql: ${dim_material.material_name} ;;
  }
  dimension: file_type_id {
    description: "ファイルタイプID"
    label: "ファイルタイプID"
    sql: ${dim_material.file_type_id} ;;
  }
  dimension: display_type_id {
    description: "ディスプレイタイプID"
    label: "ディスプレイタイプID"
    sql: ${dim_material.display_type_id} ;;
  }
  dimension: product_id {
    description: "楽曲ID"
    label: "楽曲ID"
    sql: ${dim_material.music_id} ;;
  }
  dimension: artist_id {
    description: "アーティストID"
    label: "アーティストID"
    sql: ${dim_material.artist_id} ;;
  }
  dimension: artist_name {
    description: "アーティスト名"
    label: "アーティスト名"
    sql: ${dim_material.artist_name} ;;
  }
  dimension: file_type_name {
    description: "ファイルタイプ名"
    label: "ファイルタイプ名"
    sql: ${dim_exp_1.value} ;;
  }
  dimension: site_name {
    description: "サイト名"
    label: "サイト名"
    sql: ${dim_exp_2.value} ;;
  }
  dimension: site_category_name {
    description: "サイトカテゴリ名"
    label: "サイトカテゴリ名"
    sql: ${dim_exp_3.value} ;;
  }
  dimension: payment_method_name {
    description: "決済方法"
    label: "決済方法"
    sql: ${dim_exp_4.value} ;;
  }
  dimension: purchase_unit_name {
    description: "購入単位"
    label: "購入単位"
    sql:  CASE
            WHEN ${purchase_unit} = 1 THEN '単品購入'
            WHEN ${purchase_unit} = 2 THEN 'パッケージ親購入'
            ELSE 'パッケージ子購入'
          END
    ;;
  }
  dimension: file_type {
    description: "ファイルタイプ([ファイルタイプID]: [ファイルタイプ名])"
    label: "ファイルタイプ"
    sql: CONCAT(${file_type_id}, ': ', ${file_type_name}) ;;
  }
  dimension_group: process_date {
    description: "対象年月日"
    label: "対象年月日"
    hidden: no
    type: time
    timeframes: [date]
    sql: date_parse(${TABLE}.process_date,'%Y-%m-%d') ;;
  }
  dimension rank_of_first_purchase_within_1_day_after_subscription_test :{
    description: "期間入会後初回購入数順位(テスト)"
    label: "期間入会後初回購入数順位(テスト)"
    sql: ${rank_of_first_purchase_within_1_day_after_subscription_test} ;;
  }

  # measures
  measure: first_purchase_within_1_day_after_subscription {
    description: "入会後初回購入[24時間以内]"
    label: "入会後初回購入[24時間以内]"
    sql: SUM(CASE WHEN ${TABLE}.measure = 'first_purchase_within_1_day_after_subscription' THEN ${TABLE}.value ELSE 0 END) ;;
  }
  measure: purchase_sales_payment {
    description: "売上[個別課金]"
    label: "売上[個別課金]"
    type: sum
    sql: SUM(CASE WHEN ${TABLE}.measure = 'purchase_sales[payment]' THEN ${TABLE}.value ELSE 0 END) ;;
  }
  measure: purchase_sales_point {
    description: "売上[ポイント消費]"
    label: "売上[ポイント消費]"
    sql: SUM(CASE WHEN ${TABLE}.measure = 'purchase_sales[payment]' THEN ${TABLE}.value ELSE 1 END) ;;
  }
  measure: purchase_payment {
    description: "購入数[個別課金]"
    label: "購入数[個別課金]"
    sql: SUM(CASE WHEN ${TABLE}.measure = 'purchase[payment]' THEN ${TABLE}.value ELSE 0 END) ;;
  }
  measure: purchase_point {
    description: "購入数[ポイント消費]"
    label: "購入数[ポイント消費]"
    sql: SUM(CASE WHEN ${TABLE}.measure = 'purchase[point]' THEN ${TABLE}.value ELSE 0 END) ;;
  }
  measure: total_purchase {
    description: "購入数"
    label: "購入数"
    type: number
    sql: ${purchase_point} + ${purchase_payment} ;;
  }
  measure: rank_total_ranking {
    description: "購入数順位"
    label: "購入数順位"
    type: number
    sql: ROW_NUMBER() OVER(ORDER BY ${total_purchase} DESC) ;;
  }
  measure: rank_of_first_purchase_within_1_day_after_subscription {
    description: "期間入会後初回購入数順位"
    label: "期間入会後初回購入数順位"
    type: running_total
    sql: ROW_NUMBER() OVER(ORDER BY ${first_purchase_within_1_day_after_subscription} DESC) ;;
  }

}
