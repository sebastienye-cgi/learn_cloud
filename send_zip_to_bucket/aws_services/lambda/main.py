import json

def lambda_handler(event, context):
    print("Hello World")

    return {
        'statusCode': 200,
        'body': json.dumps("hello world from lambda")
    }