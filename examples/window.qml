import QtQuick.Controls
import QtQuick
import MyDesigns

ApplicationWindow {
    visible: true
    width:1200
    height:700

    background: Rectangle {
        color:"#1e1e1e"
    }

    MySettButton
    {
        rect_:Rectangle{
            radius:10
            border.color:"white"
            border.width:1
            color:"#0d1117"

        }
        onClicked: {
            animate=!animate;
        }

        frontcolor:"white"

        anchors.centerIn:parent;
        width:parent.width*0.5
        height:parent.height*0.5
    }
}
