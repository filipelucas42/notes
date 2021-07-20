# AWS

*   configure profile: `aws configure --profile <profile_name>`


## services

### s3

* turn objects public:

```
{
    "Version": "2008-10-17",
    "Id": "...",
    "Statement": [
        {
            "Sid": "...",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::olx-ads/*"
        }
    ]
}
```

## CLI

### s3

* copy local folders to s3 bucket. `aws s3 cp ./<path> s3://<bucket-name> --recursive`
