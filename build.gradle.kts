
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
  main = "org.antlr.v4.gui.TestRig"
  classpath = sourceSets["main"].runtimeClasspath
  args("Kismet", "start", "-tree")
  standardInput = System.`in`
}