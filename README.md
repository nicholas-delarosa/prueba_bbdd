# DATASET - RIWISUPPLY

## Description
This is a database about an enterprise which wanted to inproved its dataser from **EXCEL** to an relational database.
This database contains 5 tables:
* Suppliers.
* Warehouses.
* Products.
* Movements Types.
* Purchases.

The table **Purchases** is a fact table, which is conected to the other tables (is a M:N) and the other tables don't connect between them, but instead they connect to the fact table (every table is a 1:N).
**Purchases**: Many to Many
**The rest:** One to Many.

## Technologies:
For this project was used:
* Excel/Google Sheets.
* SQL.
* Draw.io.
* Docker

## Engine
For this project, **PostgreSQL** was used with a yml file which lets the database to be dockerized.

## Normalization
This project had a original (and raw) database (check Dataset_RiwiSupply - Jornada AM.xlsx).
What I decided was to separate into differents tables information which mustn't be there (like too much information about the suppliers, warehouses, etc.)
After that, in every table that I made (which was 4) I deleted the repetitive names and I set them an ID, so in the fact table I just had to connect every table by ID, so instead of being "SupplierName, SupplierCity" I change that to id_supplier, so when someone checks that, they see the ID, they go to the respective table and then they search by the ID they wanted to.
I decided to make the **Movement Types** a dimmensional table too for better use when I had to make the database.
There're also 4 repetitive PurchaseOrder, so I made them go from PO-0001 to PO-0004. This was made because when the acounter checks the info I'll tell them that those where repetitive so they can chenge the real PurchaseOrder.

## Database structure
The database structure is simple.
You have 5 tables, 4 dimmensional which connects to 1 fact table.

## Entity Relationship Model
You can check the PDF or the PNG to view the ERM.
But in context it contaits how the dimmensional tables (with their attributes) connects to the fact table (which has its attributes too!)

## Intructions
Open Docker Desktop.
Open docker-compose.yml in Visual Studio Code.
Open a terminal and write `docker compose up`.
It'll start running the database.
Go to localhost in your browser.
You login with "admin@admin.com" as user and "admin" as password.
The password to active the database is "0826" (when it ask you for a pasword for "root" user).
Open dockerconnection and open the bd_nicholas_delarosa_mulata database.

## Instrucion to load data
Create the tables with the commands in ddl.sql
In every table you right-click and lick in Import/Export Data...
Load the CSV file in where you want to import.
Make it UTF-8 an din columns option you make NOT NULL every column.
Click OK and that's all!

## Developer
Nicholas Andres De la Rosa Rivera
Mulata
