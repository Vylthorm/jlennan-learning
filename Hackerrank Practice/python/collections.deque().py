from collections import deque
d = deque()
for i in range(int(input())):
    current_input, *numb = input().split()
    getattr(d,current_input)(*numb)
print(*d)
