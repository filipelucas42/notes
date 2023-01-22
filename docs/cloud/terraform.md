# terraform

* init terraform: `terraform init`
* import resource: `terraform import aws_s3_bucket.my-bucket bucket-created-manually`
* terraform plan: `terraform plan`
* terraform apply with auto approve: `terraform apply -auto-approve`


## AWS
* basic config:
```
provider "aws" {
  
}
```

* s3 bucket:
```
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}
```

