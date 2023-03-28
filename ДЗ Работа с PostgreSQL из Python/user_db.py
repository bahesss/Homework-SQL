import sqlite3


def create_struct():
    connection = sqlite3.connect("user.db")

    cursor = connection.cursor()

    cursor.execute('''
                create table if not exists user_info(
                    first_name,
                    last_name,
                    email,
                    phone
                )
                ''')

    return [cursor, connection]


def add_user(cursor, connection, name, last_name, email=None, phone=None):
    """
    :param cursor: cursor object
    :param connection: connection object
    :param name: string
    :param last_name: string
    :param email: string or None
    :param phone: string or list[string]
    :return:
    """

    if type(phone) == str:
        phones = [phone]
    else:
        phones = [] + phone

    cursor.execute('''
                        select
                            first_name
                        from user_info
                        WHERE first_name = ?
                        and last_name = ? 
                        ''', [name, last_name])

    if cursor.fetchone() is not None:
        print('This user already exists')
        return 1

    cursor.execute('''
                insert into user_info(first_name, last_name, email, phone)
                values (?, ?, ?, ?)
                ''', [name, last_name, email, str(phones)])
    connection.commit()

    return 0


def add_phone(cursor, connection, name, last_name, phone):
    """
    :param cursor: cursor object
    :param connection: connection object
    :param name: str
    :param last_name: str
    :param phone: str
    :return:
    """

    cursor.execute('''
                    select
                        phone
                    from user_info
                    WHERE first_name = ?
                    and last_name = ? 
                    ''', [name, last_name])

    phones = eval(cursor.fetchone()[0])
    phones.append(phone)

    cursor.execute('''
                    UPDATE user_info
                    SET phone = ?
                    
                    WHERE first_name = ?
                    and last_name = ?
                    ''', [str(phones), name, last_name])
    connection.commit()

    return 0


def change_info(cursor, connection, name, last_name, change_dict):
    """
    :param cursor: cursor object
    :param connection: connection object
    :param name: str
    :param last_name: str
    :param change_dict: dict like: {'first_name': 'Bella',
                                    'last_name': None,
                                    'email': 'asdfa@gmail.com',
                                    'phone': ['+923859439']}
    :return:
    """
    if change_dict['first_name'] is None:
        dub_search_name = name
    else:
        dub_search_name = change_dict['first_name']

    if change_dict['last_name'] is None:
        dub_search_last_name = last_name
    else:
        dub_search_last_name = change_dict['last_name']

    cursor.execute('''
                            select
                                first_name
                            from user_info
                            WHERE first_name = ?
                            and last_name = ? 
                            ''', [dub_search_name, dub_search_last_name])

    if cursor.fetchone() is not None:
        print('Such user already exists')
        return 1

    changes = ',\n'.join([f'{key} = \"{value}\"' for key, value in change_dict.items() if value is not None])

    cursor.execute(f'''
                        UPDATE user_info
                        SET {changes}

                        WHERE first_name = ?
                        and last_name = ?
                        ''', [name, last_name])
    connection.commit()

    return 0


def delete_phone(cursor, connection, name, last_name, phone_to_delete):
    """
    :param cursor: cursor object
    :param connection: connection object
    :param name: str
    :param last_name: str
    :param phone_to_delete: str
    :return:
    """

    cursor.execute('''
                    select
                        phone
                    from user_info
                    WHERE first_name = ?
                    and last_name = ? 
                    ''', [name, last_name])

    phones = eval(cursor.fetchone()[0])
    phones.remove(phone_to_delete)

    cursor.execute('''
                    UPDATE user_info
                    SET phone = ?
                    
                    WHERE first_name = ?
                    and last_name = ?
                    ''', [str(phones), name, last_name])
    connection.commit()

    return 0


def delete_user(cursor, connection, name, last_name):
    """
    :param cursor: cursor object
    :param connection: connection object
    :param name: string
    :param last_name: string
    :param email: string or None
    :param phone: string or list[string]
    :return:
    """

    cursor.execute('''
                        select
                            first_name
                        from user_info
                        WHERE first_name = ?
                        and last_name = ? 
                        ''', [name, last_name])

    if cursor.fetchone() is None:
        print('There is no such user')
        return 1

    cursor.execute('''
                DELETE FROM user_info
                WHERE first_name = ?
                and last_name = ?
                ''', [name, last_name])
    connection.commit()

    return 0


def find_user(cursor, field_name, value):
    """
    :param cursor: cursor object
    :param field_name: str (name of the field to search for)
    :param value: str (value of field to search for)
    :return:
    """
    cursor.execute(f'''
                        select
                            *
                        from user_info
                        WHERE {field_name} = ? 
                        ''', [value])

    if cursor.fetchone() is None:
        print('There is no such user')
        return 1
    else:
        return cursor.fetchall()


if __name__ == '__main__':
    cur, con = create_struct()

    add_user(cur, con, 'Ilya', 'Popov', 'afhg2344@gmail.com', '+7949435032')

    add_phone(cur, con, 'Ilya', 'Popov', '+74394323455032')

    change_info(cur, con, 'Ilya', 'Popov', change_dict={'first_name': 'Bella',
                                                        'last_name': None,
                                                        'email': 'asdfa@gmail.com',
                                                        'phone': None})

    print(find_user(cur, 'last_name', 'Popov'))


