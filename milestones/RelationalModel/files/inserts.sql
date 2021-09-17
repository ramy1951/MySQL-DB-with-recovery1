-- -----------------------------------------------------
-- Script name: inserts.sql
-- Author:      Ramy Fekry
-- Purpose:     This file is used to insert mock data for all the tables in the ATM_management_system_DB.
-- -----------------------------------------------------



USE ATM_management_system_DB;      
-- -----------------------------------------------------
-- INSERT into User table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`User` ( `gov_issued_id`, `email`, `password`, `date_of_birth`, `first_name`, `last_name`, `address`) 
	VALUES ( "link to gov ID", "ramy@mail.com", "hopefully hashed password", "1951/10/29", "Ramy", "Fekry", null);
																													
INSERT INTO `ATM_management_system_DB`.`User` ( `gov_issued_id`, `email`, `password`, `date_of_birth`, `first_name`, `last_name`, `address`) 
	VALUES ( "link to gov ID", "Jose@Ortiz.com", "better be a hashed password", "1990/05/21", "Jose", "Ortiz", null);
    
INSERT INTO `ATM_management_system_DB`.`User` ( `gov_issued_id`, `email`, `password`, `date_of_birth`, `first_name`, `last_name`, `address`) 
	VALUES ( "link to gov ID", "Julio@Morales.com", "is it hashed password already?", "1980/06/01", "Julio", "Morales", null);
    
    
-- -----------------------------------------------------
-- INSERT into Bank_account table
-- -----------------------------------------------------
INSERT INTO `Bank_account` (`account_number`, `balance`, User) 
	VALUES (12345678, 100, 1);
INSERT INTO `Bank_account` (`account_number`,`balance`, User) 
	VALUES (87654321, 55.24, 1);
INSERT INTO `Bank_account` (`account_number`,`balance`, User) 
	VALUES (21436587, 90.88, 1);
INSERT INTO `Bank_account` (`account_number`,`balance`, User) 
	VALUES (54637281, 205631.56, 2);
INSERT INTO `Bank_account` (`account_number`,`balance`, User) 
	VALUES (54637283, 567.71, 2);
INSERT INTO `Bank_account` (`account_number`,`balance`, User) 
	VALUES (54637285, 1234567.01, 2);
INSERT INTO `Bank_account` (`account_number`,`balance`, User) 
	VALUES (64637281, 0.00, 3);
INSERT INTO `Bank_account` (`account_number`,`balance`, User) 
	VALUES (74637281, 3453.98, 3);

 
-- -----------------------------------------------------
-- INSERT into Bank_card table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Bank_card` ( `card_number`, `PIN`, `display_name`, `expiry_date`, `card_type`, `bank_account`)
	VALUES ( 5678, 1133, "Bank card 2", CURRENT_TIMESTAMP, "Debit", 1);
    
INSERT INTO `ATM_management_system_DB`.`Bank_card` ( `card_number`, `PIN`, `display_name`, `expiry_date`, `card_type`, `bank_account`)
	VALUES ( 0987, 3355, "Second Bank Card!", CURRENT_TIMESTAMP, "Credit", 2);
    
INSERT INTO `ATM_management_system_DB`.`Bank_card` ( `card_number`, `PIN`, `display_name`, `expiry_date`, `card_type`, `bank_account`)
	VALUES ( 5721, 9988, "Another useless card", CURRENT_TIMESTAMP, "Debit", 3);




-- -----------------------------------------------------
-- INSERT into Phone_number table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Phone_number` ( `country_code`, `number`, `country`, `user`) 
	VALUES ( "+1", 9255940873, "US", 1);
    
INSERT INTO `ATM_management_system_DB`.`Phone_number` ( `country_code`, `number`, `country`, `user`) 
	VALUES ( "+1", 5554441234, "US", 2);
    
INSERT INTO `ATM_management_system_DB`.`Phone_number` ( `country_code`, `number`, `country`, `user`) 
	VALUES ( "+1", 0008884534, "US", 2);
    
INSERT INTO `ATM_management_system_DB`.`Phone_number` ( `country_code`, `number`, `country`, `user`) 
	VALUES ( "+1", 2223333355, "US", 3);

					  
-- -----------------------------------------------------
-- INSERT into Incident table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Incident` ( `location`, `description` ) 
	VALUES ("Some where in my mind", "This is a horrific incident that was devestating to me!");

INSERT INTO `ATM_management_system_DB`.`Incident` ( `location`, `description` ) 
	VALUES ("You will never know!", "Secret description of the incident.");

INSERT INTO `ATM_management_system_DB`.`Incident` ( `location`, `description` ) 
	VALUES ("Fine! I'll let you know..", "No more secrets!");
    
    
-- -----------------------------------------------------
-- INSERT into Police_report table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Police_report` (`incident`, `description`, `user`)
	VALUES (1, "Police report and a police decription goes here..", 1);

INSERT INTO `ATM_management_system_DB`.`Police_report` (`incident`, `description`, `user`)
	VALUES (2, "have you gotten a report yet?", 2);
    
INSERT INTO `ATM_management_system_DB`.`Police_report` (`incident`, `description`, `user`)
	VALUES (3, "Sir yes sir, this seems like a pretty bad robbery", 3);


-- -----------------------------------------------------
-- INSERT into Address table
-- -----------------------------------------------------
INSERT INTO `Address` (`street_address`, `apt_number`, `city`, `state`, `zip_code`) 
	VALUES ('7237 Prohaska Parks Apt. 910', '40748', 'West Anita', 'Ke', 98820);
    
INSERT INTO `Address` (`street_address`, `apt_number`, `city`, `state`, `zip_code`) 
	VALUES ('621 Funk Expressway Suite 564', '48', 'Shanafurt', 'Te', 53349);
    
INSERT INTO `Address` (`street_address`, `apt_number`, `city`, `state`, `zip_code`) 
	VALUES ('1662 Terrell Island', '9', 'Noeland', 'Fl', 55151);
    
INSERT INTO `Address` (`street_address`, `apt_number`, `city`, `state`, `zip_code`) 
	VALUES ('ATM LOCATION 1', '9', 'ATM city', 'CA', 95554);

INSERT INTO `Address` (`street_address`, `apt_number`, `city`, `state`, `zip_code`) 
	VALUES ('ATM LOCATION 2', '12', 'ATM city2', 'CA', 95544);
    
INSERT INTO `Address` (`street_address`, `apt_number`, `city`, `state`, `zip_code`) 
	VALUES ('ATM LOCATION 3', '8', 'ATM city3', 'CA', 95454);


-- -----------------------------------------------------
-- INSERT into User_Address table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`User_Address` (`user`, `address`) 
	VALUES (1, 1);

INSERT INTO `ATM_management_system_DB`.`User_Address` (`user`, `address`) 
	VALUES (2, 2);

INSERT INTO `ATM_management_system_DB`.`User_Address` (`user`, `address`) 
	VALUES (3, 3);


-- -----------------------------------------------------
-- INSERT into ATM table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`ATM` (`address`)
	VALUES (4);
INSERT INTO `ATM_management_system_DB`.`ATM` (`address`)
	VALUES (4);
INSERT INTO `ATM_management_system_DB`.`ATM` (`address`)
	VALUES (4);
    

-- -----------------------------------------------------
-- INSERT into Phone_app table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Phone_app` (`safeEx_account`)
	VALUES (1);
INSERT INTO `ATM_management_system_DB`.`Phone_app` (`safeEx_account`)
	VALUES (2);
INSERT INTO `ATM_management_system_DB`.`Phone_app` (`safeEx_account`)
	VALUES (3);
    

-- -----------------------------------------------------
-- INSERT into Receipt table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Receipt` (`transaction`)
	VALUES (1);
INSERT INTO `ATM_management_system_DB`.`Receipt` (`transaction`)
	VALUES (2);
INSERT INTO `ATM_management_system_DB`.`Receipt` (`transaction`)
	VALUES (3);


-- -----------------------------------------------------
-- INSERT into Transaction table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Transaction` ( `title`, `description`, `credential`, `status`, `amount`, `receipt`, `sender`, `recipient`, `phone_app`, `atm`, `bank_account`)
											  VALUES ("Money transaction", "description of transaction", 1, "pending", 200, null, 1, 2, null, null, 1);

INSERT INTO `ATM_management_system_DB`.`Transaction` ( `title`, `description`, `credential`, `status`, `amount`, `receipt`, `sender`, `recipient`, `phone_app`, `atm`, `bank_account`)
	VALUES ("The money 2", "description of transaction", 2, "pending", 200, null, 1, 2, null, null, 1);

INSERT INTO `ATM_management_system_DB`.`Transaction` ( `title`, `description`, `credential`, `status`, `amount`, `receipt`, `sender`, `recipient`, `phone_app`, `atm`, `bank_account`)
	VALUES ("Transaction 3", "description of transaction", 3, "pending", 200, null, 1, 2, null, null, 1);


-- -----------------------------------------------------
-- INSERT into Payment_type table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Payment_type` (`transaction`) 
	VALUES (1);

INSERT INTO `ATM_management_system_DB`.`Payment_type` (`transaction`) 
	VALUES (2);

INSERT INTO `ATM_management_system_DB`.`Payment_type` (`transaction`) 
	VALUES (3);


-- -----------------------------------------------------
-- INSERT into Currency table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Currency` (`currency_name`)
	VALUES ("us_dollar");

INSERT INTO `ATM_management_system_DB`.`Currency` (`currency_name`)
	VALUES ("euro");

INSERT INTO `ATM_management_system_DB`.`Currency` (`currency_name`)
	VALUES ("egyptian_pound");


-- -----------------------------------------------------
-- INSERT into Notification table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Notification` (`transaction`)
	VALUES (1);

INSERT INTO `ATM_management_system_DB`.`Notification` (`transaction`)
	VALUES (2);

INSERT INTO `ATM_management_system_DB`.`Notification` (`transaction`)
	VALUES (3);


-- -----------------------------------------------------
-- INSERT into Security_footage table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Security_footage` ( `title`, `description`, `transaction`)
	VALUES ("A robbery that happened..", "A man reobbed a person trying to get money from a ATM", 1);

INSERT INTO `ATM_management_system_DB`.`Security_footage` ( `title`, `description`, `transaction`)
	VALUES ("Did it really happened?!", "I think it did..", 2);

INSERT INTO `ATM_management_system_DB`.`Security_footage` ( `title`, `description`, `transaction`)
	VALUES ("Okay fine I did it..", "I was wearing some pants and a short while robbing that person.", 3);


-- -----------------------------------------------------
-- INSERT into Camera_angle table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Camera_angle` (`title`, `description`) 
	VALUES ( "This is camera angle", "This is a top LEFT corner camera..");

INSERT INTO `ATM_management_system_DB`.`Camera_angle` (`title`, `description`) 
	VALUES ( "This is another camera angle", "This is a top RIGHT corner camera..");

INSERT INTO `ATM_management_system_DB`.`Camera_angle` (`title`, `description`) 
	VALUES ( "Another one..", "This is a BOTTOM RIGHT corner camera..");
    
    
-- -----------------------------------------------------
-- INSERT into Cash table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Cash` (amount_dispensed, currency, payment_type) 
	VALUES (100.01, 1, 1);

INSERT INTO `ATM_management_system_DB`.`Cash` (amount_dispensed, currency, payment_type) 
	VALUES (200.02, 2, 2);

INSERT INTO `ATM_management_system_DB`.`Cash` (amount_dispensed, currency, payment_type) 
	VALUES (300.03, 3, 3);


-- -----------------------------------------------------
-- INSERT into SafeEx_account table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`SafeEx_account` (`user`) 
	VALUES (1);

INSERT INTO `ATM_management_system_DB`.`SafeEx_account` (`user`) 
	VALUES (2);

INSERT INTO `ATM_management_system_DB`.`SafeEx_account` (`user`) 
	VALUES (3);


-- -----------------------------------------------------
-- INSERT into Login table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Login` (`safeex_account`, `user`) 
	VALUES (1, 1);

INSERT INTO `ATM_management_system_DB`.`Login` (`safeex_account`, `user`) 
	VALUES (2, 2);

INSERT INTO `ATM_management_system_DB`.`Login` (`safeex_account`, `user`) 
	VALUES (3, 3);


-- -----------------------------------------------------
-- INSERT into Credit_card table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Credit_card` (`payment_type`, `bank_card`) 
	VALUES (1, 1);

INSERT INTO `ATM_management_system_DB`.`Credit_card` (`payment_type`, `bank_card`) 
	VALUES (2, 2);

INSERT INTO `ATM_management_system_DB`.`Credit_card` (`payment_type`, `bank_card`) 
	VALUES (3, 3);


-- -----------------------------------------------------
-- INSERT into Debit_card table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Debit_card` (`payment_type`, `bank_card`) 
	VALUES (1, 1);

INSERT INTO `ATM_management_system_DB`.`Debit_card` (`payment_type`, `bank_card`) 
	VALUES (1, 1);

INSERT INTO `ATM_management_system_DB`.`Debit_card` (`payment_type`, `bank_card`) 
	VALUES (1, 1);
    
    
-- -----------------------------------------------------
-- INSERT into Recordings table
-- -----------------------------------------------------
INSERT INTO `ATM_management_system_DB`.`Recordings` (`security_footage`, `camera_angle`) 
	VALUES (1, 1);
    
INSERT INTO `ATM_management_system_DB`.`Recordings` (`security_footage`, `camera_angle`) 
	VALUES (2, 2);
    
INSERT INTO `ATM_management_system_DB`.`Recordings` (`security_footage`, `camera_angle`) 
	VALUES (3, 3);
    