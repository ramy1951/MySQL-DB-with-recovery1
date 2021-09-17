This project will simulate dealing with the db at a low level and is simulating how a developer or user would deal with the DB. 

## Create user account:
It will create a user in the User table and it will make a safeex account in the account table for you as well. There will 2 entires made for te creation of the account.

## Login:
It will create a login row in the login table and it will keep track of the user object that was used to login as well for future queries.

## Search:
You will need to enter the table name, column name, and the value you would like to filter by. *No values needed for Login and Police report tables*

## Insert:
As a user you will be allowed to enter rows into specific tables only. Choose a table and provide the columns you would like to insert values for and lastly the values themselves.

## Update:
As a user you will be allowed to update rows of a specific tables only. Choose a table and provide the columns you would like to update values for and lastly the values themselves. At the end provide the id of the item you would like to update.

## Delete:
As a user you will be allowed to delete rows that belong to you only. Choose a table and then provide the id of the item you would like to delete.


## Project Guidelines 

Using your database model, and your favorite programming language, create a functional application (console, terminal or GUI) 
to represent the functionality of your database model with real users. Your program must meet the following high level requirements: 

### IMPORTANT: When your program runs for the first time, it must automatically create your database, run the databasemodel.sql script to create the tables for your database, and run the inserts.sql script to insert some sample in those tables. All of this must be done before your program starts to interact with the user.
 
 * SafeEx creates a periodical back up of the database, saving queries in transactions.sql
        
 * The user menu will look something like the following:
        > User Menu 
        > 1. Create Account 
        > 2. Login 
        > 3. Search
        > 4. Insert 
        > 5. Update
        > 6. Delete 
        > 7. Exit
        
        > Select an option: 1

  * Create user account: the user should be able to create an account in your system. The info provided here depends on the attributes you are required to enter in your account or user table. The following is an example that takes the name, email and password from user input. 
        
        > Name: Ramy funny
        > Email: ramy@mail.com
        > Password: 12345
        
        > Account sucessfully created!
        
        > User Menu 
        > 1. Create Account 
        > 2. Login 
        > 3. Search
        > 4. Insert 
        > 5. Update
        > 6. Delete 
        > 7. Exit
        
        > Select an option: 2
 
 * Login: the user can log into the system using the data provided at registration time. 
 
        > 1. email: ramy@mail.com
        > 2. password: 12345
        
        >  You are logged as Ramy funny!
        
        > User Menu 
        > 1. Create Account 
        > 2. Login 
        > 3. Search
        > 4. Insert 
        > 5. Update
        > 6. Delete 
        > 7. Exit
        
        > Select an option: 3
        
  * Search: when user selects this option, the user must be able to search for data based on the main entities implemented in your database model.  Take into consideration that a good search functionality should be able to search data from different tables, and show the data organized in the console or terminal. For example, if your database model was modeled for a library system, a good example of a search service in your system would be the following: 
 
       
         > Tables:
         > Address
         > ATM
         > Bank_account
         > Bank_card
         > ...
         > User
         
         > Select a table to search: User
         
         > Columns:
         > address
         > date_of_birth
         > email
         > ...
         > user_id
         > Enter field: user_id
         > Enter value: 3
         
         > Results from User table.
         > address: None 
         > date_of_birth: 1980-06-01 
         > email: Julio@Morales.com 
         > first_name: Julio 
         > gov_issued_id: link to gov ID 
         > last_login: 2020-12-08 22:31:55 
         > last_name: Morales 
         > password: is it hashed password already?
           
         > User Menu 
         > 1. Create Account 
         > 2. Login 
         > 3. Search
         > 4. Insert 
         > 5. Update
         > 6. Delete 
         > 7. Exit
        
         > Select an option: 4
         
         
   * Insert: you could use this option to insert data into the database: 
   
   
         > Tables:
         > Address
         > ATM
         > Bank_account
         > Bank_card
         > ...
         > User
         
         > Select a table to search: User
         
         > Columns:
         > address
         > date_of_birth
         > email
         > ...
         > user_id 
         > Enter the name attribute/s separated by comma? first_name, last_name, email, password
         > Enter the values separated by comma: ramy, fekry, ramy1@mail.com, pass123
         
         > query INSERT INTO USer ( first_name,  last_name,  email,  password ) VALUES ( %s, %s, %s, %s );
         > values ('ramy', 'fekry', 'ramy1@mail.com', 'pass123')
         > Query saved in transactions.sql
         > Data successfully inserted into USer 
           
         > User Menu 
         > 1. Create Account 
         > 2. Login 
         > 3. Search
         > 4. Insert 
         > 5. Update
         > 6. Delete 
         > 7. Exit
        
         > Select an option: 5
         
   * Update: the user must be able to update data from your database model. Take into consideration that for update and delete options, you must update or delete all the weak entities that referenced the primary keys of the updated or deleted records. 
         
         > Tables:
         > Address
         > ATM
         > Bank_account
         > Bank_card
         > ...
         > User
         
         > Select a table to search: User
         
         > Columns:
         > address
         > date_of_birth
         > email
         > ...
         > user_id 
         > Enter the name attribute/s separated by comma? first_name, last_name                 
         > Enter the values separated by comma: fekry, ramy
         > Enter the id of item you would like to update: 5
         > query UPDATE User SET first_name = %s,  last_name = %s WHERE User_id = '5';
         > values ['fekry', ' ramy']
         > Query saved in transactions.sql
         > Data successfully updated into User 
         
         > User Menu 
         > 1. Create Account 
         > 2. Login 
         > 3. Search
         > 4. Insert 
         > 5. Update
         > 6. Delete 
         > 7. Exit
        
         > Select an option: 6
         
         
   * Delete: the user must be able to delete data from your database model
   
         > Tables:
         > Address
         > ATM
         > Bank_account
         > Bank_card
         > ...
         > User

         > Enter a table to delete data from: User
         > Enter the id of item you would like to DELETE: 6
         > query DELETE FROM User WHERE User_id = 6;
         > values None
         > Query saved in transactions.sql
         > Data successfully deleted from User 

         > User Menu 
         > 1. Create Account 
         > 2. Login 
         > 3. Search
         > 4. Insert 
         > 5. Update
         > 6. Delete 
         > 7. Exit
        
         > Select an option: 7 
         > 

**Note: There is not a lot of error handling done here, please use this at your own descresion this is meant to be a proof od concept only.
