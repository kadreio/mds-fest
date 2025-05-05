{% macro capitalize_text(column_name) %}
    upper({{ column_name }})
{% endmacro %}