with users as (
    select * from {{ ref('stg_jhi_user')}}
),
user_belt as (
    select * from {{ ref('stg_user_belt')}}
),
dicipline as (
    select * from {{ ref('stg_discipline')}}
),

final as (
    select
        users.user_id,
        users.first_name,
        users.last_name,
        users.email,
        users.agency,
        user_belt.color,
        user_belt.status,
        user_belt.discipline_id,
        user_belt.progression
    from users
    left join user_belt using (user_id)
)
select * from final