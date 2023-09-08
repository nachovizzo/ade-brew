COMMIT_SHA:=$(shell git rev-parse HEAD)
COMMIT_TAG:=$(shell git describe --tags --abbrev=0)

_opt:
	rm -rf _opt/ 2>/dev/null || true
	./build-opt $(COMMIT_TAG)

docker:_opt
	docker build --platform linux/amd64 --label ade_image_commit_sha="$(COMMIT_SHA)" --label ade_image_commit_tag="$(COMMIT_TAG)" -t ignaciovizzo/ade-brew .

run:
	docker run --rm -it --platform linux/amd64 ignaciovizzo/ade-brew

clean:
	@git clean -xff .
