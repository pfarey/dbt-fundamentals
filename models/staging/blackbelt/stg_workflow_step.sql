select 
    id as workflow_id,
    status,
    cast (last_modified_date as date) as last_date,
    cast (created_date as date)
from {{ source('blackbelt', 'workflow_step') }}