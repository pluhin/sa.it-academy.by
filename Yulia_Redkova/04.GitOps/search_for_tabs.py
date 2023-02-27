from sys import argv
import re

for i in argv[1:]:
    file = open(i, 'r')
    result = file.read()
#    print(result)
    print("Length of the file is {}".format(len(result)))
    x = len(re.findall("\t", result))
    print("Number of TABS in file {} is {}".format(i, x))
