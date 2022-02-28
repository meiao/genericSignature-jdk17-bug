#!/usr/bin/env bash

# downloads the newrelic.jar from maven central. it can be downloaded manually from: https://search.maven.org/artifact/com.newrelic.agent.java/newrelic-agent/7.5.0/jar
if [[ ! -a "resources/newrelic.jar" ]]; then
  curl -o resources/newrelic.jar https://repo1.maven.org/maven2/com/newrelic/agent/java/newrelic-agent/7.5.0/newrelic-agent-7.5.0.jar
fi

if [[ ! -d "out" ]]; then
  mkdir out
fi

javac src/Tester.java -d out

# To run with Java 18, add: -Dnewrelic.config.experimental_runtime=true
java -javaagent:./resources/newrelic.jar -cp ./out --add-opens=java.base/java.lang=ALL-UNNAMED Tester
