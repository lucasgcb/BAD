# Aula 2

## Commands
* CREATE DATABASE `<databaseName>`
   >Creates a new database entry
* USE `<databaseName>`
   >Selects the database workspace
* CREATE TABLE `<tableName>`(
	`column0` `datatype` PRIMARY KEY (optional),
	`column1` `datatype`,
	`column2` `datatype`,
	...
); 
   > Creates a new table entry with the appointed columns into the current database workspace
* DESCRIBE `<tableName>`;
   > Informs table column pattern information.
* SELECT sum(`column`) FROM `<tableName>`;
   > Returns the sum of all columns named `column`
* SELECT max(`column`) FROM `<tableName>`;
   > Returns the highest
* SELECT `column1`, `column2`, ... FROM `<tableName>`; 
   > Returns requested column data from all rows in a given table
* SELECT * FROM `<tableName>`; 
   > Returns data from all columns from all rows in a given table (* is a wildcard for 'all' )
* SELECT `column1`,`column2` FROM `<tableName>` ORDER BY `column1`,`column2`,... `ASC || DESC`; 
   > Returns columns of all rows from a given table ordered by Ascending (*ASC*) OR Descending(*DESC*) values in the appointed columns. Default value is ordered by `id` and `DESC` when omitted
* SELECT `column` FROM `table` WHERE `column` like `<pattern>`
   > Returns columns of all rows from a given table that follow the input pattern.

   > Pattern can include wildcards `%` (zero or multiple characters) and `_` (single character)
* INSERT INTO `<tableName>` (`column1`,`column2`,`column3`...) VALUES (`value1`,`value2`,`value3`,...),(`valueA1`,`valueA2`,`valueA3`,...),(...)
   > Inserts into the table a new row wherein the column* holds the respective appointed value* 

* UPDATE `<tableName>` SET `column1` = `value1`, `column2` = `value2` WHERE `identifyingValue` = `someValue`;
   > Updates the given column cell values from the rows where the identifying criteria applies

## Backup Command Snippet

```shell
$mysqldump --all-databases -u root -p > backup.sql
```

## Examples
```sql
CREATE DATABASE countries
USE countries
CREATE TABLE cities(
	name varchar(100), -- Dynamic allocation with a maximum limit
	state char(2), -- Static allocation
	country char(15),
	population varchar(100)
);

SELECT * FROM cities;
-- Should return an empty set
INSERT INTO cities(name,state,country,population)
VALUES("Florianopolis","SC","Brazil",300000);
INSERT INTO cities(name,state,country,population)
VALUES("Acrelandia","AC","Brazil",320000);

SELECT * FROM cities;
-- Should return each city row with their respective columns
UPDATE cidades SET habitantes=35000 WHERE nome="Florianopolis";
-- Updates the 'population' column cell in the row identified by the 'name' "Florianopolis" to 35000
SELECT * FROM cities WHERE population>300000;
-- Should return the Florianopolis Row
SELECT * FROM cities WHERE state>"AC";
-- Should return the Acrelandia Row
);
```

# Aula 2

## Commands
* ALTER TABLE `table_name`
    ADD `column_name` `datatype`

    > Adds new column to the specified existing table

* ALTER TABLE `table_name`
	  MODIFY `column_name` `datatype`;

    > Modifies an existing column in the specified existing table

* ALTER TABLE `table_name`
	  DROP COLUMN `column_name`

    > Removes an existing column in the specified existing table

* ALTER TABLE `table_name`
	  RENAME `new_table_name`

    > Alters the name of the specified table

* DROP TABLE `table_name`

    > Removes the specified table

* DROP DATABASE `database_name`

    > Removes the specified Database
## Examples
```sql
CREATE DATABASE HR;
USE HR;

CREATE TABLE funcionario
(
	cracha integer PRIMARY KEY,
	nome varchar(100)
);

SHOW tables;
DESCRIBE funcionario;

ALTER TABLE funcionario
ADD sector char(30);
DESCRIBE funcionario;

ALTER TABLE funcionario
MODIFY nome varchar(110);
DESCRIBE funcionario;

ALTER TABLE funcionario
DROP COLUMN sector
DESCRIBE funcionario;

ALTER TABLE funcionario
RENAME func;
DESCRIBE funcionario;
DESCRIBE func;

DROP TABLE func;
DESCRIBE func;
show tables;


DROP DATABASE HR;
show databases;
```




