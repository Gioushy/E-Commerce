# E-Commerce Database Design
To begin with, this project is related to designing and maintaining a database system for a E-commerce web application as in the next section several ascpects will tackled
as entites, relations between entites and displaying Entity Relationship Diagram (ERD). <br/>

## Entites:
### Category:
As populary known to many websites such as Amazon many products may be grouped in categories which can please the user experience while browsing the website, the following
are the attributes of the category entity: <br/>
• name <br/>
• description <br/>
<br/>

### Product:
One of the main entites to be added to any ecommerce website as it is the core of the business, the following are the attributes of the product entity: <br/>
• name <br/>
• description <br/>
• price <br/>
• quantity <br/>
<br/>

### Customer:
Another main pillar of the business is the customer, as he is main target for any starting business, the following are the attributes of the customer entity: <br/>
• first name <br/>
• last name <br/>
• email <br/>
• password <br/>
<br/>

### Seller:
Another main pillar of the business is the seller of a specific product, as he is main supplier for products to be marketed on the website, the following are the attributes of the seller entity: <br/>
• name <br/>
• phone number <br/>
• email <br/>
• password <br/>
<br/>

### Order:
Orders define what is the business is all about as certain customers develop a liking into a certain product and they decide to purchase it (making an order) and this is simply how the business work. The following are the attributes of the order entity: <br/>
•	products ordered <br/>
• quantity of each product <br/>
• total cost <br/>
<br/>

## Relationships between entites:
In this section the relationships between entites will be discussed from the businness respective and later on viewing the ERD. <br/>

### Category-Product Relationship:
We can simply define the relationship into two sentences: <br/>
• "each category contains one or more products" <br/>
• "each product belongs to one or more categories" <br/>

### Category-Category Relationship:
We can simply define the relationship into two sentences: <br/>
• "each category contains zero, one or more sub-category" <br/>
• "each sub-category belongs to one categories" <br/>

### Order-Product Relationship:
We can simply define the relationship into two sentences: <br/>
• "each product can be ordered by zero, one or more products" <br/>
• "each order is and order for one or more products" <br/>

### Order-Customer Relationship:
We can simply define the relationship into one sentences: <br/>
• "each customer orders zero, one or more orders" <br/>

### Seller-Product Relationship:
We can simply define the relationship into one sentences: <br/>
• "each seller sells zero, one or more product" <br/>

## Entity Relationship Diagram (ERD):
As indicated from the above section that there are several types of relationships such: One-To-Many, One-To-Many Recursive, Many-To-Many. Therefore, additional entites are introduced in order to represent to many-to-many relationship (associative entity) which will be displayed in the following diagram: <br/>

![image](https://github.com/Gioushy/E-Commerce/assets/105521854/badcbb6b-0561-4304-bade-2fb547f78c56)


<br/>

 • [Data Definiton Language](https://github.com/Gioushy/E-Commerce/blob/main/ddl.sql) <br/>
 • [Queries Sample](https://github.com/Gioushy/E-Commerce/blob/main/sample.sql) <br/>
## Data Generation Functions:
In the below links are functions that are used to generate data for the whole database with 100 category, 1000 addresses, 10000 sellers, 100k products, 1 million customer, 2 million order and 5 million order_details: <br/>
• [Categories Data Generation Function](https://github.com/Gioushy/E-Commerce/blob/main/functions/categoryData.sql) <br/>
• [Addresses Data Generation Function](https://github.com/Gioushy/E-Commerce/blob/main/functions/addressData.sql) <br/>
• [Sellers Data Generation Function](https://github.com/Gioushy/E-Commerce/blob/main/functions/sellerData.sql) <br/>
• [Products Data Generation Function](https://github.com/Gioushy/E-Commerce/blob/main/functions/productData.sql) <br/>
• [Category_Products Data Generation Function](https://github.com/Gioushy/E-Commerce/blob/main/functions/category_productsData) <br/>
• [Customer Data Generation Function](https://github.com/Gioushy/E-Commerce/blob/main/functions/customerData.sql) <br/>
• [Orders Data Generation Function](https://github.com/Gioushy/E-Commerce/blob/main/functions/orderData.sql) <br/>
• [Order_Details Data Generation Function](https://github.com/Gioushy/E-Commerce/blob/main/functions/order_detailsData.sql) <br/>

## Optimization:
In the following are a collection of queries and each one has been optimized with a specific technique in order to decrease its excecution time and increase the efficency of the query: <br/>

• [Write SQL Query to Retrieve the total number of products in each category.](https://github.com/Gioushy/E-Commerce/blob/main/optimization/query1.md) <br/>
• [Write SQL Query to Find the top customers by total spending.](https://github.com/Gioushy/E-Commerce/blob/main/optimization/query2.md) <br/>
• [Write SQL Query to Retrieve the most recent orders with customer information with 12 orders.](https://github.com/Gioushy/E-Commerce/blob/main/optimization/query3.md) <br/>
• [Write SQL Query to List products that have low stock quantities of less than 10 quantities.](https://github.com/Gioushy/E-Commerce/blob/main/optimization/query4.md) <br/>
• [Write SQL query to search for all products with the word "laptop" in either product name or description.](https://github.com/Gioushy/E-Commerce/blob/main/optimization/query5.md) <br/>
• [Summary](https://github.com/Gioushy/E-Commerce/blob/main/optimization/summary.md) <br/>



