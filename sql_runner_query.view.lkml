# view: sql_runner_query {
#   derived_table: {
#     sql: SELECT
#         ROW_NUMBER() OVER(ORDER BY purchase_amount DESC) AS paid_rank,
#         *
#       FROM (
#       SELECT
#         content_id,
#         point_consumed,
#         SUM(value) AS purchase_amount
#       FROM
#         tableau_tool.fact_purchase_summary
#       WHERE
#         process_date='2019-11-13' AND
#         measure IN ('purchase[point]', 'purchase[payment]')
#       GROUP BY
#         content_id,
#         point_consumed
#       )
#       LIMIT 100
#        ;;
#   }
#
#   suggestions: no
#
#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }
#
#   dimension: paid_rank {
#     type: number
#     sql: ${TABLE}.paid_rank ;;
#   }
#
#   dimension: content_id {
#     type: string
#     sql: ${TABLE}.content_id ;;
#   }
#
#   dimension: point_consumed {
#     type: number
#     sql: ${TABLE}.point_consumed ;;
#   }
#
#   dimension: purchase_amount {
#     type: number
#     sql: ${TABLE}.purchase_amount ;;
#   }
#
#   set: detail {
#     fields: [paid_rank, content_id, point_consumed, purchase_amount]
#   }
# }
