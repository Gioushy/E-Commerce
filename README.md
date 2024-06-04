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
 • [Queries Sample](https://github.com/Gioushy/E-Commerce/blob/main/sample.sql)

