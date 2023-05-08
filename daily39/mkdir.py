import os

def my_mkdir(dir_name: str):
# Python program to create a directory 
    
    # Parent Directory path
    parent_dir = os.path.dirname(__file__)
    
    # Path
    path = os.path.join(parent_dir, dir_name)
  
    # Create the directory
    os.mkdir(path)
  
    print(f"Directory {dir_name} created")

if __name__ == "__main__":
    directory = input("Please enter directory name: ")
    my_mkdir(directory)  