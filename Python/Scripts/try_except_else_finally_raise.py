# Understanding logical sequence of try/except/else/finally
Ls=[3.0,0.0,5.0,"a",8.0]
for L in Ls:
    try:
        r=1/L
        print(r)
    except ZeroDivisionError as e:
        print(e)
    except TypeError as e:
        print(e)
    except: # It will capture all the remaining errors but do not recommend to use since we want to capture the error type.
            # If no except and there is an error that does not belong to the above, then the program will terminate after executing finally.
        print("All the remaining errors")
    else: # If no except, else will be executed.
        print("No error")
    finally: # finally will always be executed.
        print("Always executed")
        print("="*20)

# Using raise to achieve more user-fond errors.
def trans(Score):
    if (Score<=100) and (Score>=0):
        return Score*5/100
    else:
        raise Exception('out of the extent') # ValueError, TypeError, and etc. can also be used.

Ls=[87,45,98,34,102,0,-24]
for L in Ls:
    try:
        New_Score=trans(L)
        print(New_Score)
    except Exception as e: # If except and its execution codes been commented, raise will throw out the error information and terminate the program.
        print(e)
    finally:
        print("="*20)