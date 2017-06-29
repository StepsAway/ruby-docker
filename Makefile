NAME = stepsaway/baseimage
VERSION = 2.0.1

.PHONY: all build_all clean clean_images \
	build_ruby230 build_ruby231 build_ruby240 build_ruby241 \
	release test

all: build_all

build_all: \
	build_ruby230 \
	build_ruby231 \
	build_ruby240 \
	build_ruby241

build_ruby230:
	rm -rf ruby230_image
	cp -pR image ruby230_image
	echo ruby230=1 >> ruby230_image/buildconfig
	echo final=1 >> ruby230_image/buildconfig
	sed -i -e "s/##TAG##/$(VERSION)/" ruby230_image/Dockerfile
	docker build -t $(NAME)-ruby23:0-$(VERSION) --rm ruby230_image

build_ruby231:
	rm -rf ruby231_image
	cp -pR image ruby231_image
	echo ruby231=1 >> ruby231_image/buildconfig
	echo final=1 >> ruby231_image/buildconfig
	sed -i -e "s/##TAG##/$(VERSION)/" ruby231_image/Dockerfile
	docker build -t $(NAME)-ruby23:1-$(VERSION) --rm ruby231_image

build_ruby240:
	rm -rf ruby240_image
	cp -pR image ruby240_image
	echo ruby240=1 >> ruby240_image/buildconfig
	echo final=1 >> ruby240_image/buildconfig
	sed -i -e "s/##TAG##/$(VERSION)/" ruby240_image/Dockerfile
	docker build -t $(NAME)-ruby24:0-$(VERSION) --rm ruby240_image

build_ruby241:
	rm -rf ruby241_image
	cp -pR image ruby241_image
	echo ruby241=1 >> ruby241_image/buildconfig
	echo final=1 >> ruby241_image/buildconfig
	sed -i -e "s/##TAG##/$(VERSION)/" ruby241_image/Dockerfile
	docker build -t $(NAME)-ruby24:1-$(VERSION) --rm ruby241_image

clean:
	rm -rf ruby230_image
	rm -rf ruby231_image
	rm -rf ruby240_image
	rm -rf ruby241_image

clean_images:
	@if docker images $(NAME)-ruby23:0-$(VERSION) | awk '{ print $$2 }' | grep -q -F 0-$(VERSION); then docker rmi -f $(NAME)-ruby23:0-$(VERSION) || true; fi
	@if docker images $(NAME)-ruby23:1-$(VERSION) | awk '{ print $$2 }' | grep -q -F 1-$(VERSION); then docker rmi -f $(NAME)-ruby23:1-$(VERSION) || true; fi
	@if docker images $(NAME)-ruby24:0-$(VERSION) | awk '{ print $$2 }' | grep -q -F 0-$(VERSION); then docker rmi -f $(NAME)-ruby24:0-$(VERSION) || true; fi
	@if docker images $(NAME)-ruby24:1-$(VERSION) | awk '{ print $$2 }' | grep -q -F 1-$(VERSION); then docker rmi -f $(NAME)-ruby24:1-$(VERSION) || true; fi

release: test
	@if ! docker images $(NAME)-ruby23:0-$(VERSION) | awk '{ print $$2 }' | grep -q -F 0-$(VERSION); then echo "$(NAME)-ruby23:0-$(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)-ruby23:1-$(VERSION) | awk '{ print $$2 }' | grep -q -F 1-$(VERSION); then echo "$(NAME)-ruby23:1-$(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)-ruby24:0-$(VERSION) | awk '{ print $$2 }' | grep -q -F 0-$(VERSION); then echo "$(NAME)-ruby24:0-$(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! docker images $(NAME)-ruby24:1-$(VERSION) | awk '{ print $$2 }' | grep -q -F 1-$(VERSION); then echo "$(NAME)-ruby24:1-$(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! head -n 1 Changelog.md | grep -q 'release date'; then echo 'Please note the release date in Changelog.md.' && false; fi
	docker push $(NAME)-ruby23:0-$(VERSION)
	docker push $(NAME)-ruby23:1-$(VERSION)
	docker push $(NAME)-ruby24:0-$(VERSION)
	docker push $(NAME)-ruby24:1-$(VERSION)
	@echo "*** Don't forget to create a tag. git tag $(VERSION) && git push origin $(VERSION)"

test:
	@if docker images $(NAME)-ruby23:0-$(VERSION) | awk '{ print $$2 }' | grep -q -F $(VERSION); then env NAME=$(NAME)-ruby23:0 RUBY='2.3.0' VERSION=$(VERSION) ./test/runner.sh; fi
	@if docker images $(NAME)-ruby23:1-$(VERSION) | awk '{ print $$2 }' | grep -q -F $(VERSION); then env NAME=$(NAME)-ruby23:1 RUBY='2.3.1' VERSION=$(VERSION) ./test/runner.sh; fi
	@if docker images $(NAME)-ruby24:0-$(VERSION) | awk '{ print $$2 }' | grep -q -F $(VERSION); then env NAME=$(NAME)-ruby24:0 RUBY='2.4.0' VERSION=$(VERSION) ./test/runner.sh; fi
	@if docker images $(NAME)-ruby24:1-$(VERSION) | awk '{ print $$2 }' | grep -q -F $(VERSION); then env NAME=$(NAME)-ruby24:1 RUBY='2.4.1' VERSION=$(VERSION) ./test/runner.sh; fi
