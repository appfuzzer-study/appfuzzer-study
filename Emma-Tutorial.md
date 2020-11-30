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
  c) Add required write-to storage permission
  ```
  <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
  ```
  
  
STEP 6. Build the app with `ant instrument`. As a result, the `<Your-app>-instrumented.apk` and `coverage.em` files are generated;

Please reference the [Ant Build](./AntBuild.html) on how to accomplish STEP 6. 

STEP 7. Install the `<package-name>-instrumented.apk` to your AVD (Android Virtual Machine). WARNING: do not play around at this step, just install it;

STEP 8. Run the `<package-name>-instrumented.apk` with the following statement

`adb shell am instrument -e coverage true -w <package_name>/<package_name>.EmmaInstrument.EmmaInstrumentation`

Then, start playing around with the app;

For the error "Error: Failed to generate emma coverage. Emma.jar not in the class path?", please download the `emma.jar` from the [official page](http://emma.sourceforge.net/intro.html) and add the jar to the classpath.

STEP 9. Once finished, generate the coverage data with the following command (start a new CommandLine window and type the command)

`adb shell am broadcast -a edu.gatech.m3.emma.COLLECT_COVERAGE`

As a result, a file named `coverage.ec` under /mnt/sdcard is genereated.

Then, stop the app.

STEP 10. Pull the coverage.ec

Pull the `coverage.ec` file to the current directory from device with `adb pull /mnt/sdcard/coverage.ec .`

STEP 11. Generate report

Next, you can generate the coverage report the command `java -cp emma.jar emma report -r html -in coverage.em,coverage.ec`.

The `coverage.em` and `coverage.ec` are generated in STEP 6 and 10 respectively.

The sample coverage is shown in [coverage-sample/index.html](./coverage-sample/index.html)

---

We also suggest you to reference the [emma_coverage.py](./emma_coverage.py) for how to use Emma. 

