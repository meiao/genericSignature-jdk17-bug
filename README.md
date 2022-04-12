# genericSignature-jdk17-bug
A small application to reproduce a problem in Java 17 with generic signature.

The bug demonstrated by this repo was accepted and has been fixed. See https://bugs.openjdk.java.net/browse/JDK-8282241 for details.

## Background
At New Relic we instrument classes to send telemetry data to our servers. We use ASM for bytecode manipulation.

We instrument CompletableFuture, and since Java 17 it has returned an improper value when Class#getGenericSignature0() is called. This works fine when the running on Java 16 or lower.

See [docs](docs) for details on the investigation. 

We are working to create a smaller reproducing app that does not require the New Relic Java agent.

## Running the app

Run `./run.sh`

This script will download the New Relic's Java agent, compile the Tester class and run it.

To run with Java 18+, check the script and add `-Dnewrelic.config.experimental_runtime=true` to the java command.
