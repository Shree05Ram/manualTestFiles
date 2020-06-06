from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
import time

driver= webdriver.Firefox()    #driver object creation
driver.implicitly_wait(3)

#Login
driver.get('https://test.aikaan.io/login')
driver.find_element_by_id('login_email').send_keys('admin@aikaan.io')
driver.find_element_by_id('login_password').send_keys('admin@123456')
driver.find_element_by_id('login_button').click()

#Skip Help Tour
time.sleep(5)
driver.find_element(By.CSS_SELECTOR,'.react-joyride__tooltip > div:nth-child(2) > div:nth-child(1) > button:nth-child(1)').click()

