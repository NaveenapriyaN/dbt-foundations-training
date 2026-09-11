{{config(store_failures=true)}}

select order_id, total_price
from {{ ref('stg_orders') }}
where (total_price < {{var('v_min_order')}})

-- select order_id, total_price ordertotal 
-- from analytics.dbt_murali.stg_orders where (ordertotal<=880);



