import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    id: win

    Item {
        id: root
        anchors.fill: parent

        Rectangle {
            id: rect_top
            color: "coral"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 10
            height: win.height/4
        }

        Rectangle {
            id: rect_mid
            color: "deep sky blue"
            anchors.top: rect_top.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: rect_bot.top
            anchors.margins: 10
            height: win.height/2
        }

        Rectangle {
            id: rect_bot
            color: "green"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: win.height/4
            anchors.margins: 10
            Row {
                id: row_layout
                anchors.fill: parent
                spacing: 10 // Расстояние между прямоугольниками
                anchors.margins: 10

                Rectangle {
                    id: rect_bot_1
                    color: "white"
                    width: parent.width / 3 - 10
                    height: parent.height - 10
                }

                Rectangle {
                    id: rect_bot_2
                    color: "white"
                    width: parent.width / 3 - 10
                    height: parent.height - 10
                }

                Rectangle {
                    id: rect_bot_3
                    color: "white"
                    width: parent.width / 3 - 10
                    height: parent.height - 10
                }
            }
        }
    }
}
