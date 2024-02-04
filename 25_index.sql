-- This command retrieves all records from the 'customers' table.
-- It's a straightforward SELECT query that fetches every column and row within the 'customers' table, used here to display the current data before applying any indexes.
SELECT * FROM customers;

-- This command displays all indexes currently defined for the 'customers' table.
-- Indexes are special lookup tables that the database search engine can use to speed up data retrieval.
-- Essentially, an index in a database is similar to an index in a book.
SHOW INDEXES FROM customers;

-- This command creates a new index named 'last_name_idx' on the 'customers' table specifically for the 'last_name' column using a B-tree data structure.
-- B-tree is a balanced tree data structure that keeps data sorted and allows searches, sequential access, insertions, and deletions in logarithmic time.
-- The purpose of this index is to make queries filtering by 'last_name' more efficient, as MySQL can now use the index to quickly locate these values instead of performing a full table scan.
CREATE INDEX last_name_idx ON customers(last_name);

-- Re-display the indexes for the 'customers' table to confirm the creation of the new index.
-- This command helps to verify that the 'last_name_idx' index has been successfully added.
SHOW INDEXES FROM customers; -- now speed up process searching last_name

-- This command performs a SELECT operation on the 'customers' table where the 'last_name' matches 'Puff'.
-- Thanks to the 'last_name_idx' index, this query will be significantly faster than before the index was created, as MySQL can quickly find rows with the last name 'Puff' using the index.
SELECT * FROM customers WHERE last_name = "Puff"; 

-- This command performs a SELECT operation where the 'first_name' matches 'Poppy'.
-- Since there's no index on 'first_name', this query will be slower compared to the one using 'last_name'.
-- This demonstrates the performance benefit of indexes for specific columns that are frequently searched.
SELECT * FROM customers WHERE first_name = "Poppy"; -- slower than last_name


-- This command creates a multicolumn index named 'last_name_first_name_idx' on the 'customers' table.
-- A multicolumn index can speed up queries that filter on both of these columns.
-- This is particularly useful for queries that specify conditions on both 'last_name' and 'first_name', allowing for more efficient data retrieval.
CREATE INDEX last_name_first_name_idx ON customers(last_name,first_name);

-- Show indexes again to see the newly created multicolumn index.
SHOW INDEXES FROM customers;

-- This command removes the previously created single-column index 'last_name_idx'.
-- Dropping indexes that are no longer needed or are superseded by more efficient indexes (like a multicolumn index) can help optimize database performance.
ALTER TABLE customers DROP INDEX last_name_idx;

-- Confirm that the 'last_name_idx' index has been dropped by displaying the current indexes.
SHOW INDEXES FROM customers;

-- This command performs a SELECT operation on the 'customers' table where both 'last_name' and 'first_name' match specified values.
-- With the multicolumn index ('last_name_first_name_idx'), this query can be executed more efficiently than if it had to rely on individual single-column indexes or no indexes at all.
-- Note: There's a typo in 'firs_name'. It should be corrected to 'first_name' for the query to work properly.
SELECT * FROM customers WHERE last_name = "Puff" AND first_name = "Poppy";
