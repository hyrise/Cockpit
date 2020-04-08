# join-order-benchmark

This package contains the Join Order Benchmark (JOB) queries from:  
"How Good Are Query Optimizers, Really?"  
by Viktor Leis, Andrey Gubichev, Atans Mirchev, Peter Boncz, Alfons Kemper, Thomas Neumann  
PVLDB Volume 9, No. 3, 2015  
[http://www.vldb.org/pvldb/vol9/p204-leis.pdf](http://www.vldb.org/pvldb/vol9/p204-leis.pdf)

### IMDB Data Set
The CSV files used in the paper, which are from May 2013, can be found
at [http://homepages.cwi.nl/~boncz/job/imdb.tgz](http://homepages.cwi.nl/~boncz/job/imdb.tgz)

The license and links to the current version IMDB data set can be
found at [http://www.imdb.com/interfaces](http://www.imdb.com/interfaces)

### Step-by-step instructions
1. download `*gz` files (unpacking not necessary)

  ```sh
  wget ftp://ftp.fu-berlin.de/misc/movies/database/frozendata/*gz
  ```
  
2. download and unpack `imdbpy` and the `imdbpy2sql.py` script

  ```sh
  wget https://bitbucket.org/alberanid/imdbpy/get/5.0.zip
  ```

3. create PostgreSQL database (e.g., name_job_1 imdbload):

  ```sh
  createdb imdbload
  ```

4. transform `*gz` files to relational schema (takes a while)

  ```sh
  imdbpy2sql.py -d PATH_TO_GZ_FILES -u postgres://username_job_1:password@hostname_job_1/imdbload
  ```

Now you should have a PostgreSQL database name_job_1d `imdbload` with the
imdb data. Note that this database has some secondary indexes (but not
on all foreign key attributes). You can export all tables to CSV:

```sql
\copy aka_name_job_1 to 'PATH/aka_name_job_1.csv' csv
\copy aka_title_job_1 to 'PATH/aka_title_job_1.csv' csv
\copy cast_info_job_1 to 'PATH/cast_info_job_1.csv' csv
\copy char_name_job_1 to 'PATH/char_name_job_1.csv' csv
\copy comp_cast_type_job_1 to 'PATH/comp_cast_type_job_1.csv' csv
\copy company_name_job_1 to 'PATH/company_name_job_1.csv' csv
\copy company_type_job_1 to 'PATH/company_type_job_1.csv' csv
\copy complete_cast_job_1 to 'PATH/complete_cast_job_1.csv' csv
\copy info_type_job_1 to 'PATH/info_type_job_1.csv' csv
\copy keyword_job_1 to 'PATH/keyword_job_1.csv' csv
\copy kind_type_job_1 to 'PATH/kind_type_job_1.csv' csv
\copy link_type_job_1 to 'PATH/link_type_job_1.csv' csv
\copy movie_companies_job_1 to 'PATH/movie_companies_job_1.csv' csv
\copy movie_info_job_1 to 'PATH/movie_info_job_1.csv' csv
\copy movie_info_job_1_idx to 'PATH/movie_info_job_1_idx.csv' csv
\copy movie_keyword_job_1 to 'PATH/movie_keyword_job_1.csv' csv
\copy movie_link_job_1 to 'PATH/movie_link_job_1.csv' csv
\copy name_job_1 to 'PATH/name_job_1.csv' csv
\copy person_info_job_1 to 'PATH/person_info_job_1.csv' csv
\copy role_type_job_1 to 'PATH/role_type_job_1.csv' csv
\copy title_job_1 to 'PATH/title_job_1.csv' csv
```

To import the CSV files to another database, create all tables (see
`schema.sql` and optionally `fkindexes.sql`) and run the same copy as
above statements but replace the keyword_job_1 "to" by "from".

### Questions
Contact Viktor Leis (leis@in.tum.de) if you have any questions.
