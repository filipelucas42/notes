aws_profile = personal
python=uv run
build:
	$(python) -m mkdocs build

s3:
	aws s3 sync ./site s3://filipelucas-notes
	aws s3 sync ./site s3://kb.techland42.com

invalidate-cache:
	aws cloudfront create-invalidation --distribution-id EJU9GM7ZEVU6P --paths '/*'
	aws cloudfront create-invalidation --distribution-id E3D5O6ME0U6QCR --paths '/*'
	

deploy: build s3 invalidate-cache