# INSERT INTO company (Id) 
# VALUES ('b-9999');

# INSERT INTO transaction (Id, credit_card_id, company_id, user_id, Lat, Longitude, Amount, Declined) 
# VALUES ('108B1D1D-5B23-A76C-55EF-C568E49A99DD', 'CcU-9999', 'b-9999', '9999', '829.999', '-117.999', '111.11', '0');

SELECT * 
FROM transaction
WHERE id = '108B1D1D-5B23-A76C-55EF-C568E49A99DD';


