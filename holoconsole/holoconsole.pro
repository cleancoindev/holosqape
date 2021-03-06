QT += qml concurrent
CONFIG += c++11
CONFIG -= qtquickcompiler
CONFIG += console
CONFIG -= app_bundle
CONFIG += debug_and_release

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
    console.cpp

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    console.h

INCLUDEPATH += ../bindings
LIBS += -L../bindings -lbindings -lholochain_dna_c_binding -lholochain_core_api_c_binding -ldl

android {
    LIBS += -L../../holosqape/holochain-rust/target/armv7-linux-androideabi/release/
} else {
    CONFIG(debug, debug|release) {
        macx {
            LIBS += -L../../holosqape/holochain-rust/target/debug/ -framework Security
        } else {
            LIBS += -L../../holosqape/holochain-rust/target/debug/
        }
    } else {
        LIBS += -L../../holosqape/holochain-rust/target/release/
    }
}

RESOURCES += \
    qml.qrc
