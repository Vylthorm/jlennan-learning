from collections import OrderedDict
diction = OrderedDict()
num_items = int(input())
for i in range(num_items):
    x = input().split()
    price = int(x[-1])
    item_name = " ".join(x[0:len(x)-1])
    if diction.get(item_name):
        diction[item_name] += price
    else:
        diction[item_name] = price
for i,v in diction.items():
    print(i,v)
