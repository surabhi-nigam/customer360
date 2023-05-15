select
    *
from {{ ref('customers' )}}
where last_purchase_date < first_purchase_date