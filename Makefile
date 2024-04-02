.PHONY : build serve

build:
	gleam build --target javascript
	cp -r ./build/dev/javascript/draw/* ./web/static/draw/
	cp -r ./src/external/* ./web/static/draw/external/

serve: build
	cd web && hugo serve
