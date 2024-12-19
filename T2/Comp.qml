import QtQuick 2.0

Rectangle {
    id: rect1
    width: 300
    height: 100
    border.width: 1
    color: Qt.rgba(Math.random(), Math.random(), Math.random(), 0.7)

    property string text: ""

    Text {
        text: rect1.text
        anchors.centerIn: rect1
        font.pixelSize: 24
    }
}
