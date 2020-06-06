from selenium import webdriver
from selenium.webdriver.common.keys import Keys

driver= webdriver.Firefox()    #driver object creation

driver.get('https://google.com')
print driver.title
driver.quit()
