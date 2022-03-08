with users as (
    select * from {{ ref('stg_jhi_user')}}
),
user_belt as (
    select * from {{ ref('stg_user_belt')}}
),
discipline as (
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
        discipline.title,
        user_belt.progression,
        discipline.description,
        user_belt.created_date,
        user_belt.last_date,
        datediff(day, user_belt.created_date, user_belt.last_date) as days_from_creation
    from users 
    left join user_belt
        ON users.USER_ID = user_belt.USER_ID
    left join discipline
        ON user_belt.discipline_id = discipline.discipline_id 
    WHERE 
        user_belt.color is NOT NULL
)
select * from final