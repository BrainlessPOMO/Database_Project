from sqlite3.dbapi2 import connect
import sqlite3 as sql
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.common.exceptions import TimeoutException
import chromedriver_autoinstaller
import os

import json

import time

countries = [
    "Russia",
    "Canada",
    "China",
    "Brazil",
    "Australia",
    "Indonesia",
    "Argentina",
    "Kazakhstan",
    "Algeria",
    "DR Congo",
    "Greenland",
    "Saudi Arabia",
    "Mexico",
    "Indonesia",
    "Sudan",
    "Libya",
    "Iran",
    "Mongolia",
    "Peru",
    "Chad",
    "Niger",
    "Angola",
    "Mali",
    "South Africa",
    "Colombia",
    "Ethiopia",
    "Bolivia",
    "Mauritania",
    "Egypt"
]

# Search for chrome driver or make one if it does not exist
if str(os.name) == 'nt':
    chromedriver_autoinstaller.install()
else:
    print("This program is made for windows. I am sorry!!")
    quit()

url = 'https://www.google.com'

driver = webdriver.Chrome()
driver.set_window_size(1200, 800, windowHandle='current')
driver.set_window_position(0, 0, windowHandle='current')
driver.get(url)

driver.execute_script("window.open('');")
driver.switch_to.window(driver.window_handles[1])

for coutry in countries:
    url = 'https://www.worldatlas.com/articles/biggest-cities-in-{}.html'.format(
        coutry)

    driver.get(url)

    coockies = driver.find_element(By.CLASS_NAME, 'fc-button-label')
    coockies.click()

    try:
        cities = WebDriverWait(driver, 5).until(
            EC.presence_of_element_located((By.TAG_NAME, 'h3')))
        cities = driver.find_elements(By.TAG_NAME, 'h3')
        cities_final = []
        for i in range(3):
            cities_final.append(cities[i].text)
        print(cities_final)

    except TimeoutException:
        driver.refresh()
