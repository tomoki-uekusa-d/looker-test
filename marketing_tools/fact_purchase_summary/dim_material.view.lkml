view: dim_material_for_test {
  sql_table_name: tableau_tool.dim_material ;;

  suggestions: yes

  # dimensins
  dimension: material_id {
    description: "コンテンツID"
    label: "コンテンツID"
    type: string
    sql: ${TABLE}.material_id ;;
  }
  dimension: material_name {
    description: "コンテンツ名"
    label: "コンテンツ名"
    type: string
    sql: ${TABLE}.material_name ;;
  }
  dimension: music_id {
    description: "music_id"
    label: "楽曲ID"
    type: string
    sql: ${TABLE}.music_id ;;
  }
  dimension: artist_id {
    description: "アーティストID"
    label: "アーティストID"
    type: string
    sql: ${TABLE}.artist_id ;;
  }
  dimension: artist_name {
    description: "アーティスト名"
    label: "アーティスト名"
    type: string
    sql: ${TABLE}.artist_name ;;
  }

  # measures
  # measure: total_sells {
  #   description: "購入数"
  #   label: "購入数"
  #   type: number
  #   sql: ${sells_point} + ${sells_payment} ;;
  # }
}
