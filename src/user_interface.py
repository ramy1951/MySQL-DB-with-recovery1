"""
This is the user interface where the program interacts with the user.
USAGE: 1. Go to sqlconfig.conf file and change the username and password
          values to the ones from you are using in your mysql instance
       2. Open a terminal windows and run the following command:
       python3 user_interface.py
NOTE: Only option 3 and 4 from the menu is implemented so students can
      understand the flow of the program as a base to
      implement the rest of the options
"""


from database import DB

LOGGED_IN_USER = None
DATABASE_NAME = "ATM_management_system_DB"


def db_checks(db_object):
    try:
        db_object.run_sql_file("tests.sql")
        print("DB OK!")
        return True
    except Exception as e:
        print("Looks like something is wrong with testing to db:", e)
        print("!!!BAD DATABASE CHECKS!!!")
        return False


def write_to_transactions(db_object, query, values=None, filePath="transactions.sql"):
    print("query", query)
    print("values", values)

    if values is not None:
        for value in values:
            query = query.replace("%s", "'" + value + "'", 1)

    file = open(filePath, "a")
    file.write(query + "\n")
    print("Query saved in {}".format(filePath))


def get_insert_query(table, attributes, values):
    list_wildcards = []

    for i in range(len(values)):
        list_wildcards.append('%s')

    wildcards = ", ".join(list_wildcards)
    attributes_to_str = ", ".join(attributes)
    query = """INSERT INTO {} ( {} ) VALUES ( {} );""".format(
        table, attributes_to_str, wildcards)
    values = [x.strip(' ') for x in values]
    values = tuple(values)
    return query


def show_menu():
    """
    Prints in console the main menu
    :return: VOID
    """
    print("User Menu \n"
          "1. Create Account \n"
          "2. Login \n"
          "3. Search \n"
          "4. Insert \n"
          "5. Update \n"
          "6. Delete \n"
          "7. Exit \n")


def show_table_names(tables):
    """
    Show all the tables names
    :param tables: a list with the tables names.
                   You can get it by calling the method
                   get_table_names() from DB object
    :return: VOID
    """
    index = 1
    print("\nTables:")
    for table in tables:
        print(table[0])  # print tables names
        index += 1


def _select(db_object, table, attributes, value, query=None):
    """
    Uses the select from api given to make sure columns
    and results match.
    :return: VOID
    """
    if query:
        results = db_object.select(query=query, value=value)

    # get columns names for the table selected
    columns = db_object.get_column_names(table)
    print("columns: ", columns)
    columns_list = []

    for column in columns:
        # print("adding", column[0])
        columns_list.append(column[0])

    columns_string = ", ".join(columns_list)
    # build queries with the user input
    query = """SELECT {} FROM {} WHERE {} = %s;""".format(columns_string,
                                                          table,
                                                          attributes)
    results = db_object.select(query=query, values=value)

    object_returned = {}
    column_index = 0
    for column in columns:
        values = []
        for result in results:
            values.append(result[column_index])
        print("{}: {}".format(column[0], values))  # print attribute: value
        object_returned[column[0]] = values[0]
        column_index += 1

    print("_select is done: ", object_returned)

    return object_returned


def show_column_names(db_object, table):
    """
    Show all the colomn names for a given table
    :param table: table getting names for
    :return: VOID
    """
    columns = db_object.get_column_names(table)
    index = 1
    print("\nColumns:")
    for column in columns:
        print(column[0])
        index += 1


def get_user(db_object, email):
    query = """SELECT user_id, email, password, first_name, last_name FROM {} WHERE {} = %s""".format(
        "User", "email")
    user_object = _select(db_object=db_object, table="User",
                          attributes="email", value=email)

    return user_object

    user_object = {}

    # get the results from the above query
    results = db_object.select(query=query, values=email)

    print("results: ", results)

    if not results:
        return user_object

    user_object['user_id'] = results[0][0]
    user_object['email'] = results[0][1]
    user_object['password'] = results[0][2]
    user_object['first_name'] = results[0][3]
    user_object['last_name'] = results[0][4]

    return user_object


def option1(db_object):
    """
    Creates User and Safeex Account connecting the user created.
    :param db_object: database object
    :return: VOID
    """

    try:
        # get user input
        newEmail = input("\nNew Email: ")
        newPassword = input("New Password: ")
        newDateOfBirth = input("Date of Birth (YYYY/MM/DD):")
        firstName = input("First Name:")
        lastName = input("Last Name:")

        table = "User"
        attributes = ["gov_issued_id", "email", "password",
                      "date_of_birth", "first_name", "last_name"]
        values = ["string gov id", str(newEmail), str(newPassword),
                  str(newDateOfBirth), str(firstName), str(lastName)]

        query = get_insert_query(
            table=table, attributes=attributes, values=values)

        if db_object.insert(query=query, values=values):
            write_to_transactions(db_object, query=query, values=values)

        values = [newEmail]
        query = """INSERT INTO SafeEx_account (User) select user_id FROM User WHERE email = %s;"""

        if db_object.insert(query=query, values=values):
            write_to_transactions(db_object, query=query, values=values)

    except Exception as err:  # handle error
        print("Err creating an account\n", err)


def option2(db_object):
    """
    Logs in a user.
    :param db_object: database object
    :return: VOID
    """
    try:
        # get user input
        # email = input("\nEmail: ")
        # password = input("Password: ")
        email = "ramy1951"
        password = "123"

        attributes = ["email", "password"]

        values = [email, password]

        query = """SELECT email, first_name, last_name FROM {} WHERE {} = %s""".format(
            "User", "email")

        user = get_user(db_object, email)

        if 'user_id' not in user.keys():
            print("Email not found, failed login!")
            return

        user_password = user['password']

        if user_password != password:
            print("bad password, failed login!")
            return

        # successful login beyond this point!

        attributes = ["safeex_account", "user"]

        query = """SELECT safeex_account_id FROM {} WHERE {} = %s""".format(
            "SafeEx_account", "user")

        # get the results from the above query
        results = db_object.select(
            query=query, values=[str(user['user_id'])])

        safeex_account_id = str(results[0][0])

        # insert into login table..
        values = [safeex_account_id, str(user['user_id'])]
        query = get_insert_query(
            table="Login", attributes=attributes, values=values)

        if db_object.insert(
                table="Login", attributes=attributes, values=values):
            write_to_transactions(db_object=db_object,
                                  query=query, values=values)

        print("Hi {}! You are now logged in as {}".format(
            user['first_name'], user['email']))

        LOGGED_IN_USER = user
    except Exception as err:  # handle error
        print("Err creating an account\n", err)


def option3(db_object, tables):
    """
    Search option
    :param db_object: database object
    :param tables: the name of the tables in the database
    :return: VOID
    """
    try:
        # shows that tables names in menu
        show_table_names(tables)

        # get user input
        # table_selected = input("\nSelect a table to search: ")
        # attribute_selected = input("Search by (i.e name)? ")
        # value_selected = input("Enter the value: ")

        table_selected = "User"
        attribute_selected = "password"
        value_selected = "123"


        if table_selected.lower() == "transaction":
            query = """SELECT Transaction.title as transaction_title, Transaction.amount as amount, sender.first_name as sender, recipient.first_name as recipient 
            FROM Transaction				 
            JOIN User sender ON sender.user_id = Transaction.sender
            JOIN User recipient ON recipient.user_id = Transaction.recipient
            WHERE Transaction.{} = %s; """.format(attribute_selected)

        if table_selected.lower() == "login":
            query = """SELECT user.first_name as "first_name", user.last_name as "last_name", SafeEx_account.created_at as "account_created_at", Login.login_at as "logged_in_at"
            FROM Login				 
            JOIN User user ON user.user_id = Login.user
            JOIN SafeEx_account SafeEx_account ON SafeEx_account.safeex_account_id = Login.safeex_account
            WHERE login.user = %s; """
            value_selected = LOGGED_IN_USER['user_id']
            print(query)

        if table_selected.lower() == "police_report":
            query = """SELECT Police_report.police_report_id as report_id, u.first_name as reporter_first_name, u.last_name as reporter_last_name
            FROM Police_report
            JOIN User u on u.user_id = Police_report.user 
            JOIN Incident i on i.incident_id = Police_report.incident 
            WHERE u.user_id = %s; """
            value_selected = LOGGED_IN_USER['user_id']
            print(query)

        # get the results from the above query
        column_index = 0

        result = _select(db_object=db_object, table=table_selected,
                         attributes=attribute_selected, value=value_selected)

        # print results
        print("\n")
        print("Results from: " + table_selected)
        for key in result.keys():
            print("{}: {}".format(key, result[key]))
        print("\n")

    except Exception as err:  # handle error
        print("The data requested couldn't be found\n", err)


def option4(db_object, tables):
    try:
        # show tables names
        show_table_names(tables)

        # get user input for insert
        table = input("\nEnter a table to insert data: ")
        show_column_names(db_object, table)

        attributes_str = input(
            "Enter the name attribute/s separated by comma? ")
        values_str = input("Enter the values separated by comma: ")
        

        # from string to list of attributes and values
        if "," in attributes_str:  # multiple attributes
            attributes = attributes_str.split(",")
            values = values_str.split(",")
        else:  # one attribute
            attributes = [attributes_str]
            values = [values_str]

        list_wildcards = []

        for i in range(len(values)):
            list_wildcards.append('%s')

        wildcards = ", ".join(list_wildcards)
        attributes_to_str = ", ".join(attributes)
        query = """INSERT INTO {} ( {} ) VALUES ( {} );""".format(
            table, attributes_to_str, wildcards)
        values = [x.strip(' ') for x in values]
        values = tuple(values)

        # if db_object.insert(table=table, attributes=attributes, values=values):
        if db_object.insert(query=query, values=values):
            write_to_transactions(db_object, query=query, values=values)
            print("Data successfully inserted into {} \n".format(table))

    except Exception as e:  # data was not inserted, then handle error
        print("Error:", values_str, "failed to be inserted in ", table, "\n", e)


def option5(db_object, tables):
    try:
        # show tables names
        show_table_names(tables)

        # get user input for insert
        table = input("\nEnter a table to update data: ")
        show_column_names(db_object, table)

        attributes_str = input(
            "Enter the name attribute/s separated by comma? ")
        values_str = input("Enter the values separated by comma: ")
        unique_str = input("Enter the id of item you would like to update: ")

        # from string to list of attributes and values
        if "," in attributes_str:  # multiple attributes
            attributes = attributes_str.split(",")
            values = values_str.split(",")
        else:  # one attribute
            attributes = [attributes_str]
            values = [values_str]

        set_clause = " = %s, ".join(attributes)
        set_clause = set_clause + " = %s"

        query = """UPDATE {} SET {} WHERE {}_id = '{}';""".format(
            table, set_clause, table, unique_str)

        if db_object.update(query=query, values=values):
            queryToWrite = query % tuple(values)
            write_to_transactions(db_object, query=query, values=values)

            print("Data successfully updated into {} \n".format(table))

    except Exception as e:  # data was not inserted, then handle error
        print("Error:", values_str, "failed to be updated in ", table, ": \n", e)


def option6(db_object, tables):
    try:
        show_table_names(tables)

        table = input("\nEnter a table to delete data from: ")
        unique_str = input("Enter the id of item you would like to DELETE: ")

        query = """DELETE FROM {} WHERE {}_id = {};""".format(
            table, table, unique_str)

        if db_object.delete(query=query):
            write_to_transactions(db_object, query=query)
            print("Data successfully deleted from {} \n".format(table))

    except Exception as e:
        print("Error:", unique_str, "failed to be deleting in ", table, ": \n", e)


# Driver execution.....

print("Setting up the database......\n")

# DB API object
db = DB(config_file="sqlconfig.conf")

# create a database (must be the same as the one is in your config file)
database = DATABASE_NAME
isDbOk = False

try:
    isDbOk = db_checks(db_object=db)
except Exception as e:
    print("DB CHECKS FAILED => ", e)

print("tests results are: ", isDbOk)

if not isDbOk:
    if db.create_database(database=database, drop_database_first=True):
        print("Created database {}".format(database))
    else:
        print("An error occurred while creating database {} ".format(database))

    # create all the tables from databasemodel.sql
    db.run_sql_file("databasemodel.sql")

    # insert sample data from insert.sql
    db.run_sql_file("insert.sql")

    # get tables up to date with last queries
    db.run_sql_file("transactions.sql")

else:
    print("ELSEE")
print("\nSet up process finished\n")

tables = db.get_table_names()
show_menu()
option = int(input("Select one option from the menu: "))
while option != 7:
    if option == 1:
        option1(db)  # create your account
    elif option == 2:
        option2(db)  # login
    elif option == 3:
        option3(db, tables)
    elif option == 4:
        option4(db, tables)
    elif option == 5:
        option5(db, tables)
    elif option == 6:
        option6(db, tables)

    show_menu()
    option = int(input("Select one option from the menu: "))
