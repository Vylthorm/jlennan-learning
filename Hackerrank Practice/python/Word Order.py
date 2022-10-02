num_words = int(input())
dict_words = {}
word_count = []
for i in range(num_words):
    word = input()
    if word in dict_words:
        dict_words[word] += 1
    elif i not in dict_words:
        dict_words[word] = 1
for x,y in dict_words.items():
    word_count.append(y)
print(len(word_count))
print(*word_count)
