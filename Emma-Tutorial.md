In this tutorial, we demonstrate how to use Emma to instrument a jar or an app.

# Emma

* Home Page of Emma is [http://emma.sourceforge.net/](http://emma.sourceforge.net/)

* EMMA is an open-source toolkit for measuring and reporting Java code coverage. EMMA distinguishes itself from other tools by going after a unique feature combination: support for large-scale enterprise software development while keeping individual developer's work fast and iterative. Every developer on your team can now get code coverage for free and they can get it fast!

# Instrument a Jar file

The *quick start* page [http://emma.sourceforge.net/intro.html](http://emma.sourceforge.net/intro.html) shows you how to instrument a Jar file and get the coverage.

Please follow the instructions online.

Also, you are feel to use our `bash` script, which pre-input all needed commands.

Please download our `runEmmaJar.sh` file [here](runEmmaJar.sh).

The script takes two parameters: the first one is the path of the target Jar file; the second one is the classname of the Main class.

For example, `bash ./runEmmaJar.sh Test.jar Test`.

# Instrument an open-source app

To instrument an open-source app, 

STEP 1. Download the [Instrumentation.zip](Instrumentation.zip) file and uncompress it;

STEP 2. Create a new directory named `EmmaInstrument` under the package. For example, if your package name is `a.b`, then create a folder under `b`;

STEP 3. Copy `EmmaInstrumentation.java`, `FinishListener.java`, `InstrumentedActivity.java` and `SMSInstrumentedReceiver.java` to the `EmmaInstrument` folder. For example, the path for the `EmmaInstrumentation.java` should be <package-name>/EmmaInstrumentation/EmmaInstrumentation.java;
  
STEP 4. Open the `InstrumentedActivity.java` and revise it based on the inside instruction;

STEP 5. Revise the `AndroidManifest.xml` as:

  a) Place the following nodes under the `Application` node
   
  ```
     <receiver android:name="<package-name>.EmmaInstrument.SMSInstrumentedReceiver">
     <intent-filter>
       <action android:name="edu.gatech.m3.emma.COLLECT_COVERAGE"/>
     </intent-filter>
     </receiver>
     <activity android:label="EmmaInstrumentationActivity" android:name="<package-name>.EmmaInstrument.InstrumentedActivity"/>
  ```
  
  b) Place the following node under the root (i.e., manifest node)
  
  ```
  <instrumentation android:handleProfiling="true" android:label="EmmaInstrumentation" android:name="<package-name>.EmmaInstrument.EmmaInstrumentation" android:targetPackage="<package-name>"/>
  ```
  
STEP 6. Build the app and generate an APK and name it as `<package-name>-instrumented.apk`;  

STEP 7. Instrument and run the `<package-name>-instrumented.apk` with the following statement
      
      `adb shell am instrument <package_name>/<package_name>.EmmaInstrument.EmmaInstrumentation`

STEP 8. 
