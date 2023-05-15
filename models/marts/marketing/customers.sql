SELECT
    id,
    gender,
    {{ age_in_years('birth_date') }} AS age,
    sum(amount) as total_expense,
    sum(amount) filter (where category = 'Apps & Games') as "Apps & Games",
    sum(amount) filter (where category = 'Beauty') as Beauty,
    sum(amount) filter (where category = 'Books') as Books,
    sum(amount) filter (where category = 'Clothing, Shoes & Accessories') as "Clothing, Shoes & Accessories",
    sum(amount) filter (where category = 'Kitchen') as Kitchen,
    sum(amount) filter (where category = 'Movies & TV') as "Movies & TV",
    sum(amount) filter (where category = 'Sports, Fitness & Outdoors') as "Sports, Fitness & Outdoors",
    MIN(transaction_date) as first_purchase_date,
    MAX(transaction_date) as last_purchase_date
FROM {{ ref('contacts_joined_with_transactions') }}
GROUP BY
    1,2,3