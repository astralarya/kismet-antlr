
val antlrGrammar: String? by project
val antlrGrammarStart: String? by project
val antlrArguments: String? by project
val antlrLanguage: String? by project

plugins {
  antlr
  java
}

repositories {
  mavenCentral()
}

dependencies {
  antlr("org.antlr:antlr4:4.9")
}

task("testrig", JavaExec::class) {
  group = "verification"
  description = "Test the parser in Antlr TestRig"
  main = "org.antlr.v4.gui.TestRig"
  classpath = sourceSets["main"].runtimeClasspath
  args(antlrGrammar, antlrGrammarStart, "-tree")
  standardInput = System.`in`
}

tasks.generateGrammarSource {
  group = "build"
  if (antlrArguments != null) {
    arguments = arguments + antlrArguments.toString().split(" ")
  }
  if (antlrLanguage != null) {
    arguments = arguments + listOf("-Dlanguage="+antlrLanguage)
  }
}