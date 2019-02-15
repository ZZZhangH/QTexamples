import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QLemniscate 1.1

Window {
    visible: true
    width: 600
    height: 400
    title: qsTr("Draw A Line")

    Lemniscate {
        id:lemniscate
    }

    Column {
//        width:200
        anchors{
            left:canvas.right
            leftMargin: 5
            right:parent.right
            top:parent.top
            topMargin: 10
        }
        spacing:10
        Row {
            TextField{
                id:a
                text:"200"
                width:100
            }
        }

        Row {
            Button{
                id:submitButton
                text:"submit"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: {
                    lemniscate.ready(Number(a.getText(0,a.length)));
                    canvas.requestPaint()
                }
            }
        }

    }

    Canvas{
        id:canvas
        width:400;
        height:400;

        onPaint: {
            var c = getContext("2d");
            c.clearRect(canvas.x,canvas.y,canvas.width,canvas.height);
            c.lineWidth = 1;
            c.fillstyle = "#FFFFFF";

//            for(var i=0;i<400;i++){
//                var x=lemniscate.getX(i);
//                var y=lemniscate.getY(i);
//                c.beginPath();
//                c.arc(x,y,1,0,2*Math.PI,true);
//                c.fill();
//                c.stroke();
//            }

            var n=400;
            c.moveTo(lemniscate.getX(0),lemniscate.getY(0));
            for(var i=1;i<n/4;i++){
                c.lineTo(lemniscate.getX(i),lemniscate.getY(i));
            }
            for(i=3*n/4;i>n/2;i--){
                c.lineTo(lemniscate.getX(i),lemniscate.getY(i));
            }
            for(i=n/2;i>n/4;i--){
                c.lineTo(lemniscate.getX(i),lemniscate.getY(i));
            }
            for(i=3*n/4;i<n;i++){
                c.lineTo(lemniscate.getX(i),lemniscate.getY(i));
            }
            c.lineTo(lemniscate.getX(0),lemniscate.getY(0));
            c.stroke();
        }
    }
}
