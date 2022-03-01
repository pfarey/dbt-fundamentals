select 
    id as discipline_id,
    title,
    description
from {{ source('blackbelt', 'discipline') }}