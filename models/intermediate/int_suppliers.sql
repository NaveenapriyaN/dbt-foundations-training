with supplier as (

    select supplier_id, n.sname supplier_name, s.* exclude (supplier_id, supplier_name) 
    from {{ ref('stg_suppliers') }} s
    -- 🌟 Updated to use the dynamic source macro:
    join {{ source('ext_murali', 'supplier_names') }} n on s.supplier_id = n.skey 
    
    {% if is_incremental() %}
        where updated_time > (select max(updated_time) from {{ this }})
    {% endif %}
)

select * from supplier
