#! /bin/bash

function make_bucket() {
    read -p "Please enter bucket name: " bucket_name
    region=us-west-2
    aws s3 mb s3://$bucket_name --region $region
}

function upload() {
    echo "Listing files in images folder:"
    ls -l ./images/
    local flag=0
    while [ $flag -eq 0 ]
        do
            read -p "Please enter file name to upload: " file_name
            if [ -f "./images/$file_name" ]; then
                read -p "Please enter bucket name: " bucket_name
                aws s3api put-object --bucket $bucket_name --key images/$file_name --body ./images/$file_name
                flag=1
            else 
                echo "$file_name does not exist."
            fi    
        done    
}

function download() {
    list_files
    read -p "Please enter file name to download: " file_name
    aws s3api get-object --bucket $bucket_name --key images/$file_name ./downloads/$file_name
}

function delete() {
    read -p "Please enter bucket name: " bucket_name
    read -p "Please enter file name to delete: " file_name    
    aws s3api delete-object --bucket $bucket_name --key images/$file_name
}

function list_files() {
    read -p "Please enter bucket name: " bucket_name
    echo "Listing Files in S3 bucket"    
    aws s3 ls s3://$bucket_name/images/ --human-readable --summarize
}

function main() {
    flag=0
    while [ $flag -eq 0 ]
        do
            echo "-------------MENU---------------------"
            echo "1. Create S3 bucket"
            echo "2. Upload File to S3"
            echo "3. Download File from S3"
            echo "4. Delete File from S3"
            echo "5. List files in S3"
            echo "6. Quit"        
            echo -e "--------------------------------------\n"
            
            read -p "Please enter your choice: " user_choice           
            case $user_choice in
            1 ) make_bucket ;;
            2 ) upload ;;                 
            3 ) download ;;
            4 ) delete ;;
            5 ) list_files ;;
            6 ) 
                flag=1 
                ;;
            * ) 
                echo "Invalid Choice, Please try again!" 
                ;;            
            esac
        done
}

main