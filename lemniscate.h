#ifndef LEMNISCATE_H
#define LEMNISCATE_H
#include <QObject>

struct point{
    double x;
    double y;
};
class lemniscate:public QObject
{
    Q_OBJECT
public:
    lemniscate();
    ~lemniscate();
    Q_INVOKABLE void ready(int );
    Q_INVOKABLE void calP1();
    Q_INVOKABLE void calP2();
    Q_INVOKABLE double getX(int);
    Q_INVOKABLE double getY(int);
    int a;
    int N=400;
    point *p1= new point[N];
    point *p2= new point[N];
    double interval;
};

#endif // LEMNISCATE_H
