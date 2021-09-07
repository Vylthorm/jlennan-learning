#incomplete - https://www.hackerrank.com/challenges/detect-html-tags/problem

import re
output = set()

for i in range(int(input())):
    temp = re.findall(r'<(\w+)(.*?)?>',input())
    #\w+ = any alphanumeric (a-zA-Z0-9_), one or more times
    #(.*?) = match any character, zero or more times, one or zero times
    #? one or zero times
    #input: <p><a href="http://www.quackit.com/html/tutorial/html_links.cfm">Example Link</a></p>
    #p is alphanum character, yoink - + sign allows it to go to end of the word?
    print(temp)
