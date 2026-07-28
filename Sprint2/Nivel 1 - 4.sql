CREATE TABLE credit_card (
    id VARCHAR(15) PRIMARY KEY,
    iban VARCHAR(50) NOT NULL,
    pan VARCHAR(30) NOT NULL,
    pin CHAR(4) NOT NULL,
    cvv CHAR(3) NOT NULL,
    expiring_date VARCHAR(10) NOT NULL);
