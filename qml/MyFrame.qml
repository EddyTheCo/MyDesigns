import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

GroupBox {
    id:control
    property string description;
    property alias collapsed:shader.time;
    property real velocity:3.0

    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)*shader.time


    label: RowLayout{
        Rectangle
        {
            id:arrow_
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: label_.height
            Layout.maximumHeight: label_.height
            Layout.minimumHeight: label_.height
            Layout.minimumWidth:  label_.height
            color:"transparent"
            ShaderEffect
            {
                id:shader
                property var src:arrow_
                property color fcolor:CustomStyle.frontColor2
                anchors.fill: arrow_;
                property real iTime:1.5;
                property var pixelStep: Qt.vector2d(1/src.width, 1/src.height)
                fragmentShader: "qrc:/esterVtech.com/imports/MyDesigns/frag/hollowArrowHead.frag.qsb"
                Behavior on iTime { SmoothedAnimation { velocity: control.velocity } }
            }
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    if(shader.iTime>1.0)
                    shader.iTime=0.5;
                    else
                    shader.iTime=1.5;
                }
            }

        }

        MyLabel {
            id:label_
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: control.description
            elide: Text.ElideRight
            font.bold:true
            color: CustomStyle.frontColor3
        }
    }

    background: Rectangle {
        visible:control.collapsed
        y: control.topPadding - control.bottomPadding
        width: parent.width
        height: parent.height - control.topPadding + control.bottomPadding
        color: CustomStyle.backColor1
        radius:Math.min(width,height)*0.05

        Rectangle
        {
            color:CustomStyle.frontColor2
            height:parent.height-2.0*parent.radius
            anchors.verticalCenter: parent.verticalCenter
            width:1
            anchors.left: parent.left
        }
        Rectangle
        {
            color:CustomStyle.frontColor2
            height:parent.height-2.0*parent.radius
            anchors.verticalCenter: parent.verticalCenter
            width:1
            anchors.right: parent.right
        }
    }

}
