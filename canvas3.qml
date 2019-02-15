import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QCircle 1.4
//**********RULES**********
//always draw by anticlockwise
//the angle range is 0--2pi

Window {
    visible: true
    width: 600
    height: 300
    title: qsTr("Draw A Line")

    Circle {
        id:circle
    }

    Column {
        anchors{
            left:canvas.right
            leftMargin: 5
            right:parent.right
            top:parent.top
            topMargin: 10
        }
        spacing:10
        Row{
            spacing: 10
            Label{
                id:x1name
                text:"x1"
            }
            TextField{
                id:x1
                width:100
                text:"50"
                validator: DoubleValidator{top:300;bottom:0;}
            }
            Label{
                id:y1name
                text:"y1"
            }
            TextField{
                id:y1
                width:100
                text:"50"
                validator: DoubleValidator{top:300;bottom:0;}
            }
        }
        Row {
            spacing:10
            Label{
                id:x2name
                text:"x2"
            }
            TextField{
                id:x2
                width:100
                text:"50"
                validator: DoubleValidator{top:300;bottom:0;}
            }
            Label{
                id:y2name
                text:"y2"
            }
            TextField{
                id:y2
                width:100
                text:"60"
                validator: DoubleValidator{top:300;bottom:0;}
            }
        }
        Row {
            spacing:10
            Label{
                id:x3name
                text:"x3"
            }
            TextField{
                id:x3
                width:100
                text:"70"
                validator : DoubleValidator{top:300;bottom:0;}
            }
            Label{
                id:y3name
                text:"y3"
            }
            TextField{
                id:y3
                width:100
                text:"80"
                validator: DoubleValidator{top:300;bottom:0;}
            }

        }
        Row{
            Button{
                id:submitButton
                text:"submit"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    var f= circle.isCircle(Number(x1.getText(0,x1.length)),Number(y1.getText(0,y1.length)),
                                           Number(x2.getText(0,x2.length)),Number(y2.getText(0,y2.length)),
                                           Number(x3.getText(0,x3.length)),Number(y3.getText(0,y3.length)))
                    if(f===false)
                        console.log("this is not a circle");
                    else{
                        circle.ready();
                        //console.log("the center point is "+circle.getcx()+circle.getcy()) //qml can't reach circle's public data??
                        console.log("the SA is "+circle.getSA()+" and EA is "+circle.getEA());
                        canvas.requestPaint();
                    }

                }
            }
        }

    }

    Canvas{
        id:canvas
        width:300;
        height:300;

        onPaint: {
            var c = getContext("2d");
            c.clearRect(canvas.x,canvas.y,canvas.width,canvas.height); //clear canvas
            c.lineWidth = 2;
            //Draw the Points
            c.beginPath();
            c.fillstyle = "#FFFFFF";
            c.arc(Number(x1.getText(0,x1.length)),Number(y1.getText(0,y1.length)),2,0,2*Math.PI,true);
            c.fill();
            c.stroke();
            c.beginPath();
            c.arc(Number(x2.getText(0,x2.length)),Number(y2.getText(0,y2.length)),2,0,2*Math.PI,true);
            c.fill();
            c.stroke();
            c.beginPath();
            c.arc(Number(x3.getText(0,x3.length)),Number(y3.getText(0,y3.length)),2,0,2*Math.PI,true);
            c.fill();
            c.stroke();

            c.beginPath();
            c.arc(circle.getcx(),circle.getcy(),circle.getRadius(),circle.getSA(),circle.getEA(),circle.getCW());
            c.stroke();
        }
    }
}
