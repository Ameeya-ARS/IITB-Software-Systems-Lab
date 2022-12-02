import os
import argparse
from collections import OrderedDict

Olympic_Data = dict()                        

# For taking file path as an argument
praser = argparse.ArgumentParser()
praser.add_argument("--path", dest="path", required=True, help="enter input file", metavar="FILE")
argc = praser.parse_args() 

os.chdir(argc.path)

# This will print list of files in that folder 
# # print(os.listdir()) 

for file in os.listdir() :

      if file.endswith(".txt") :

            f = open(file,'r') # Open File In Read Mode
            # List Of countryname-gold-silver-bronze
            L = f.read().split('\n')  
            L.pop(len(L)-1)                   
                  
            for ele in L :

                  temp = ele.split('-')

                  country = temp[0]
                  gold = int(temp[1])
                  silver = int(temp[2])
                  bronze = int(temp[3])

                  if country not in Olympic_Data.keys() :

                        #Adding new country to dictionary
                        Olympic_Data[country] = [gold,silver,bronze]

                  else :

                        #Updating number of medals
                        Olympic_Data[country][0] += gold
                        Olympic_Data[country][1] += silver
                        Olympic_Data[country][2] += bronze  

# Now Sorting According To Statement

print(dict(sorted(Olympic_Data.items() , key = lambda v : (-v[1][0],v[0]) , reverse = False)))
