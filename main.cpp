#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include "circle.h"
#include "lemniscate.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<circle>("QCircle", 1,4, "Circle"); //the first letter of the 4th parameter should be capitalized!!!
    //an error emerged--"typeerror: qml cannot call method '...' of null" and solved it by changeing register's version.
    qmlRegisterType<lemniscate>("QLemniscate",1,1,"Lemniscate");
    QQmlApplicationEngine engine;    //use window
    engine.load(QUrl(QStringLiteral("qrc:/canvas4.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

//    QQuickView viewer;         //use item as qml root object
//    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
//    viewer.setSource(QUrl("qrc:/canvas1.qml"));
//    viewer.show();

    return app.exec();
}
