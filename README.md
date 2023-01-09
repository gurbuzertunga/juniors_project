create a new rails app

separate controllers,models

employees, customers, images, product, customer reviews,

product can be owned by employee or customer through polymorphic association

customer reviews are only allowed after customer receives the product

employee has to mark delivered, customer has to mark accepted

Once an employee marked delivered mail sent to the customer to click accepted to update the product to status delivered.

images should be uploaded to aws.

Employees are allowed to make updates in the images but customers are not.