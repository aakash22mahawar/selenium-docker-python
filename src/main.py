from my_selenium import driver_setup
from bs4 import BeautifulSoup
import time

driver = driver_setup()
driver.get('https://books.toscrape.com/')
time.sleep(5)
src = driver.page_source
soup = BeautifulSoup(src, 'lxml')
text = soup.select_one('div.col-sm-8.h1>a').text
print({'result': text})
driver.quit()
print('driver quit successfully')