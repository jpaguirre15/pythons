# Hint:
# Use "print type(<variable>)" to figure out data type for a variable,
# like shown below

str1 = 'Execute Order '
int1 = 66

print "str1 data type: ", type(str1)
print "int1 data type: ", type(int1)

print "str1 data type (after conversion): ", type(str1)
print "int1 data type (after conversion): ", type(str(int1))

print "Combined data type: ", type(str1 + str(int1))

print "\n"

# CODE HERE

str1 = u'Execute Order '
print str1 + str(int1)
print "Combined data type: ", type(str1 + str(int1))
