USE ATM_management_system_DB;

-- -----------------------------------------------------
-- TESTING Bank_account table
-- -----------------------------------------------------
DELETE FROM Bank_account WHERE bank_account_id = 1;
UPDATE Bank_account SET bank_account_id = 10 WHERE bank_account_id = 2;
 
-- -----------------------------------------------------
-- TESTING Bank_card table
-- -----------------------------------------------------
DELETE FROM Bank_card WHERE bank_card_id = 1;
UPDATE Bank_card SET bank_card_id = 10 WHERE bank_card_id = 2;


-- -----------------------------------------------------
-- TESTING User table
-- ----------------------------------------------------- 
DELETE FROM User WHERE first_name = 'Ramy';
UPDATE User SET user_id = 4 WHERE first_name = 'Jose';

-- -----------------------------------------------------
-- TESTING Phone_number table
-- -----------------------------------------------------
DELETE FROM Phone_number WHERE phone_number_id = 1;
UPDATE Phone_number SET phone_number_id = 10 WHERE phone_number_id = 2;
					  
-- -----------------------------------------------------
-- TESTING Incident table
-- -----------------------------------------------------
UPDATE Incident SET incident_id = 10 WHERE incident_id = 2;
    
    
-- -----------------------------------------------------
-- TESTING Police_report table
-- -----------------------------------------------------
DELETE FROM Police_report WHERE police_report_id = 1;
UPDATE Police_report SET police_report_id = 10 WHERE police_report_id = 2;


-- -----------------------------------------------------
-- TESTING Address table
-- -----------------------------------------------------
DELETE FROM Address WHERE address_id = 1;
UPDATE Address SET address_id = 10 WHERE address_id = 2;


-- -----------------------------------------------------
-- TESTING User_Address table
-- -----------------------------------------------------
DELETE FROM User_Address WHERE user_address_id = 1;
UPDATE User_Address SET user_address_id = 10 WHERE user_address_id = 2;


-- -----------------------------------------------------
-- TESTING ATM table
-- -----------------------------------------------------
DELETE FROM ATM WHERE atm_id = 1;
UPDATE ATM SET atm_id = 10 WHERE atm_id = 2;
    

-- -----------------------------------------------------
-- TESTING Phone_app table
-- -----------------------------------------------------
DELETE FROM Phone_app WHERE phone_app_id = 1;
UPDATE Phone_app SET phone_app_id = 10 WHERE phone_app_id = 2;
    

-- -----------------------------------------------------
-- TESTING Receipt table
-- -----------------------------------------------------
DELETE FROM Receipt WHERE receipt_id = 1;
UPDATE Receipt SET receipt_id = 10 WHERE receipt_id = 2;


-- -----------------------------------------------------
-- TESTING Transaction table
-- -----------------------------------------------------

DELETE FROM `Transaction` WHERE transaction_id = 1;
UPDATE `Transaction` SET transaction_id = 10 WHERE transaction_id = 2;


-- -----------------------------------------------------
-- TESTING Payment_type table
-- -----------------------------------------------------
DELETE FROM Payment_type WHERE payment_type_id = 1;
UPDATE Payment_type SET payment_type_id = 10 WHERE payment_type_id = 2;


-- -----------------------------------------------------
-- TESTING Currency table
-- -----------------------------------------------------
DELETE FROM Currency WHERE currency_id = 1;


-- -----------------------------------------------------
-- TESTING Notification table
-- -----------------------------------------------------
DELETE FROM Notification WHERE notification_id = 1;
UPDATE Notification SET notification_id = 10 WHERE notification_id = 2;


-- -----------------------------------------------------
-- TESTING Security_footage table
-- -----------------------------------------------------
DELETE FROM Security_footage WHERE security_footage_id = 1;
UPDATE Security_footage SET security_footage_id = 10 WHERE security_footage_id = 2;


-- -----------------------------------------------------
-- TESTING Camera_angle table
-- -----------------------------------------------------
DELETE FROM Camera_angle WHERE camera_angle_id = 1;
UPDATE Camera_angle SET camera_angle_id = 10 WHERE camera_angle_id = 2;

    
-- -----------------------------------------------------
-- TESTING Cash table
-- -----------------------------------------------------
DELETE FROM Cash WHERE cash_id = 1;
UPDATE Cash SET cash_id = 10 WHERE cash_id = 2;


-- -----------------------------------------------------
-- TESTING SafeEx_account table
-- -----------------------------------------------------
DELETE FROM SafeEx_account WHERE safeex_Account_id = 1;
UPDATE SafeEx_account SET SafeEx_account_id = 10 WHERE SafeEx_account_id = 2;

-- -----------------------------------------------------
-- TESTING Login table
-- -----------------------------------------------------
DELETE FROM Login WHERE user = 1;
UPDATE Login SET safeex_account = 10 WHERE safeex_account = 2;

-- -----------------------------------------------------
-- TESTING Credit_card table
-- -----------------------------------------------------
DELETE FROM Credit_card WHERE Credit_card_id = 1;
UPDATE Credit_card SET Credit_card_id = 10 WHERE Credit_card_id = 2;


-- -----------------------------------------------------
-- TESTING Debit_card table
-- -----------------------------------------------------
DELETE FROM Debit_card WHERE Debit_card_id = 1;
UPDATE Debit_card SET Debit_card_id = 10 WHERE Debit_card_id = 2;
    
    
-- -----------------------------------------------------
-- TESTING Recordings table
-- -----------------------------------------------------
DELETE FROM Recordings WHERE security_footage = 1;
UPDATE Recordings SET security_footage = 10 WHERE security_footage = 2;