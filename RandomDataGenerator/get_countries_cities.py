import json
import random
file = "data/countries.json"


def get_cities():
    selected_countries = []
    with open(file, "r") as f:
        countries = json.load(f)

    for i in range(5):
        selected_countries.append(
            countries[random.randint(0, len(countries)-1)])

    return selected_countries
