# kismet-antlr

ANTLR Grammar for the Kismet family of dice roll parsers

## Setup

* [Install Gradle](https://gradle.org/install/)

## Usage

### Generate grammar source

```
./gradlew generateGrammarSource [-PantlrLanguage=LANGUAGE] [-PantlrArguments=ARGUMENTS]
```

Generate source files for the
[target language](https://github.com/antlr/antlr4/blob/master/doc/targets.md)
`LANGUAGE` (default Java).
Pass arguments to ANTLR in `ARGUMENTS`.

Output is located at
`build/generated-src/antlr/main/`.

### Run Antlr TestRig

```
./gradlew testrig
```

Test the grammar in the interactive ANTLR TestRig.

**NOTE:** Gradle may appear to hang at 80%,
but TestRig is running and accepting input.
Use CTRL+D to send EOF.
