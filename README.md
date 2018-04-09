# Problem 

In Ubuntu 16.04, Qt by default enables the support for GTK which contains a runtime link reference to the system library "libmirprotobuf.so". 
That sometimes clashes with the protobuf modified implementation used by Tensorflow causing random crashes at runtime.

# Solution

This is simple docker container which is meant to contain a precompiled Qt Open Source libraries for Ubuntu 16.04 without GTK support.

This can be used for docker multistage builds in ubuntu which involve Tensorflow and Qt.

# How to use it

The best way to use this docker contained is just to add it your multistage build and import copy the qt libraries from the `/opt` directory adjusting the related qt linking directory.
For example:

```
FROM tetractius/qt-os-no-gtk-ubuntu-16.04 as qt_ubuntu
[...]
COPY --from=qt_ubuntu /opt/Qt5.10.1 /opt/Qt5.10.1
```

Then in CMake, it is usually enough to add the root of the Qt libraries to `CMAKE_PREFIX_PATH` for importing the single module and/or declare `QT_QMAKE_EXECUTABLE` to the location of the imported QMake executable.
