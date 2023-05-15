SELECT
*
from "dbt"."public"."contacts_joined_with_transactions"
where ({{ age_in_years('birth_date') }} +
EXTRACT('Year' FROM birth_date) = 2022
and EXTRACT('Month' FROM birth_date) <= EXTRACT('Month' FROM now()))
or  (  {{ age_in_years('birth_date') }} +
EXTRACT('Year' FROM birth_date) = 2023
and EXTRACT('Month' FROM birth_date) > EXTRACT('Month' FROM now()))