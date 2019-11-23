SELECT
    s.payment_method_id AS payment_method_id,
    s.amount_paid AS amount_paid,
    s.amount_paid_with_tax AS amount_paid_with_tax,
    s.purchase_unit AS purchase_unit,
    s.point_consumed AS point_consumed,
    s.site_id AS site_id,
    s.content_id AS content_id,
    MAX(material.material_name) AS content_name,
    MAX(material.file_type_id) AS file_type_id,
    MAX(material.display_type_id) AS display_type_id,
    MAX(material.music_id) AS product_id,
    MAX(material.artist_id) AS artist_id,
    MAX(material.artist_name) AS artist_name,
    MAX(e1.value) AS file_type_name,
    MAX(e2.value) AS site_name,
    MAX(e3.value) AS site_category_name,
    MAX(e4.value) AS payment_method_name,
    SUM(CASE WHEN s.measure = 'first_purchase_within_1_day_after_subscription' THEN s.value ELSE 0 END) AS "first_purchase_within_1_day_after_subscription",
    SUM(CASE WHEN s.measure = 'purchase_sales[payment]' THEN s.value ELSE 0 END) AS "purchase_sales[payment]",
    SUM(CASE WHEN s.measure = 'purchase_sales[point]' THEN s.value ELSE 0 END) AS "purchase_sales[point]",
    SUM(CASE WHEN s.measure = 'purchase[payment]' THEN s.value ELSE 0 END) AS "purchase[payment]",
    SUM(CASE WHEN s.measure = 'purchase[point]' THEN s.value ELSE 0 END) AS "purchase[point]",
    s.project,
    s.data_source,
    cast(s.process_date as date) AS target_date
FROM "tableau_tool".fact_purchase_summary s
JOIN "tableau_tool".dim_material material ON s.content_id=cast(material.material_id as varchar) AND material.valid_end is NULL
LEFT JOIN "tableau_tool".dim_expression e1 ON s.project=e1.project AND material.file_type_id=e1.key AND e1.measure='file_type_id' AND e1.property='name'
LEFT JOIN "tableau_tool".dim_expression e2 ON s.project=e2.project AND s.site_id=e2.key AND e2.measure='site' AND e2.property='name'
LEFT JOIN "tableau_tool".dim_expression e3 ON s.project=e3.project AND s.site_id=e3.key AND e3.measure='site' AND e3.property='category'
LEFT JOIN "tableau_tool".dim_expression e4 ON s.project=e4.project AND cast(s.payment_method_id as varchar)=e4.key AND e4.measure='payment_method_id' AND e4.property='name'
where s.process_date < date_format((current_date - interval '1' day), '%Y-%m-%d')
GROUP BY s.content_id, s.project, s.data_source, s.payment_method_id, s.amount_paid, s.amount_paid_with_tax, s.purchase_unit, s.point_consumed, s.site_id, s.process_date
