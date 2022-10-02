import re
sentence_num = int(input())
sentences = ''
for i in range(sentence_num):
    sentences = sentences + ' ' + input()
query_num = int(input())
for i in range(query_num):
    queries = input()
    x = len(re.findall(rf'\w{queries}\w',sentences))
    print(x)
