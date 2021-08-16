# Enter your code here. Read input from STDIN. Print output to STDOUT'
useless = input()
sub_1 = set(map(int,input().split()))
useless = input()
sub_2 = set(map(int,input().split()))
print(len(sub_1.intersection(sub_2)))
