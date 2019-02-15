#ifndef CIRCLE_H
#define CIRCLE_H
#include <QObject>

class circle:public QObject
{
    Q_OBJECT
public:
    circle();
    Q_INVOKABLE bool isCircle(double _x1,double _y1,double _x2,double _y2,double _x3,double _y3); //Q_INVOKABLE make it possible for yuanduixiang to use this method
    void calCenterPoint();
    void calRadius();
    double calAngle(double x,double y);
    void calSA();
    void calEA();
    void calCW();
    void calMA();
    void resetAngle();
    Q_INVOKABLE void ready();
    Q_INVOKABLE double getcx();
    Q_INVOKABLE double getcy();
    Q_INVOKABLE double getRadius();
    Q_INVOKABLE double getSA();
    Q_INVOKABLE double getEA();
    Q_INVOKABLE bool getCW();
    double cx,cy,x1,y1,x2,y2,x3,y3,radius;
    double startangle,endangle,p1angle,p2angle,p3angle;
    double midangle=0;
    bool anticw;
};

#endif // CIRCLE_H
