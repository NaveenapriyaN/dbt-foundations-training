-- select
-- n_nationkey nation_id,
-- n_name name,
-- n_regionkey region_id,
-- n_comment comment
-- from sourcedb.mkmall.nations
with nation as (select
        n_nationkey as nation_id,
        n_name as name,
        n_regionkey as region_id,
        n_comment as comment
    from {{ source('src', 'nations') }}
)
select * from nation