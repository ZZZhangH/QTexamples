#include "lemniscate.h"
#include <math.h>
#include <iostream>
lemniscate::lemniscate()
{

}
void lemniscate::ready(int _a){
    a=_a;
    interval=M_PI/N;
    calP1();
    calP2();
}
void lemniscate::calP1(){
    double temp=0;
    for(int i=0;i<N/4;i++){
        p1[i].x=sqrt(a*a*cos(2*temp));
        temp+=interval;
        p1[i].y=temp;
    }
    temp=3*M_PI/4;
    for(int i=N/4;i<N/2;i++){
        p1[i].x=sqrt(a*a*cos(2*temp));
        temp+=interval;
        p1[i].y=temp;
    }
    temp=M_PI;
    for(int i=N/2;i<N*3/4;i++){
        p1[i].x=sqrt(a*a*cos(2*temp));
        temp+=interval;
        p1[i].y=temp;
    }
    temp=7*M_PI/4;
    for(int i=N*3/4;i<N;i++){
        p1[i].x=sqrt(a*a*cos(2*temp));
        temp+=interval;
        p1[i].y=temp;
    }
}
void lemniscate::calP2(){
    for(int i=0;i<N;i++){
        p2[i].x=p1[i].x*cos(p1[i].y)+200;
        p2[i].y=200-p1[i].x*sin(p1[i].y);
    }
}
double lemniscate::getX(int i){
    return p2[i].x;
}
double lemniscate::getY(int i){
    return p2[i].y;
}

lemniscate::~lemniscate()
{
    delete p1;
    delete p2;
}
