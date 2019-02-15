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
//        width:300
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
                text:"x1"
            }
            TextField{
                id:x1
                width:100
                text:"0"
                validator: IntValidator{top:300;bottom:0;}
            }
            Label{
                id:y1name
                text:"y1"
            }
            TextField{
                id:y1
                width:100
                text:"0"
                validator: IntValidator{top:300;bottom:0;}
            }
        }
        Row {
            spacing:5
            Label{
                id:x2name
                text:"x2"
            }
            TextField{
                id:x2
                width:100
                text:"300"
                validator: IntValidator{top:300;bottom:0;}
            }
            Label{
                id:y2name
                text:"y2"
            }
            TextField{
                id:y2
                width:100
                text:"300"
                validator: IntValidator{top:300;bottom:0;}
            }
        }
        Row {
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
            c.moveTo(Number(x1.getText(0,x1.length)),Number(y1.getText(0,y1.length)));
            c.lineTo(Number(x2.getText(0,x2.length)),Number(y2.getText(0,y2.length)));
            c.stroke();
            c.beginPath();
            c.fillstyle = "#FFFFFF";
            c.arc(Number(x1.getText(0,x1.length)),Number(y1.getText(0,y1.length)),2,0,2*Math.PI,true);
            c.fill();
            c.stroke();
            c.beginPath();
            c.arc(Number(x2.getText(0,x2.length)),Number(y2.getText(0,y2.length)),2,0,2*Math.PI,true);
            c.fill();
            c.stroke();
        }
    }
}
