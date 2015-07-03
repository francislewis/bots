from BeautifulSoup import BeautifulSoup
import urllib2

webpage = raw_input("Enter the address of the page you want to get images from: ")

url = urllib2.urlopen(webpage)
soup = BeautifulSoup(url)
links = soup.findAll('img', src=True)
for link in links:
    print link['src']
