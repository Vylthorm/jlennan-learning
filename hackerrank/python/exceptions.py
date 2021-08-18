test_cases = int(input())
for i in range(test_cases):
    try:
        a,b = map(int,input().split())
        print(a//b)
    except ZeroDivisionError as e:
        print("Error Code:", e)
    except ValueError as e:
        print("Error Code:", e)
