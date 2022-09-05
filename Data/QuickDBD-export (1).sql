-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/OpwaWQ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "merchant_category" (
    "business_id" INT   NOT NULL,
    "business_category" VARCHAR(255)   NOT NULL
);

CREATE TABLE "merchant" (
    "merchant_id" INT   NOT NULL,
    "merchant_name" VARCHAR(255)   NOT NULL,
    "business_id" INT   NOT NULL
);

CREATE TABLE "card_holder" (
    "cardholder_id" INT,   NOT NULL,
    "cardholder_name" VARCHAR(255)   NOT NULL
);

CREATE TABLE "credit_card" (
    "card" VARCHAR(20),   NOT NULL,
    "cardholder_id" INT   NOT NULL
);

CREATE TABLE "transaction" (
    "transaction_id" INT,   NOT NULL,
    "date" TIMESTAMP,   NOT NULL,
    "transaction_amount" FLOAT,   NOT NULL,
    "card" VARCHAR(20),   NOT NULL,
    "merchant_id" INT   NOT NULL
);

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_business_id" FOREIGN KEY("business_id")
REFERENCES "merchant_category" ("business_id");

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_cardholder_id" FOREIGN KEY("cardholder_id")
REFERENCES "card_holder" ("cardholder_id");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_card" FOREIGN KEY("card")
REFERENCES "credit_card" ("card");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_merchant_id" FOREIGN KEY("merchant_id")
REFERENCES "merchant" ("merchant_id");

