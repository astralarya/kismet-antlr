# kismet-antlr

ANTLR Grammar for the Kismet family of dice roll parsers

## Setup

* [Install Gradle](https://gradle.org/install/)

## Usage

### Generate grammar source

```
./gradlew generateGrammarSource [-Planguage=LANGUAGE] [-PantlrArgs=ARGS]
```

Generate source files for the
[target language](https://github.com/antlr/antlr4/blob/master/doc/targets.md)
(default Java).
Pass additional arguments to ANTLR in `ARGS`
(quote to pass multiple).

Output is located at
`build/generated-src/antlr/main/`.

### Run Antlr TestRig

```
./gradlew testrig
```

Test the grammar in the interactive ANTLR TestRig.

**NOTE:** Gradle may appear to hang at 80%,
but TestRig is running and accepting input
