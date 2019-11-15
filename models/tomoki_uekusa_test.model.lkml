connection: "athena_datalake"

# include all the views
include: "/views/**/*.view"

datagroup: tomoki_uekusa_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: tomoki_uekusa_test_default_datagroup

explore: leave_count_by_site_basic {}
