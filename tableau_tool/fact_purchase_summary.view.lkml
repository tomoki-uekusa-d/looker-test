view: fact_purchase_summary {
  sql_table_name: tableau_tool.fact_purchase_summary ;;
  suggestions: yes

  # dimensions
  dimension: purchase_summary_key {
    description: "purchase_summary_key"
    label: "purchase_summary_key"
    type: string
    hidden: yes
    sql: ${TABLE}.purchase_summary_key ;;
  }
  dimension: project {
    description: "プロジェクト"
    label: "プロジェクト"
    type: string
    sql: ${TABLE}.project ;;
  }
  dimension: site_id {
    description: "サイトID"
    label: "サイトID"
    type: string
    sql: ${TABLE}.site_id ;;
  }
  dimension: content_id {
    description: "コンテンツID"
    label: "コンテンツID"
    type: string
    sql: ${TABLE}.content_id ;;
  }
  dimension: payment_method_id {
    description: "payment_method_id"
    label: "payment_method_id"
    type: number
    sql: ${TABLE}.payment_method_id ;;
  }
  dimension: point_consumed {
    description: "消費ポイント数"
    label: "消費ポイント数"
    type: number
    sql: ${TABLE}.point_consumed ;;
  }
  dimension: amount_paid {
    description: "消費金額"
    label: "消費金額"
    type: number
    sql: ${TABLE}.amount_paid ;;
  }
  dimension: amount_paid_with_tax {
    description: "消費金額(税込み)"
    label: "消費金額(税込み)"
    type: number
    sql: ${TABLE}.amount_paid_with_tax ;;
  }
  dimension: purchase_unit {
    description: "購入単位ID"
    label: "購入単位ID"
    type: number
    hidden: yes
    sql: ${TABLE}.purchase_unit ;;
  }
  dimension: measure {
    description: "measure"
    label: "measure"
    type: string
    hidden: yes
    sql: ${TABLE}.measure ;;
  }
  dimension: value {
    description: "value"
    label: "value"
    type: number
    hidden: yes
    sql: ${TABLE}.value ;;
  }
  dimension: updated_time {
    description: "updated_time"
    label: "updated_time"
    type: date_time
    hidden: yes
    sql: ${TABLE}.updated_time ;;
  }
  dimension: updated_date {
    description: "updated_date"
    label: "updated_date"
    type: date_time
    hidden: yes
    sql: ${TABLE}.updated_date ;;
  }
  dimension: data_source {
    description: "data_source"
    label: "data_source"
    type: string
    sql: ${TABLE}.data_source ;;
  }
  dimension: process_date {
    description: "process_date"
    label: "process_date"
    type: string
    hidden: yes
    type: time
    timeframes: [date, year, month, week]
    sql: ${TABLE}.process_date ;;
  }
}
