#include "circle.h"
#include <math.h>
#include <iostream>
circle::circle()
{

}
bool circle::isCircle(double _x1,double _y1,double _x2,double _y2,double _x3,double _y3)
{
    x1=_x1;x2=_x2;x3=_x3;
    y1=_y1;y2=_y2;y3=_y3;
    double temp = (x2-x1)*(y3-y2)-(y2-y1)*(x3-x2);
    if(temp==0) return false;
    else
        return true;
}
void circle::calCenterPoint(){
    double a=x1-x2;
    double b=y1-y2;
    double c=x1-x3;
    double d=y1-y3;
    double e=0.5*((x1*x1-x2*x2)-(y2*y2-y1*y1));
    double f=0.5*((x1*x1-x3*x3)-(y3*y3-y1*y1));
    cx=(b*f-d*e)/(b*c-a*d);
    cy=(c*e-a*f)/(b*c-a*d);
    std::cout<<"look :"<<cx<<" , "<<cy<<std::endl;
}
void circle::calRadius(){
    radius=sqrt((x1-cx)*(x1-cx)+(y1-cy)*(y1-cy));
}
double circle::calAngle(double x,double y){
    if(x==cx&&y<cy) return 3*M_PI/2;
    else if(x==cx&&y>cy) return M_PI/2;
    else if(y==cy&&x>cx) return 0;
    else if(y==cy&&x<cx) return M_PI;
    else{
        double temp=atan2(y-cy,x-cx);
        return temp > 0 ? temp : 2*M_PI+temp;
    }
}
void circle::calEA(){ // find the smallest angel
    if(p1angle<p2angle)
        endangle = p1angle < p3angle ? p1angle : p3angle;
    else
        endangle = p2angle < p3angle ? p2angle : p3angle;
}
void circle::calSA(){ // find the biggest angle
    if(p1angle>p2angle)
        startangle = p1angle > p3angle ? p1angle : p3angle;
    else
        startangle = p2angle > p3angle ? p2angle : p3angle;
}
void circle::calMA(){
    if(p1angle==startangle || p1angle==endangle){
        if((p2angle==startangle || p2angle==endangle))
            midangle=p3angle;
        else
            midangle=p2angle;
    }
    else{
        midangle=p1angle;
    }
    std::cout<<"mid "<<midangle<<std::endl;
}
void circle::calCW(){
    anticw = startangle-endangle>M_PI ? false : true;
    std::cout<<anticw<<std::endl;
}
void circle::resetAngle(){
    double a=2*M_PI+endangle-midangle;
    double b=2*M_PI-startangle+midangle;
    double c=startangle-endangle;
    if(a<b&&a<c){
        startangle=midangle;
    }
    else if(b<a&&b<c){
        endangle=midangle;
    }
    else{
        anticw=true;
    }
}
void circle::ready(){
    calCenterPoint();
    calRadius();
    p1angle=calAngle(x1,y1);
    p2angle=calAngle(x2,y2);
    p3angle=calAngle(x3,y3);
    std::cout<<p1angle<<" "<<p2angle<<" "<<p3angle<<std::endl;
    calSA();
    calEA();
    calMA();
    calCW();
    if(anticw==false){
        resetAngle();
    }
}
double circle::getcx(){
    return cx;
}
double circle::getcy(){
    return cy;
}
double circle::getRadius(){
    return radius;
}
double circle::getSA(){
    return startangle;
}
double circle::getEA(){
    return endangle;
}
bool circle::getCW(){
    return anticw;
}
