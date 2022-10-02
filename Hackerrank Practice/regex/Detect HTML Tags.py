
import re
temp = []
for i in range(int(input())):
    temp += re.findall(r'<(\s*?\w+\s*?)',input())
    #<
    #\s Matches any whitespace character
    #\s*? = match any whitespace char zero or more times, one or zero times
    #\w+ = any alphanumeric (a-zA-Z0-9_), one or more times
print(';'.join(sorted(set(temp))))
