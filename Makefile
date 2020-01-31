IMAGE_NAME=lajd94/elasticsearch:6.5.4

create-plugin:
	cd plugins/search-highlighter \
	./mvnw install

build:
	docker build -t $(IMAGE_NAME) .

push:
	docker push $(IMAGE_NAME)
