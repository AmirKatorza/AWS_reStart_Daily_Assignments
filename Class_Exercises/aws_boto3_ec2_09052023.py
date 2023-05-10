import boto3

def describe_instances():
    ec2 = boto3.client('ec2')
    response = ec2.describe_instances()
    print("Listing EC2 Instances:\n")
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            print(f"Instance ID: {instance['InstanceId']}")
            print(f"Instance Type: {instance['InstanceType']}")
            print(f"Instance State: {instance['State']['Name']}")
            print(f"Public IP: {instance['PublicIpAddress']}")
            print("------------------------------------------------")

if __name__ == "__main__":
    describe_instances()

