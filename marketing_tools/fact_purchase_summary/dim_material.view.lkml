view: dim_material_for_test {
  sql_table_name: tableau_tool.dim_material ;;

  suggestions: yes

  # dimensins
  dimension: material_key {
    description: "マテリアルキー"
    label: "マテリアルキー"
    type: string
    sql: ${TABLE}.material_key ;;
  }
  dimension: material_id {
    description: "マテリアルID"
    label: "マテリアルID"
    type: string
    sql: ${TABLE}.material_id ;;
  }
  dimension: material_name {
    description: "マテリアル名"
    label: "マテリアル名"
    type: string
    sql: ${TABLE}.material_name ;;
  }
  dimension: material_name_for_sort {
    description: "マテリアル名(ソート用)"
    label: "マテリアル名(ソート用)"
    type: string
    sql: ${TABLE}.material_name_for_sort ;;
  }
  dimension: music_id {
    description: "楽曲ID"
    label: "楽曲ID"
    type: bigint
    sql: ${TABLE}.music_id ;;
  }
  dimension: artist_id {
    description: "アーティストID"
    label: "アーティストID"
    type: bigint
    sql: ${TABLE}.artist_id ;;
  }
  dimension: artist_name {
    description: "アーティスト名"
    label: "アーティスト名"
    type: string
    sql: ${TABLE}.artist_name ;;
  }
  dimension: ad_copy {
    description: "ad_copy ※詳細不明"
    label: "ad_copy"
    type: string
    sql: ${TABLE}.ad_copy ;;
  }
  dimension: file_type_id {
    description: "file_type_id ※詳細不明"
    label: "file_type_id"
    type: string
    sql: ${TABLE}.file_type_id ;;
  }
  dimension: display_type_id {
    description: "display_type_id ※詳細不明"
    label: "display_type_id"
    type: string
    sql: ${TABLE}.display_type_id ;;
  }
  dimension: arrangeable {
    description: "arrangeable ※詳細不明"
    label: "arrangeable"
    type: number
    sql: ${TABLE}.arrangeable ;;
  }
  dimension: is_sample_enable {
    description: "is_sample_enable ※詳細不明"
    label: "is_sample_enable"
    type: number
    sql: ${TABLE}.is_sample_enable ;;
  }
  dimension: charge_term {
    description: "charge_term"
    label: "charge_term ※詳細不明"
    type: number
    sql: ${TABLE}.charge_term ;;
  }
  dimension: charge_term_unit {
    description: "charge_term_unit ※詳細不明"
    label: "charge_term_unit"
    type: number
    sql: ${TABLE}.charge_term_unit ;;
  }
  dimension: created_date {
    description: "created_date"
    label: "created_date"
    type: date_time
    sql: ${TABLE}.created_date ;;
  }
  dimension: updated_date {
    description: "updated_date"
    label: "updated_date"
    type: date_time
    sql: ${TABLE}.updated_date ;;
  }
  dimension: valid_begin {
    description: "valid_begin"
    label: "valid_begin"
    type: date_time
    sql: ${TABLE}.valid_begin ;;
  }
  dimension: valid_end {
    description: "valid_end"
    label: "valid_end"
    type: date_time
    sql: ${TABLE}.valid_end ;;
  }

  # measures
  # measure: total_sells {
  #   description: "購入数"
  #   label: "購入数"
  #   type: number
  #   sql: ${sells_point} + ${sells_payment} ;;
  # }
}
