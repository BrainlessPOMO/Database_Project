from sqlite3.dbapi2 import connect
import sqlite3 as sql
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.firefox.webdriver import WebDriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.common.exceptions import TimeoutException
import chromedriver_autoinstaller
import os


motherboards_names = [
    'MSI B550 Gaming GEN3',
    'ECS Elitegroup A520AM4-M3D',
    'ECS Elitegroup A520AM4-M3',
    'Gigabyte MC12-LE0',
    'ASRock Rack X570D4U-2L2T-BCM',
    'MSI Pro B550M-P GEN3',
    'MSI Pro B550-P GEN3',
    'MSI MAG B550 Tomahawk Max WIFI',
    'MSI MAG B550M Mortar Max WIFI',
    'MSI Pro A320M-B',
    'ASRock B550M PG Riptide',
    'ASUS TUF Gaming B550M-Plus WIFI II',
    'ASUS Prime X570-P',
    'ASUS Pro WS X570-Ace',
    'ASUS TUF Gaming A520M-Plus II',
    'Gigabyte A520 Aorus Elite',
    'MSI MPG X570 Gaming Plus',
    'MSI MEG X570 Unify',
    'Gigabyte X570S Aorus Master',
    'Gigabyte X570 Aorus Pro',
    'EVGA X570 Dark',
    'EVGA X570 FTW WIFI',
    'ASRock X570 Phantom Gaming X'
]


def main():
    # Search for chrome driver or make one if it does not exist
    print(os.name)
    if str(os.name) == 'nt':
        chromedriver_autoinstaller.install()
    else:
        print("This program is made for windows. I am sorry!!")
        quit()

    url = 'https://www.skroutz.gr/c/31/motherboards-mhtrikes.html'
    driver = webdriver.Chrome()
    driver.set_window_size(1200, 800, windowHandle='current')
    driver.set_window_position(0, 0, windowHandle='current')
    driver.get(url)

    try:
        input_box = WebDriverWait(driver, 5).until(
            EC.presence_of_element_located((By.ID, 'search-bar-input')))
        input_box.sendKeys(motherboards_names[0])
    except TimeoutException:
        driver.refresh()

    # Exit driver
    driver.quit()
