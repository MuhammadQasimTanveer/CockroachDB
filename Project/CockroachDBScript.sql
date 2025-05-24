CREATE DATABASE Company;
USE Company;

CREATE TABLE Owner (
  OwnerID INT PRIMARY KEY,
  FirstName STRING NOT NULL,
  LastName STRING,
  Phone STRING UNIQUE,
  Email STRING UNIQUE
);

INSERT INTO Owner VALUES
  (1, 'Ali', 'Khan', '03001234567', 'ali.khan@example.com'),
  (2, 'Sara', 'Malik', '03019876543', 'sara.malik@example.com'),
  (3, 'Usman', 'Javed', '03211234567', 'usman.javed@example.com'),
  (4, 'Hina', 'Raza', '03335551234', 'hina.raza@example.com'),
  (5, 'Zain', 'Ahmed', '03019998888', 'zain.ahmed@example.com'),
  (6, 'Faisal', 'Iqbal', '03451112233', 'faisal.iqbal@example.com'),
  (7, 'Mehwish', 'Farooq', '03129991112', 'mehwish.farooq@example.com'),
  (8, 'Asif', 'Shah', '03336667788', 'asif.shah@example.com');


CREATE TABLE Agency (
  AgencyID INT PRIMARY KEY,
  AgencyName STRING NOT NULL,
  Address STRING,
  Phone STRING UNIQUE,
  Email STRING UNIQUE
);

INSERT INTO Agency VALUES
  (101, 'Pak Property Deals', 'Gulberg, Lahore', '042111222333', 'info@pakdeals.com'),
  (102, 'Karachi Realty', 'DHA Phase 6, Karachi', '021333444555', 'contact@karachirealty.com'),
  (103, 'Islamabad Estates', 'F-7 Markaz, Islamabad', '0512223334', 'info@isb-estates.com'),
  (104, 'Multan Property Hub', 'Cantt, Multan', '0611234567', 'hello@multanhub.com'),
  (105, 'Peshawar Homes', 'University Road, Peshawar', '0911112233', 'info@peshhomes.com'),
  (106, 'Faisalabad Realty', 'Peoples Colony, Faisalabad', '0414455667', 'contact@fsdrealty.com');

CREATE TABLE Agent (
  AgentID INT PRIMARY KEY,
  FirstName STRING NOT NULL,
  LastName STRING NOT NULL,
  Phone STRING UNIQUE,
  Email STRING UNIQUE,
  AgencyID INT NOT NULL,
  CONSTRAINT fk_agency FOREIGN KEY (AgencyID) REFERENCES Agency(AgencyID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);


INSERT INTO Agent VALUES
  (201, 'Adeel', 'Butt', '03005556677', 'adeel.butt@pakdeals.com', 101),
  (202, 'Rabia', 'Zafar', '03112233445', 'rabia.zafar@karachirealty.com', 102),
  (203, 'Imran', 'Qureshi', '03217778899', 'imran.q@isb-estates.com', 103),
  (204, 'Sadia', 'Yousaf', '03334445566', 'sadia.y@multanhub.com', 104),
  (205, 'Bilal', 'Shahzad', '03001112233', 'bilal.s@peshhomes.com', 105),
  (206, 'Nida', 'Anwar', '03452221133', 'nida.a@fsdrealty.com', 106),
  (207, 'Junaid', 'Khan', '03118889900', 'junaid.k@karachirealty.com', 102),
  (208, 'Tania', 'Mirza', '03332221100', 'tania.m@isb-estates.com', 103);

CREATE TABLE Client (
  ClientID INT PRIMARY KEY,
  FirstName STRING NOT NULL,
  LastName STRING NOT NULL,
  Phone STRING UNIQUE,
  Email STRING UNIQUE
);

INSERT INTO Client VALUES
  (301, 'Hamza', 'Shafiq', '03009988776', 'hamza.s@example.com'),
  (302, 'Ayesha', 'Naveed', '03112223456', 'ayesha.n@example.com'),
  (303, 'Noman', 'Ali', '03214445566', 'noman.ali@example.com'),
  (304, 'Zara', 'Iqbal', '03451112244', 'zara.iqbal@example.com'),
  (305, 'Shahbaz', 'Rana', '03332221144', 'shahbaz.rana@example.com'),
  (306, 'Laiba', 'Tariq', '03113334455', 'laiba.tariq@example.com'),
  (307, 'Waqas', 'Mehmood', '03007778899', 'waqas.mehmood@example.com'),
  (308, 'Nida', 'Saleem', '03218889911', 'nida.saleem@example.com'),
  (309, 'Hassan', 'Faisal', '03457778899', 'hassan.faisal@example.com');

CREATE TABLE Property (
  PropertyID INT PRIMARY KEY,
  Address STRING NOT NULL,
  City STRING NOT NULL,
  State STRING NOT NULL,
  ZipCode STRING NOT NULL,
  Price INT CHECK (Price > 0),
  PropertyType STRING NOT NULL,
  Status STRING NOT NULL CHECK (Status IN ('Available', 'Sold')),
  OwnerID INT NOT NULL,
  AgentID INT NOT NULL,
  CONSTRAINT fk_owner FOREIGN KEY (OwnerID) REFERENCES Owner(OwnerID)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_agent FOREIGN KEY (AgentID) REFERENCES Agent(AgentID)
    ON DELETE NO ACTION ON UPDATE CASCADE
);

INSERT INTO Property VALUES
  (401, '123 Model Town', 'Lahore', 'Punjab', '54000', 25000000, 'House', 'Available', 1, 201),
  (402, '45 Gulshan-e-Iqbal', 'Karachi', 'Sindh', '75300', 18000000, 'Apartment', 'Available', 2, 202),
  (403, '78 F-11', 'Islamabad', 'Islamabad', '44000', 35000000, 'House', 'Sold', 3, 203),
  (404, '12 Cantt Road', 'Multan', 'Punjab', '60000', 15000000, 'House', 'Available', 4, 204),
  (405, '89 DHA Phase 2', 'Peshawar', 'KPK', '25000', 22000000, 'House', 'Available', 5, 205),
  (406, '56 Canal View', 'Faisalabad', 'Punjab', '38000', 20000000, 'House', 'Sold', 6, 206),
  (407, '34 Clifton Block 5', 'Karachi', 'Sindh', '75600', 40000000, 'Apartment', 'Available', 7, 207),
  (408, '90 G-8', 'Islamabad', 'Islamabad', '44000', 27500000, 'House', 'Available', 8, 208);


CREATE TABLE Viewing (
  ViewingID INT PRIMARY KEY,
  PropertyID INT NOT NULL,
  ClientID INT NOT NULL,
  AgentID INT NOT NULL,
  ViewingDate DATE NOT NULL CHECK (ViewingDate >= CURRENT_DATE),
  Notes STRING,
  CONSTRAINT fk_property FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_client FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_agent FOREIGN KEY (AgentID) REFERENCES Agent(AgentID)
    ON DELETE NO ACTION ON UPDATE CASCADE
)

INSERT INTO Viewing VALUES
  (501, 401, 301, 201, '2025-05-01', 'Client interested in backyard space'),
  (502, 402, 302, 202, '2025-05-02', 'Liked view, will visit again'),
  (503, 403, 303, 203, '2025-05-03', 'Client wants negotiation'),
  (504, 404, 304, 204, '2025-05-04', 'Client satisfied'),
  (505, 405, 305, 205, '2025-05-05', 'Asked about schools nearby'),
  (506, 406, 306, 206, '2025-05-06', 'Client wants discount'),
  (507, 407, 307, 207, '2025-05-07', 'Interested in payment plan'),
  (508, 408, 308, 208, '2025-05-08', 'Inspection scheduled');


CREATE TABLE Transaction (
  TransactionID INT PRIMARY KEY,
  PropertyID INT NOT NULL,
  ClientID INT NOT NULL,
  AgentID INT NOT NULL,
  TransactionDate DATE NOT NULL CHECK (TransactionDate <= CURRENT_DATE),
  SalePrice INT NOT NULL CHECK (SalePrice > 0),
  CONSTRAINT fk_property_tx FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_client_tx FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
    ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_agent_tx FOREIGN KEY (AgentID) REFERENCES Agent(AgentID)
    ON DELETE NO ACTION ON UPDATE CASCADE
);

INSERT INTO Transaction VALUES
  (601, 403, 303, 203, '2025-05-09', 34000000),
  (602, 406, 306, 206, '2025-05-10', 19500000),
  (603, 401, 301, 201, '2025-05-11', 24000000),
  (604, 405, 305, 205, '2025-05-12', 21500000),
  (605, 407, 307, 207, '2025-05-13', 39000000);


/*List all available properties in Lahore with their ID, address, and price*/
SELECT PropertyID, Address, Status, Price
FROM Property
WHERE City = 'Peshawar';

/*List the number of properties (type) owned by each owner*/
SELECT OwnerID, PropertyType,  COUNT(*) AS PrpCount FROM Property
GROUP BY OwnerID, PropertyType;


/*List all property’s id, address, city along with their owner’s name and phone number*/
SELECT
  Property.PropertyID,
  Property.Address,
  Property.City,
  Owner.FirstName || ' ' || Owner.LastName AS   OwnerName,
  Owner.Phone AS OwnerPhone
FROM Property
JOIN Owner ON Property.OwnerID = Owner.OwnerID;


/*Show the total amount spent by each client on property purchases*/
SELECT ClientID, PropertyID, SUM(SalePrice) AS TotalAmount
FROM Transaction
GROUP BY ClientID, PropertyID;


/*Retrieve the PropertyID, Address, and Status of all properties that do not have any transaction*/
SELECT PropertyID, Address, Status FROM Property
WHERE PropertyID NOT IN ( SELECT PropertyID FROM Transaction );

/*List all property’s Id, and address along with their agents and the agency*/
SELECT
  Property.PropertyID,
  Property.Address,
  Agent.FirstName AS AgentName,
  Agency.AgencyName
FROM Property
JOIN Agent ON Property.AgentID = Agent.AgentID
JOIN Agency ON Agent.AgencyID = Agency.AgencyID;


/*List all transactions with property address, client name, and sale price*/
SELECT 
t.TransactionID, p.Address AS PropertyAddress, 
c.FirstName || ' ' || c.LastName AS BuyerName, t.SalePrice
FROM Transaction t
JOIN Property p ON t.PropertyID = p.PropertyID
JOIN Client c ON t.ClientID = c.ClientID;


/*Update the Owner ID to 9 whose current ID is 1*/
UPDATE Owner SET OwnerID = 9 
WHERE OwnerID = 1;

/*Update the phone number of the agent with AgentID 201*/
UPDATE Agent
SET Phone = '03009998888'
WHERE AgentID = 201;

/*Decrease the price of all available properties in Islamabad by 20%*/
UPDATE Property
SET Price = Price * 0.80
WHERE City = 'Islamabad' AND Status = 'available';