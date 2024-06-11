ELMS=$(wildcard src/*.elm)

app.js: src/App.elm $(ELMS)
	-elm make $< --output=$@
