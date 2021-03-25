
val language: String? by project

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
  args("Kismet", "start", "-tree")
  standardInput = System.`in`
}

tasks.generateGrammarSource {
  if (language != null) {
    arguments = arguments + listOf("-Dlanguage="+language)
  }
}