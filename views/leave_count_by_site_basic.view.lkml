view: leave_count_by_site_basic {
  sql_table_name: looker.leave_count_by_site_basic ;;
  suggestions: no

  dimension: date {
    type: string
    sql: ${TABLE}."date" ;;
  }

  dimension: item_id {
    type: string
    sql: ${TABLE}.item_id ;;
  }

  dimension: p10 {
    type: number
    sql: ${TABLE}.p10 ;;
  }

  dimension: p50 {
    type: number
    sql: ${TABLE}.p50 ;;
  }

  dimension: p90 {
    type: number
    sql: ${TABLE}.p90 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
