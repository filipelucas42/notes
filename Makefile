aws_profile = personal

build:
	python3 -m mkdocs build

s3:
	aws s3 sync ./site s3://filipelucas-notes --profile $(aws_profile)

invalidate-cache:
	aws cloudfront create-invalidation --distribution-id EJU9GM7ZEVU6P --paths '/*' --profile $(aws_profile)