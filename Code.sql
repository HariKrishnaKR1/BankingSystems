create schema assn3;
use assn3;

CREATE TABLE Customer
(
  CID INT NOT NULL,
  CName INT NOT NULL,
  Address INT NOT NULL,
  Phone INT NOT NULL,
  DOB INT NOT NULL,
  Email INT NOT NULL,
  Aadhar INT NOT NULL,
  PAN INT NOT NULL,
  PRIMARY KEY (CID),
  UNIQUE (Phone),
  UNIQUE (Email),
  UNIQUE (Aadhar),
  UNIQUE (PAN)
);

CREATE TABLE Account
(
  AccID INT NOT NULL,
  AccCategory INT NOT NULL,
  Balance INT NOT NULL,
  Tier INT NOT NULL,
  CID INT,
  PRIMARY KEY (AccID),
  FOREIGN KEY (CID) REFERENCES Customer(CID)
);

CREATE TABLE Transaction
(
  TID INT NOT NULL,
  TCategory INT NOT NULL,
  Amount INT NOT NULL,
  Mode INT NOT NULL,
  Status INT NOT NULL,
  Traits INT NOT NULL,
  TSenderAccID INT NOT NULL,
  TRecieverAccID INT NOT NULL,
  PRIMARY KEY (TID),
  FOREIGN KEY (TSenderAccID) REFERENCES Account(AccID),
  FOREIGN KEY (TRecieverAccID) REFERENCES Account(AccID)
);

CREATE TABLE Loan
(
  LID INT NOT NULL,
  LCategory INT NOT NULL,
  Amount INT NOT NULL,
  TimePeriod INT NOT NULL,
  Interest INT NOT NULL,
  Status INT NOT NULL,
  LSenderAccID INT NOT NULL,
  LRecieverAccID INT NOT NULL,
  PRIMARY KEY (LID),
  FOREIGN KEY (LSenderAccID) REFERENCES Account(AccID),
  FOREIGN KEY (LRecieverAccID) REFERENCES Account(AccID)
);

CREATE TABLE Security
(
  AuthType INT NOT NULL,
  LastLogin INT NOT NULL,
  LockStatus INT NOT NULL,
  FraudAlert INT NOT NULL,
  AccID INT NOT NULL,
  PRIMARY KEY (AccID),
  FOREIGN KEY (AccID) REFERENCES Account(AccID)
);