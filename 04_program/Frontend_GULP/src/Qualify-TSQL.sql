CREATE TABLE [EMPLOYEE] (
  [ID] INT NOT NULL IDENTITY,
  [NAME] VARCHAR(20) NOT NULL,
  [SURNAME] VARCHAR(24) NOT NULL,
  [PERSONAL_IDNUM] CHAR(11) NOT NULL,
  [MED_INSPECTION_DATE] DATE NOT NULL,
  [WORKSFROM] DATE NULL,
  [WORKEDTILL] DATE NULL,
  [PHONE_PRIVATE] VARCHAR(16) NULL,
  [PHONE_WORK] VARCHAR(16) NULL,
  [EMAIL_PRIVATE] VARCHAR(45) NULL,
  [EMAIL_WORK] VARCHAR(45) NULL,
  [HOME_ADDRESS] VARCHAR(255) NULL,
  PRIMARY KEY ([ID]));

CREATE TABLE [WAREHOUSE] (
  [ID] SMALLINT NOT NULL IDENTITY,
  [CODE] CHAR(8) NOT NULL,
  [NAME] VARCHAR(45) NOT NULL,
  PRIMARY KEY ([ID]));

CREATE TABLE [ACCOUNT] (
  [ID] SMALLINT CHECK ([ID] > 0) NOT NULL IDENTITY,
  [CODE] CHAR(8) NOT NULL,
  [NAME] VARCHAR(45) NOT NULL,
  PRIMARY KEY ([ID]));

CREATE TABLE [COMPETENTION_PATTERN] (
  [ID] SMALLINT NOT NULL IDENTITY,
  [NAME] VARCHAR(20) NOT NULL,
  [LANGUAGES] SMALLINT NULL,
  [WELDING] SMALLINT NULL,
  [BRAKES] SMALLINT NULL,
  [FORKLIFT] SMALLINT NULL,
  [DRAWINGS] SMALLINT NULL,
  [CONSTRUCTING] SMALLINT NULL,
  [CHEMISTRY] SMALLINT NULL,
  [ACCOUNTING] SMALLINT NULL,
  [MANAGEMENT] SMALLINT NULL,
  [QUALITY] SMALLINT NULL,
  PRIMARY KEY ([ID]));

CREATE TABLE [DEPARTMENT] (
  [ID] SMALLINT NOT NULL IDENTITY,
  [NAME] VARCHAR(48) NOT NULL,
  [DEPT_CODE] CHAR(8) NOT NULL,
  [DEPT_HEAD] INT CHECK ([DEPT_HEAD] > 0) NOT NULL,
  [DEPT_WAREHOUSES] SMALLINT CHECK ([DEPT_WAREHOUSES] > 0) NOT NULL,
  [DEPT_ACCOUNTS] SMALLINT CHECK ([DEPT_ACCOUNTS] > 0) NOT NULL,
  [CDEPT_COMPETENTION_PATTERN] SMALLINT NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [fk_DEPARTMENT_WORKERS]
    FOREIGN KEY ([DEPT_HEAD])
    REFERENCES [EMPLOYEE] ([ID]),
  CONSTRAINT [fk_DEPARTMENT_WAREHOUSES1]
    FOREIGN KEY ([DEPT_WAREHOUSES])
    REFERENCES [WAREHOUSE] ([ID]),
  CONSTRAINT [fk_DEPARTMENT_ACCOUNTS1]
    FOREIGN KEY ([DEPT_ACCOUNTS])
    REFERENCES [ACCOUNT] ([ID]),
  CONSTRAINT [fk_DEPARTMENT_COMPETENTION_PATTERN1]
    FOREIGN KEY ([CDEPT_COMPETENTION_PATTERN])
    REFERENCES [COMPETENTION_PATTERN] ([ID]));

CREATE TABLE [POSITION] (
  [ID] INT NOT NULL IDENTITY,
  [NAME] VARCHAR(45) NOT NULL,
  [COEF] FLOAT NOT NULL DEFAULT 1.2,
  [MED_INSP_PERIOD] SMALLINT NOT NULL DEFAULT 24,
  [DEPARTMENT_ID] SMALLINT CHECK ([DEPARTMENT_ID] > 0) NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [fk_POSITION_DEPARTMENT1]
    FOREIGN KEY ([DEPARTMENT_ID])
    REFERENCES [DEPARTMENT] ([ID]));

CREATE TABLE [WORKER] (
  [ID] INT NOT NULL IDENTITY,
  [EMPLOYEE_ID] INT CHECK ([EMPLOYEE_ID] > 0) NOT NULL,
  [POSITION_ID] INT CHECK ([POSITION_ID] > 0) NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [fk_WORKER_EMPLOYEE1]
    FOREIGN KEY ([EMPLOYEE_ID])
    REFERENCES [EMPLOYEE] ([ID]),
  CONSTRAINT [fk_WORKER_POSITION1]
    FOREIGN KEY ([POSITION_ID])
    REFERENCES [POSITION] ([ID]));

CREATE TABLE [COMPETENTION_MATRIX] (
  [ID] INT NOT NULL IDENTITY,
  [EMPLOYEE_ID] INT CHECK ([EMPLOYEE_ID] > 0) NOT NULL,
  [LANGUAGES] SMALLINT NULL,
  [WELDING] SMALLINT NULL,
  [BRAKES] SMALLINT NULL,
  [FORKLIFT] SMALLINT NULL,
  [DRAWING] SMALLINT NULL,
  [CONSTRUCTING] SMALLINT NULL,
  [CHEMISTRY] SMALLINT NULL,
  [ACCOUNTING] SMALLINT NULL,
  [MANAGEMENT] SMALLINT NULL,
  [QUALITY] SMALLINT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [fk_COMPETENTION_MATRIX_EMPLOYEE1]
    FOREIGN KEY ([EMPLOYEE_ID])
    REFERENCES [EMPLOYEE] ([ID]));

CREATE TABLE [UNITS] (
  [ID] SMALLINT NOT NULL IDENTITY,
  [NAME] VARCHAR(8) NOT NULL,
  PRIMARY KEY ([ID]));

CREATE TABLE [WH_ITEMS] (
  [ID] INT NOT NULL IDENTITY,
  [NAME] VARCHAR(45) NOT NULL,
  [DESCR] VARCHAR(45) NULL,
  [UNITS_ID] SMALLINT NOT NULL,
  [QUANTITY] FLOAT(2) NOT NULL,
  [PRICE] DECIMAL(5,4) NOT NULL,
  [WAREHOUSE_ID] SMALLINT NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [fk_WH_ITEMS_WAREHOUSE1]
    FOREIGN KEY ([WAREHOUSE_ID])
    REFERENCES [WAREHOUSE] ([ID]),
  CONSTRAINT [fk_UNITS_ID1]
    FOREIGN KEY ([UNITS_ID])
    REFERENCES [UNITS] ([ID]));

CREATE TABLE [ORDER_TYPE] (
  [ID] SMALLINT NOT NULL IDENTITY,
  [NAME] VARCHAR(45) NOT NULL,
  PRIMARY KEY ([ID]));

CREATE TABLE [PRODUCT] (
  [ID] INT NOT NULL IDENTITY,
  [NAME] VARCHAR(45) NOT NULL,
  PRIMARY KEY ([ID]));

CREATE TABLE [COUNTRY] (
  [ID] SMALLINT NOT NULL IDENTITY,
  [NAME] VARCHAR(45) NOT NULL,
  [LOCALE] CHAR(2) NOT NULL,
  [TRADEZONE] VARCHAR(45) NULL,
  [CURRENCY] CHAR(3) NULL,
  PRIMARY KEY ([ID]));

CREATE TABLE [CLIENT] (
  [ID] INT NOT NULL IDENTITY,
  [Name] VARCHAR(45) NOT NULL,
  [CONTACT] VARCHAR(45) NOT NULL,
  [PHONE] VARCHAR(16) NULL,
  [EMAIL] VARCHAR(45) NULL,
  [ADDRESS] VARCHAR(60) NULL,
  [COUNTRY_ID] SMALLINT NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [fk_CLIENT_COUNTRY1]
    FOREIGN KEY ([COUNTRY_ID])
    REFERENCES [COUNTRY] ([ID]));

CREATE TABLE [QUALITY_CARD] (
  [ID] INT NOT NULL IDENTITY,
  [LINK] VARCHAR(60) NOT NULL,
  PRIMARY KEY ([ID]));

CREATE TABLE [ORDER] (
  [ID] INT NOT NULL IDENTITY,
  [INT_CODE] CHAR(10) NOT NULL,
  [EXT_CODE] VARCHAR(45) NULL,
  [ORDER_DATE] DATE NOT NULL,
  [PROD_DATE] DATE NOT NULL,
  [PRICE] DECIMAL(6,2) NOT NULL,
  [COMMENT] NVARCHAR(max) NULL,
  [CLIENT_ID] INT CHECK ([CLIENT_ID] > 0) NOT NULL,
  [ORDER_TYPE_ID] SMALLINT CHECK ([ORDER_TYPE_ID] > 0) NOT NULL,
  [PRODUCT_ID] INT CHECK ([PRODUCT_ID] > 0) NOT NULL,
  [QUALITY_CARD_ID] INT NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [fk_ORDER_ORDER_TYPE1]
    FOREIGN KEY ([ORDER_TYPE_ID])
    REFERENCES [ORDER_TYPE] ([ID]),
  CONSTRAINT [fk_ORDER_PRODUCT1]
    FOREIGN KEY ([PRODUCT_ID])
    REFERENCES [PRODUCT] ([ID]),
  CONSTRAINT [fk_ORDER_CLIENT1]
    FOREIGN KEY ([CLIENT_ID])
    REFERENCES [CLIENT] ([ID]),
  CONSTRAINT [fk_ORDER_QUALITY_CARD1]
    FOREIGN KEY ([QUALITY_CARD_ID])
    REFERENCES [QUALITY_CARD] ([ID]));

CREATE TABLE [CLAIM] (
  [ID] INT NOT NULL IDENTITY,
  [DATE_START] DATE NOT NULL,
  [DATE_END] DATE NULL,
  [ORDER_ID] INT CHECK ([ORDER_ID] > 0) NOT NULL,
  [CLIENT_ID] INT CHECK ([CLIENT_ID] > 0) NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [fk_CLAIM_ORDER1]
    FOREIGN KEY ([ORDER_ID])
    REFERENCES [ORDER] ([ID]),
  CONSTRAINT [fk_CLAIM_CLIENT1]
    FOREIGN KEY ([CLIENT_ID])
    REFERENCES [CLIENT] ([ID]));

CREATE TABLE [ACTION] (
  [ID] INT NOT NULL IDENTITY,
  [AIM] VARCHAR(45) NOT NULL,
  [DATE_START] DATE NOT NULL,
  [DATE_END] DATE NULL,
  [WORKER_ID] INT NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [fk_ACTION_WORKER1]
    FOREIGN KEY ([WORKER_ID])
    REFERENCES [WORKER] ([ID]));

CREATE TABLE [CLAIM_HISTORY] (
  [ID] INT NOT NULL,
  [CLAIM_ID] INT CHECK ([CLAIM_ID] > 0) NOT NULL,
  [ACTION_ID] INT NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [fk_CLAIM_HISTORY_CLAIM1]
    FOREIGN KEY ([CLAIM_ID])
    REFERENCES [CLAIM] ([ID]),
  CONSTRAINT [fk_CLAIM_HISTORY_ACTION1]
    FOREIGN KEY ([ACTION_ID])
    REFERENCES [ACTION] ([ID]));

CREATE TABLE [CLAIM_COMMENTS] (
  [ID] INT NOT NULL IDENTITY,
  [ACTION_ID] INT NOT NULL,
  [TIMESTAMP] DATETIME2(0) NOT NULL,
  [COMMENT] VARCHAR(255) NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [fk_CLAIM_COMMENTS_ACTION1]
    FOREIGN KEY ([ACTION_ID])
    REFERENCES [ACTION] ([ID]));

CREATE TABLE [CLAIM_EXPENCES] (
  [ID] INT NOT NULL IDENTITY,
  [CLAIM_ID] INT CHECK ([CLAIM_ID] > 0) NOT NULL,
  [DATE] DATE NOT NULL,
  [SUM] FLOAT NOT NULL,
  [LINK] VARCHAR(60) NULL,
  [COMMENT] VARCHAR(45) NOT NULL,
  [DEPARTMENT_ID] SMALLINT CHECK ([DEPARTMENT_ID] > 0) NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [fk_CLAIM_EXPENCES_CLAIM1]
    FOREIGN KEY ([CLAIM_ID])
    REFERENCES [CLAIM] ([ID]),
  CONSTRAINT [fk_CLAIM_EXPENCES_DEPARTMENT1]
    FOREIGN KEY ([DEPARTMENT_ID])
    REFERENCES [DEPARTMENT] ([ID]));

CREATE TABLE [TOOL_TYPE] (
  [ID] INT NOT NULL IDENTITY,
  [NAME] VARCHAR(45) NOT NULL,
  [CHECK_PERIOD_MONTH] SMALLINT NOT NULL DEFAULT 12,
  PRIMARY KEY ([ID]));

CREATE TABLE [TOOL_PROP] (
  [ID] INT NOT NULL IDENTITY,
  [TOOL_TYPE_ID] INT CHECK ([TOOL_TYPE_ID] > 0) NOT NULL,
  [PROP] VARCHAR(45) NOT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [fk_TOOL_PROP_TOOL_TYPE1]
    FOREIGN KEY ([TOOL_TYPE_ID])
    REFERENCES [TOOL_TYPE] ([ID]));

CREATE TABLE [TOOL_LIST] (
  [ID] INT NOT NULL IDENTITY,
  [LAST_CHECK_DATE] DATE NOT NULL,
  [TOOL_TYPE_ID] INT CHECK ([TOOL_TYPE_ID] > 0) NOT NULL,
  [TOOL_PROP_ID] INT NOT NULL,
  [WORKER_ID] INT NOT NULL,
  [TOOL_UTILIZED] SMALLINT NULL,
  PRIMARY KEY ([ID]),
  CONSTRAINT [fk_TOOL_LIST_TOOL_TYPE1]
    FOREIGN KEY ([TOOL_TYPE_ID])
    REFERENCES [TOOL_TYPE] ([ID]),
  CONSTRAINT [fk_TOOL_LIST_TOOL_PROP1]
    FOREIGN KEY ([TOOL_PROP_ID])
    REFERENCES [TOOL_PROP] ([ID]),
  CONSTRAINT [fk_TOOL_LIST_WORKER1]
    FOREIGN KEY ([WORKER_ID])
    REFERENCES [WORKER] ([ID]));

CREATE TABLE [CERTIFICATE] (
  [ID] INT NOT NULL IDENTITY,
  [NAME] VARCHAR(45) NOT NULL,
  [CERT_ID] VARCHAR(45) NULL,
  [LINK] VARCHAR(45) NULL,
  [EMPLOYEE_ID] INT CHECK ([EMPLOYEE_ID] > 0) NOT NULL,
  [DATE_FROM] DATE NOT NULL,
  [DATE_TILL] DATE NULL,
  [REMINDER_MONTH] SMALLINT NOT NULL DEFAULT 3,
  PRIMARY KEY ([ID]),
  CONSTRAINT [fk_CERTIFICATE_EMPLOYEE1]
    FOREIGN KEY ([EMPLOYEE_ID])
    REFERENCES [EMPLOYEE] ([ID]));