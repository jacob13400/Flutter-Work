import requests 
  
# api-endpoint 
URL = "http://worldtimeapi.org/api/timezone"
  
# location given here 
location = "delhi technological university"
  
# defining a params dict for the parameters to be sent to the API 
PARAMS = {'address':location} 
  
# sending get request and saving the response as response object 
r = requests.get(url = URL, params = PARAMS) 
  
# extracting data in json format 
data = r.json()
    
print(data)
# WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),

timeData = ""
for i in data:
    timeData+="\nWorldTime(url: \""+i+"\", location: 'London', flag: 'uk.png'),"

path = '/home/jake/Desktop/Waste/Flutter-Work/countries.txt'
country_file = open(path,'w')
country_file.write(timeData)
