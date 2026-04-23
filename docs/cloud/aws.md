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
* sync aws s3 `aws s3 sync s3://bucket-name/path/ ./local-folder/`

### cloudfront

* invalidate cache: `aws cloudfront create-invalidation --distribution-id <distribution-id> --paths '<path_to_invalidate>'`

### configure
* list available profiles `aws configure list-profiles`