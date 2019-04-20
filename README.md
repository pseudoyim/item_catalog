# Project 4: Item Catalog

<i>My Books</i> is a web application that stores information about the books a user has read. It provides a user registration and authentication system (via Google), and registered users will have the ability to post, edit and delete their own data about the books they've read.


## Requirements

To run this program, you will need Python >=3.6 and the following packages:

- `flask`
- `httplib2`
- `oauth2client`
- `requests`
- `sqlalchemy`
- `postgresql` (if you don't already have this installed on your system)

Please see `conda_list.txt` for the full list of packages and dependencies. All packages were originally installed via `conda` using the `anaconda` and `conda-forge` channels.


## Application files

- `catalog.sql`: Runs SQL commands to set up the postgres database for the application.
- `database_setup.py`: Provides python interface to the database.
- `application.py`: Flask application for the user interface, CRUD functions, user authentication/authorization.


## How to run

1. Create and activate an environment (I recommend `conda`) with the packages listed above in the <i>Requirements</i> section.

2. Clone this repo and `cd` into it.

3. Start postgres and create a database called `catalog`.
```
$ psql
postgres=> CREATE DATABASE catalog;
```

4. Assign a password for the `catalog` database, and then run `\l` and note the owner name for the `catalog` database (should be in the second column). Then quit.
```
postgres=> \password
(enter a new password)

postgres=> \l

postgres=> \q
```

5. Update the following lines of code in to match your database credentials:

- In `application.py`, line 22: Replace `owner:password` with your owner name and password.
- In `database_setup.py`, line 92: Replace `owner:password` with your owner name and password.

6. From the terminal, run this postgres command to configure and create tables in your `catalog` database using the `catalog.sql` dump file:
```
$ psql catalog < catalog.sql
```

7. Run `application.py`.
```
$ python application.py
```

8. Open a browser and go to the url provided in the output (e.g. `http://0.0.0.0:8000/`)


