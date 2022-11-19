import json
import random

import conn

import get_countries_cities
file = "data/countries.json"


def main():
    selected_countries = get_countries_cities.get_cities()

    cursor = conn.db.cursor()
    cursor.execute("""INSERT INTO `country` (`country_id`, `country`) VALUES
    (0, '{}'),
    (1, '{}'),
    (2, '{}'),
    (3, '{}'),
    (4, '{}'); 
    """.format(selected_countries[0]["country"], selected_countries[1]["country"], selected_countries[2]["country"], selected_countries[3]["country"], selected_countries[4]["country"]))

    conn.db.commit()

    print(cursor.rowcount, "record inserted.")

    cursor.execute("""INSERT INTO `city` (`city_id`, `city`, `country_id`) VALUES
    (0, '{}', 0),
    (1, '{}', 0),
    (2, '{}', 0),
    (3, '{}', 1),
    (4, '{}', 1), 
    (5, '{}', 1), 
    (6, '{}', 2), 
    (7, '{}', 2), 
    (8, '{}', 2), 
    (9, '{}', 3), 
    (10, '{}', 3), 
    (11, '{}', 3), 
    (12, '{}', 4), 
    (13, '{}', 4), 
    (14, '{}', 4); 
    """.format(
        selected_countries[0]["cities"][0],
        selected_countries[0]["cities"][1],
        selected_countries[0]["cities"][2],
        selected_countries[1]["cities"][0],
        selected_countries[1]["cities"][1],
        selected_countries[1]["cities"][2],
        selected_countries[2]["cities"][0],
        selected_countries[2]["cities"][1],
        selected_countries[2]["cities"][2],
        selected_countries[3]["cities"][0],
        selected_countries[3]["cities"][1],
        selected_countries[3]["cities"][2],
        selected_countries[4]["cities"][0],
        selected_countries[4]["cities"][1],
        selected_countries[4]["cities"][2],
    ))

    conn.db.commit()

    print(cursor.rowcount, "record inserted.")


if __name__ == '__main__':
    main()
