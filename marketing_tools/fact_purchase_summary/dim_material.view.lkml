view: dim_material_for_test {
  sql_table_name: tableau_tool.dim_material ;;

  suggestions: yes

  # dimensins
  dimension: content_id {
    description: "コンテンツID"
    label: "コンテンツID"
    type: string
    sql: MAX(${TABLE}.content_id) ;;
  }
  dimension: content_name {
    description: "コンテンツ名"
    label: "コンテンツ名"
    type: string
    sql: MAX(${TABLE}.content_name) ;;
  }
  dimension: music_id {
    description: "music_id"
    label: "楽曲ID"
    type: string
    sql: MAX(${TABLE}.music_id) ;;
  }
  dimension: artist_id {
    description: "アーティストID"
    label: "アーティストID"
    type: string
    sql: MAX(${TABLE}.artist_id) ;;
  }
  dimension: artist_name {
    description: "アーティスト名"
    label: "アーティスト名"
    type: string
    sql: MAX(${TABLE}.artist_name) ;;
  }

  # measures
  # measure: total_sells {
  #   description: "購入数"
  #   label: "購入数"
  #   type: number
  #   sql: ${sells_point} + ${sells_payment} ;;
  # }
}
