
SELECT 
    LastName, 
    FirstName, 
    orders.orderID, 
    products.productid, 
    quantity, 
    price, 
    sum(quantity*price) as salesamt
FROM 
    ((employees
    INNER JOIN orders ON employees.employeeid = orders.employeeid)
    INNER JOIN orderdetails ON orders.orderid = orderdetails.orderid)
    INNER JOIN products ON orderdetails.productid = products.productid
    
group by orders.orderid    
order by salesamt desc
limit 5
