aws_profile = personal
python=uv run
ECR_REGISTRY ?= 562682303560.dkr.ecr.eu-west-1.amazonaws.com
ECR_REPOSITORY ?= $(ECR_REGISTRY)/mkdocs-deploy
CI_IMAGE_TAG ?= py3.13-mkdocs1.6.1-material9.7.7-v1
CI_IMAGE := $(ECR_REPOSITORY):$(CI_IMAGE_TAG)
CONTAINER_TOOL ?= podman

build:
	$(python) -m mkdocs build

ci-image-build:
	$(CONTAINER_TOOL) build --pull --tag $(CI_IMAGE) .

ci-image-push: ci-image-build
	aws ecr get-login-password --region eu-west-1 | $(CONTAINER_TOOL) login --username AWS --password-stdin $(ECR_REGISTRY)
	$(CONTAINER_TOOL) push $(CI_IMAGE)

ci-image: ci-image-push

s3:
	aws s3 sync ./site s3://filipelucas-notes
	aws s3 sync ./site s3://kb.techland42.com

invalidate-cache:
	aws cloudfront create-invalidation --distribution-id EJU9GM7ZEVU6P --paths '/*'
	aws cloudfront create-invalidation --distribution-id E3D5O6ME0U6QCR --paths '/*'
	

deploy: build s3 invalidate-cache