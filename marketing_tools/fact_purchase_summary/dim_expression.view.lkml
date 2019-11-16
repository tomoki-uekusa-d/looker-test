view: dim_expression_for_test {
  sql_table_name: tableau_tool.dim_material ;;

  suggestions: yes

  # dimensins
  dimension: measure {
    description: "measure"
    label: "measure"
    type: string
    sql: ${TABLE}.measure ;;
  }
  dimension: property {
    description: "property"
    label: "property"
    type: string
    sql: ${TABLE}.property ;;
  }
  dimension: key {
    description: "key"
    label: "key"
    type: string
    sql: ${TABLE}.key ;;
  }
  dimension: project {
    description: "project"
    label: "project"
    type: string
    sql: ${TABLE}.project ;;
  }
}
