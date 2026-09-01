aws_profile = personal
python=uv run
ECR_REPOSITORY ?= public.ecr.aws/y7p3h7o4/mkdocs-deploy
CI_IMAGE_TAG ?= py3.13-mkdocs1.6.1-material9.7.7-v1
CI_IMAGE := $(ECR_REPOSITORY):$(CI_IMAGE_TAG)
CONTAINER_TOOL ?= podman

build:
	$(python) -m mkdocs build

ci-image-build:
	$(CONTAINER_TOOL) build --pull --tag $(CI_IMAGE) .

ci-image-push: ci-image-build
	aws ecr-public get-login-password --region us-east-1 | $(CONTAINER_TOOL) login --username AWS --password-stdin public.ecr.aws
	$(CONTAINER_TOOL) push $(CI_IMAGE)

ci-image: ci-image-push

s3:
	aws s3 sync ./site s3://filipelucas-notes
	aws s3 sync ./site s3://kb.techland42.com

invalidate-cache:
	aws cloudfront create-invalidation --distribution-id EJU9GM7ZEVU6P --paths '/*'
	aws cloudfront create-invalidation --distribution-id E3D5O6ME0U6QCR --paths '/*'
	

deploy: build s3 invalidate-cache