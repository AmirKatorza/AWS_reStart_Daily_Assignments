import os
   
# Specify path
path = input("Enter file path: ")
   
# Check whether the specified
# path exists or not
isExist = os.path.exists(path)
if isExist:
   # Print file content
   with open(path, 'r') as f:
    contents = f.read()
    print(contents)
else:
  print("File not exists")

