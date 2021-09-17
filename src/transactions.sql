INSERT INTO User ( gov_issued_id, email, password, date_of_birth, first_name, last_name ) VALUES ( 'string gov id', 'ramy1951', '123', '2020/10/10', 'ramy', 'fekry' );
INSERT INTO SafeEx_account (User) select user_id FROM User WHERE email = 'ramy1951';
INSERT INTO Login ( safeex_account, user ) VALUES ( '4', '4' );
INSERT INTO User ( email, password, first_name, last_name ) VALUES ( 'Emaill12', '123', 'Ramyyy', 'Fekry12' );
UPDATE User SET first_name = 'Ramyyy', last_name = 'Fekry12' WHERE User_id = '1';
DELETE FROM User WHERE User_id = 4;
