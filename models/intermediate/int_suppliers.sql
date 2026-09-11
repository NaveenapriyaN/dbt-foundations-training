-- {{ config(materialized='incremental', unique_key='supplier_id') }}

-- with supplier as (

--     select supplier_id, n.sname supplier_name, s.* exclude (supplier_id, supplier_name) 
--     from {{ ref('stg_suppliers') }} s
--     join dbt_naveena.supplier_names n on s.supplier_id = n.skey

--     {% if is_incremental() %}
--     where updated_time > (select max(updated_time) from {{ this }})
--     {% endif %} )

-- select * from supplier;


{{ config(materialized='incremental', unique_key='supplier_id',
incremental_predicates = ['DBT_INTERNAL_SOURCE.account_balance > 9900']) }}

with supplier as (

    select supplier_id, n.sname supplier_name, s.* exclude (supplier_id, supplier_name) 
    from {{ ref('stg_suppliers') }} s
    join dbt_murali.supplier_names n on s.supplier_id = n.skey 
    
    {% if is_incremental() %}
        where updated_time > (select max(updated_time) from {{ this }})
    {% endif %}
    )



select * from supplier


-- update suppliers set s_acctbal = 2000, updated_time = current_timestamp() where s_suppkey = 4;
-- update suppliers set s_acctbal = 12000, updated_time = current_timestamp() where s_suppkey = 3;


 
