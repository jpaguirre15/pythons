# Python 3
# Hint:
# Use "print(type(<variable>))" to figure out data type for a variable,
# like shown below

'''
Description: Similar to Task 1, but now, convert “str1” as a byte data type.

Sample Output:
str1 data type: <type 'str'>
int1 data type: <type 'int'>
str1 data type (after conversion): <type 'str'>
int1 data type (after conversion): <type 'str'>
Execute Order 66
Combined data type: <type 'str'>

<class 'bytes'>
<class 'int'>
Combined data type: b'Execute Order' 66
'''

str1 = 'Execute Order '
int1 = 66

print("str1 data type: ", type(str1))
print("int1 data type: ", type(int1))


print("str1 data type (after conversion): ", type(str1))
print("int1 data type (after conversion): ", type(str(int1)))

print(str1 + str(int1))

print("Combined data type: ", type(str1 + str(int1)))

print("\n")

# CODE HERE
