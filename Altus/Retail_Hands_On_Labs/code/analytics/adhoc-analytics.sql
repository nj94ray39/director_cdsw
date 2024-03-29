-- Refresh the metadata
invalidate metadata;

-- Sample Queries
use retaildb;

--Products and URLs in one query
select product_name as 'Top products sold', regexp_replace(url,'%20',' ') as url 
    from (select row_number() over(order by r.revenue desc) as r, p.product_name, r.revenue 
      from products p 
      inner join(select oi.order_item_product_id, sum(cast(oi.order_item_subtotal as float)) as revenue 
                from order_items oi 
                inner join orders o on oi.order_item_order_id = o.order_id 
                where o.order_status <> 'CANCELED' 
                and o.order_status <> 'SUSPECTED_FRAUD'
                group by order_item_product_id) r 
      on p.product_id = r.order_item_product_id 
      order by r.revenue desc)as prod 
      inner join(select row_number() over(order by count(*) desc) as r,url as url, count(*) as count  
                from YOURNAMEHERE.tokenized_access_logs where url like '%\/product\/%'
                group by url order by count(*) desc) as web on prod.r=web.r limit 10;
