import QtQuick
import QtQuick.Templates as T
import Esterv.Styles.Simple

T.TabBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, contentHeight + topPadding + bottomPadding)

    spacing: 1

    contentItem: ListView {
        model: control.contentModel
        currentIndex: control.currentIndex

        spacing: control.spacing
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.AutoFlickIfNeeded
        snapMode: ListView.SnapToItem

        highlightMoveDuration: 0
        highlightRangeMode: ListView.ApplyRange
        preferredHighlightBegin: 40
        preferredHighlightEnd: width - 40
    }

    background: Rectangle {
        color: Style.backColor2
    }
}
