# Ant Build and Instrument

## Platform
We suggest you to use Eclipse + ADT. Even though Android Studio is the main stream for building Android apps, Eclipse + ADT is the best way for Ant build and Ant Instrument.

## Download ADT (Android Developer Toolkit)
For ADT, you can downloaded it [here](ADT-plugins.zip). After download the ADT, we can place all files under the `plugin` directory in Eclipse. Then, you can use Android feature in Eclipse.

## Create Ant build for ADT
1. Create a `build.xml` under the project;
2. Make the `build.xml` with the template [here](./template_build.xml);

Note that the file must be named as `build.xml`.

3. Please also there is an `build.xml` under the path: <Android-SDK>/tools/ant/build.xml.  The `build.xml` should have the content as [this one](,/build.xml);

Note that the `build.xml` in step 1 and 2 is the same. `build.xml` used in step 3 is different from the one in (step 1,2).

## local.properties
1. Create a `local.properties` file under the project;
2. The content of the `local.properties` should be

```
sdk.dir=/<Your-Android>/Sdk

ndk.dir=/<Your-Android>/android-ndk
ndk-location=/<Your-Android>/android-ndk
```

## Problem Fixing
Here, we have a list of posts for fixing problems
1. [unknown-error-unable-to-build-the-file-dx-jar-was-not-loaded-from-the-sdk-fold](https://stackoverflow.com/questions/43009679/unknown-error-unable-to-build-the-file-dx-jar-was-not-loaded-from-the-sdk-fold)
