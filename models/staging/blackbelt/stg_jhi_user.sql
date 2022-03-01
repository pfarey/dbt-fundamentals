select 
    id as user_id,
    first_name,
    last_name,
    email,
    agency
from {{ source('blackbelt', 'jhi_user') }}