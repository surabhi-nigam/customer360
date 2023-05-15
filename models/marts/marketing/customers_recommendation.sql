  SELECT *
FROM (
   SELECT id,
   category as recommended_category,
   sum(amount) as total_spend,
          rank() over (partition by id order by sum(amount) desc) as rank
   FROM {{ ref('contacts_joined_with_transactions') }}
   group by id,category
) t
WHERE rank <= 3
order by 1,3
