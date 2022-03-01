select 
    id as user_belt_id,
    color,
    status,
    user_id,
    discipline_id,
    progression
from {{ source('blackbelt', 'user_belt') }}