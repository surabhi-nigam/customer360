SELECT 
    concat(contacts.id,transactions.id) as id,
	contacts.id as contact_id,
	contacts.user_name,
	contacts.name, 
	contacts.gender, 
	contacts.address, 
	contacts.email_address,
    contacts.birth_date, 
	contacts._loaded_at_utc,
    transactions.id as transaction_id,
    transactions.transaction_date,
    transactions.amount,
    transactions.item_count,
    transactions.category
FROM {{ ref('stg_web__transactions') }} as transactions
INNER JOIN {{ ref('stg_sf__contacts') }} as contacts ON contacts.id = transactions.contact_id

