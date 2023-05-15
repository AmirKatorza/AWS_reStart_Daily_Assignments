import os

# Write a Python script that creates a new directory.

def create_dir(path):
    os.mkdir(path)
    print(f"the directory {path} was created successfully!")

def del_dir(path):
    os.rmdir(path)
    print(f"the directory {path} was deleted successfully!")

if __name__ == "__main__":

    dir_name = input("Please enter directory name: ")
    parent_dir = input("Please enter parent directory path: ")
    path = os.path.join(parent_dir, dir_name)    
    create_dir(path)

    user_choice = input("Would you like to remove new directory [y/n]? ")
    if user_choice == 'y':
        del_dir(path)
    else:
        print(f"You chose to keep the directory {dir_name}")
          