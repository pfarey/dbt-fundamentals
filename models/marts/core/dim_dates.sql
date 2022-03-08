with workflow as (
    select * from {{ ref('stg_workflow_step')}}
),

final as (
    select
        workflow_id,
        status,
        last_date,
        created_date,
        datediff(day, last_date, created_date) as difference_tps
    from workflow
    where status = 'VALIDATED'

)
select * from final