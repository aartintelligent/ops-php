REGISTRY = docker.io
ORGANIZATION = aartintelligent
PHP_TARGET = php
PHP_VERSIONS ?= 8.3
PHP_VARIANTS ?= base composer fpm nginx supervisor
IMAGE = $(REGISTRY)/$(ORGANIZATION)/$(PHP_TARGET)

build:
	@$(foreach version,$(PHP_VERSIONS),\
		$(foreach variant,$(PHP_VARIANTS),\
			echo "Building $(IMAGE):$(version)-$(variant)..."; \
			(cd docker/$(variant) && docker build . \
			--build-arg PHP_VERSION=$(version) \
			--tag $(IMAGE):$(version)-$(variant)); \
		) \
	)

push:
	@$(foreach version,$(PHP_VERSIONS),\
		$(foreach variant,$(PHP_VARIANTS),\
			echo "Pushing $(IMAGE):$(version)-$(variant)..."; \
			docker push $(IMAGE):$(version)-$(variant); \
		) \
	)

clean:
	@$(foreach version,$(PHP_VERSIONS),\
		$(foreach variant,$(PHP_VARIANTS),\
			echo "Removing image $(IMAGE):$(version)-$(variant)..."; \
			docker rmi -f $(IMAGE):$(version)-$(variant) || true; \
		) \
	)

.PHONY: build push clean