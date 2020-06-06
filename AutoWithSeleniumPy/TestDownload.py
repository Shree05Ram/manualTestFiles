from selenium import webdriver

fp= webdriver.FirefoxProfile()

fp.set_preference('browser.helperApps.neverAsk.saveToDisk','text/plain,application/pdf')  #Mime type
fp.set_preference('browser.download.manager.showWhenStarting',False)
fp.set_preference('browser.download.dir','/home/shreeram/Desktop/Aikaan/test/manualTestFiles/AutoWithSeleniumPy')
fp.set_preference('browser.download.folderList',2) # downloads files to 0->Desktop, 1->Downloads dir, 2->Specified dir
fp.set_preference('pdfjs.disabled',True)

driver= webdriver.Firefox(firefox_profile=fp)

driver.get("http://demo.automationtesting.in/FileDownload.html")

driver.find_element_by_id("textbox").send_keys("testing download text file")
driver.find_element_by_id("createTxt").click()
driver.find_element_by_id("link-to-download").click()

driver.find_element_by_id("pdfbox").send_keys("testing pdf")
driver.find_element_by_id("createPdf").click()
driver.find_element_by_id("link-to-download").click()
