with user_belt as (
    select * from {{ ref('dim_user_belt')}}
    where status = 'VALIDATED'
),

final as (
    select 
        user_belt.color,
        sum(user_belt.days_from_creation)/nullif(count(user_belt.days_from_creation),0) as moyenne
    from user_belt
    group by user_belt.color
)

select * from final