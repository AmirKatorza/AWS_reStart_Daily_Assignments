import boto3
import os


# This function creates a new S3 bucket with the given name.
def create_s3_bucket(s3_client, bucket_name):
    try:
        response = s3_client.create_bucket(Bucket=bucket_name,
                                           CreateBucketConfiguration={'LocationConstraint': 'us-west-2'})
    except:
        print("Bucket name already exists, try again")
    else:
        print("Bucket created successfully!")
        print(response)


# This function uploads a single file to the given S3 bucket.
def upload_file_to_s3(s3_client, file_path, bucket_name):
    object_name = os.path.basename(file_path)
    # Upload the file
    try:
        response = s3_client.upload_file(file_path, bucket_name, object_name)
    except:
        print("Error")
    else:
        print("File was uploaded successfully!")
        print(response)


# This function uploads all the files in the given directory to the given
# S3 bucket.
def upload_files_to_s3(s3_client, directory_path, bucket_name):
    for entry in os.listdir(directory_path):
        file_path = os.path.join(directory_path, entry)
        if os.path.isfile(file_path):
            print(f"Uploading {entry}")
            upload_file_to_s3(s3_client, file_path, bucket_name)


# This function lists all the objects in the given S3 bucket.
def list_s3_objects(s3_client, bucket_name):
    objects = s3_client.list_objects_v2(Bucket=bucket_name)
    objects_list = objects['Contents']
    print("Listing all bucket\'s objects:")
    for idx, obj in enumerate(objects_list):
        print(f"{idx + 1}. {obj['Key']}")

    return objects_list


# This function downloads the given file from the given S3 bucket to
# the specified path.
def download_file_from_s3(s3_client, bucket_name, file_name, download_path):
    local_file_path = os.path.join(download_path, file_name)
    s3_client.download_file(bucket_name, file_name, local_file_path)


# This function deletes the given S3 bucket.
def delete_s3_bucket(s3_client, bucket_name):
    print("Cheking if bucket is empty...")
    objects = s3_client.list_objects_v2(Bucket=bucket_name)
    fileCount = objects['KeyCount']
    if fileCount == 0:
        response = s3_client.delete_bucket(Bucket=bucket_name)
        print(f"{bucket_name} was deleted successfully!!!")
    else:
        print(f"{bucket_name} is not empty {fileCount} objects present")
        while True:
            del_choice = input("Do you wish to continue (Y/N): ")
            if (del_choice == "Y") or (del_choice == "y"):
                print("Deleting objects from S3 bucket")
                objects_dict = {'Objects': [{'Key': obj['Key']} for obj in objects['Contents']], 'Quiet': False}
                del_obj_response = s3_client.delete_objects(Bucket=bucket_name, Delete=objects_dict)
                del_bckt_response = s3_client.delete_bucket(Bucket=bucket_name)
                print(f"{bucket_name} was deleted successfully")
                break
            
            elif del_choice == "N" or del_choice == "n":
                print("Cancelling Deletion...")
                break
            
            else:
                print("Invalid Value, try again")


def choose_bucket(s3_client):
    # List available buckets
    print("Listing available S3 buckets:")
    response = s3_client.list_buckets()
    bucket_list = response['Buckets']
    for idx, bckt in enumerate(bucket_list):
        print(f"{idx + 1}. {bckt['Name']}")

    # Choose bucket name
    while True:
        bucket_number = int(input(f"Choose bucket [1-{len(bucket_list)}]: "))
        if 1 <= bucket_number <= len(bucket_list):
            break
        else:
            print("Invalid choice please try again")

    return bucket_list[bucket_number - 1]['Name']


def main():
    region = 'us-west-2'
    client = boto3.client('s3', region_name=region)

    flag = True
    while flag:

        print("-------------MENU---------------------")
        print("1. Create S3 bucket")
        print("2. Upload a single file to S3 bucket")
        print("3. Upload multiple files to S3 bucket")
        print("4. Download File from S3")
        print("5. List files in S3")
        print("6. Delete a S3 bucket")
        print("7. Quit")
        print("--------------------------------------\n")

        user_choice = input("Please enter your choice: ")

        if user_choice == "1":
            bucket_name = input("Please enter bucket name: ")
            create_s3_bucket(client, bucket_name)

        elif user_choice == "2":
            file_path = input("Please enter file path to upload: ")
            bucket_name = choose_bucket(client)
            upload_file_to_s3(client, file_path, bucket_name)

        elif user_choice == "3":
            base_dir = input("Enter directory path to upload: ")
            bucket_name = choose_bucket(client)
            upload_files_to_s3(client, base_dir, bucket_name)

        elif user_choice == "4":
            print("Choose a bucket you wish to download from")
            bucket_name = choose_bucket(client)
            print(f"Listing all object in bucket: {bucket_name}")
            objects_list = list_s3_objects(client, bucket_name)
            while True:
                idx_file = int(input(f"Please choose file number you wish to download [1-{len(objects_list)}]: "))
                if 1 <= idx_file <= len(objects_list):
                    break
                else:
                    print("Invalid Value, please try again")
            file_name = objects_list[idx_file - 1]['Key']
            download_path = input("please choose folder to download file to: ")
            download_file_from_s3(client, bucket_name, file_name, download_path)

        elif user_choice == "5":
            print("Choose a bucket to list objects")
            bucket_name = choose_bucket(client)
            objects_list = list_s3_objects(client, bucket_name)

        elif user_choice == "6":
            print("Choose a bucket you wish to delete: ")
            bucket_name = choose_bucket(client)
            delete_s3_bucket(client, bucket_name)

        elif user_choice == "7":
            print("Exiting...")
            flag = False
        
        else:
            print("Invalid Value, please enter a valid number [1-7]")


if __name__ == "__main__":
    main()
