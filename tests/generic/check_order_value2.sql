{% test order_values(model, column_name, val) %}

select *
from {{ model }}
where {{ column_name }} < {{ val }}

{% endtest %}


-- select order_id, total_price ordertotal 
-- from analytics.dbt_murali.stg_orders where (ordertotal<=880);

