In this tutorial, we demonstrate how to use Emma to instrument a jar or an app.

# Emma

* Home Page of Emma is [http://emma.sourceforge.net/](http://emma.sourceforge.net/)

* EMMA is an open-source toolkit for measuring and reporting Java code coverage. EMMA distinguishes itself from other tools by going after a unique feature combination: support for large-scale enterprise software development while keeping individual developer's work fast and iterative. Every developer on your team can now get code coverage for free and they can get it fast!

# Instrument a Jar file

The *quick start* page [http://emma.sourceforge.net/intro.html](http://emma.sourceforge.net/intro.html) shows you how to instrument a Jar file and get the coverage.

Please follow the instructions online.

Also, you are feel to use our `bash` script, which pre-input all need commands.

Please download our `runEmmaJar.sh` file [here](runEmmaJar.sh).

The script takes two parameters: the first one is the path of the target Jar file; the second one is the classname of the Main class.

# Instrument an app

To instrument an app, 

1. Download the [Instrumentation.zip](Instrumentation.zip) file and uncompress it;

2. Copy `EmmaInstrumentation.java`, `FinishListener.java` and `SMSInstrumentedReceiver.java` to the root of the `src` folder. For example, the path for the `EmmaInstrumentation.java` should be <package-name>/EmmaInstrumentation.java;

3.
  
