import re
test_cases = int(input())
for i in range(test_cases):
    try:
        regex = True
        reg = re.compile(input())
    except re.error:
        regex = False
    print(regex)
