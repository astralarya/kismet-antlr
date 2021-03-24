#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"


cd src/
java -Xmx500M org.antlr.v4.Tool -o ../dist/ *.g4

cd ../dist/
javac *.java

java -Xmx500M org.antlr.v4.gui.TestRig Kismet start -tree

