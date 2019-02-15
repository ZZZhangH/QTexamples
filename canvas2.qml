import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 600
    height: 300
    title: qsTr("Draw A Line")

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
            spacing: 5
            Label{
                id:x1name
                text:"x"
            }
            TextField{
                id:x
                width:100
                text:"150"
                validator: IntValidator{top:300;bottom:0;}
            }
            Label{
                id:y1name
                text:"y"
            }
            TextField{
                id:y
                width:100
                text:"150"
                validator: IntValidator{top:300;bottom:0;}
            }
        }
        Row {
            spacing:5
            Label{
                id:saLabel
                text:"startangle"
            }
            TextField{
                id:startangle
                width:75
                text:"0"
                validator: DoubleValidator{top:Math.PI*2;bottom:-Math.PI*2;}
            }
            Label{
                id:eaLabel
                text:"endangle"
            }
            TextField{
                id:endangle
                width:75
                text:"3"
                validator: DoubleValidator{top:Math.PI*2;bottom:-Math.PI*2;}
            }
        }
        Row {
            spacing:5
            Label{
                id:radiusLabel
                text:"radius"
            }
            TextField{
                id:radius
                width:100
                text:"100"
                validator: IntValidator{top:300;bottom:0;}
            }
            Button{
                id:submitButton
                text:"submit"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    canvas.requestPaint()
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
            c.beginPath();
            c.arc(Number(x.getText(0,x.length)),Number(y.getText(0,y.length)),
                  Number(radius.getText(0,radius.length)),Number(startangle.getText(0,startangle.length)),
                  Number(endangle.getText(0,endangle.length)),true);  //anticlockwise true nishizhen false shunshizhen
            c.stroke();
        }
    }
}
