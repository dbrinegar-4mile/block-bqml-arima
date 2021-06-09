include: "/explores/field_suggestions.explore"

view: arima_training_data {
  label: "[3] BQML: Select Training Data"
  derived_table: {
    persist_for: "1 second"
    sql_create: CREATE OR REPLACE VIEW @{looker_temp_dataset_name}.{% parameter model_name.select_model_name %}_arima_training_data_{{ _explore._name }}
                  AS  SELECT {% parameter select_time_column %}
                        , {% parameter select_data_column %}
                      FROM ${input_data.SQL_TABLE_NAME}
    ;;
  }

  parameter: select_time_column {
    label: "Select a Time Field (REQUIRED)"
    description: "Choose the field that indicates the date or time of the data you want to forecast"
    type: unquoted
    suggest_explore: field_suggestions
    suggest_dimension: field_suggestions.column_name
  }

  parameter: select_data_column {
    label: "Select the Data Field (REQUIRED)"
    description: "Choose the field that contains the data you want to forecast"
    type: unquoted
    suggest_explore: field_suggestions
    suggest_dimension: field_suggestions.column_name
  }
}