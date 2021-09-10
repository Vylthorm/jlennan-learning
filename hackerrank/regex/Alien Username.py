import re
n = int(input())
for i in range(n):
    x = re.findall(r'^[_.]\d+[a-zA-Z]*[_ ]?$',input())
    if x == []:
        print('INVALID')
    else:
        print("VALID")
