view: ranking_purchase_by_artist {
  sql_table_name: tableau_tool.fact_purchase_summary ;;

  suggestions: yes

  dimension: content_id {
    description: "コンテンツID"
    label: "コンテンツID"
    type: string
    sql: ${TABLE}.content_id ;;
  }

  dimension_group: process_date {
    description: "対象年月日"
    label: "対象年月日"
    type: time
    timeframes: [date]
    sql: date_parse(${TABLE}.process_date,'%Y-%m-%d') ;;
  }
  dimension: point_consumed {
    description: "消費ポイント数"
    label: "消費ポイント数"
    type: number
    sql: ${TABLE}.point_consumed ;;
  }
  dimension: measure {
    description: "measure"
    label: "measure"
    type: string
    sql: ${TABLE}.measure ;;
  }
  dimension: value {
    description: "value"
    label: "value"
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: total_sells {
    description: "購入数"
    label: "購入数"
    type: number
    sql: ${sells_point} + ${sells_payment} ;;
  }
  measure: sells_point {
    description: "購入数[ポイント消費]"
    label: "購入数[ポイント消費]"
    type: sum
    sql: ${value} ;;
    filters: {
      field: measure
      value: "purchase[point]"
    }
  }
  measure: sells_payment {
    description: "購入数[個別課金]"
    label: "購入数[個別課金]"
    type: sum
    sql: ${value} ;;
    filters: {
      field: measure
      value: "purchase[payment]"
    }
  }
  measure: rank {
    description: "購入数順位"
    label: "購入数順位"
    type: number
    sql: ROW_NUMBER() OVER(ORDER BY ${total_sells} DESC) ;;
  }
}
