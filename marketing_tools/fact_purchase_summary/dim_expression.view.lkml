view: dim_expression_for_test {
  sql_table_name: tableau_tool.dim_material ;;

  suggestions: yes

  # dimensins
  dimension: measure {
    description: "measure"
    label: "measure"
    type: string
    hidden: yes
    sql: ${TABLE}.measure ;;
  }
  dimension: property {
    description: "property"
    label: "property"
    type: string
    hidden: yes
    sql: ${TABLE}.property ;;
  }
  dimension: key {
    description: "key"
    label: "key"
    type: string
    hidden: yes
    sql: ${TABLE}.key ;;
  }
  dimension: value {
    description: "value"
    label: "value"
    type: string
    hidden: yes
    sql: ${TABLE}.value ;;
  }
  dimension: project {
    description: "project"
    label: "project"
    type: string
    hidden: yes
    sql: ${TABLE}.project ;;
  }
}
