import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

Window {
    width: 360
    height: 640
    visible: true
    title: "State Animation Example"

    property int stateIndex: 0

    Rectangle {
        id: backgroundRectangle
        width: parent.width
        height: parent.height
        color: "white"

        Column {
            spacing: 10
            anchors.centerIn: parent

            Rectangle {
                id: redLight
                width: 100
                height: 100
                color: stateIndex == 0 ? "red" : "black"
                radius: 10
                MouseArea {
                    anchors.fill: parent
                    onClicked: stateIndex = 0
                }
            }

            Rectangle {
                id: yellowLight
                width: 100
                height: 100
                color: stateIndex == 1 ? "yellow" : "black"
                radius: 10
                MouseArea {
                    anchors.fill: parent
                    onClicked: stateIndex = 1
                }
            }

            Rectangle {
                id: greenLight
                width: 100
                height: 100
                color: stateIndex == 2 ? "green" : "black"
                radius: 10
                MouseArea {
                    anchors.fill: parent
                    onClicked: stateIndex = 2
                }
            }
        }

        states: [
            State {
                name: "red"
                when: stateIndex == 0
                PropertyChanges { target: redLight; color: "red" }
                PropertyChanges { target: yellowLight; color: "black" }
                PropertyChanges { target: greenLight; color: "black" }
            },
            State {
                name: "yellow"
                when: stateIndex == 1
                PropertyChanges { target: redLight; color: "black" }
                PropertyChanges { target: yellowLight; color: "yellow" }
                PropertyChanges { target: greenLight; color: "black" }
            },
            State {
                name: "green"
                when: stateIndex == 2
                PropertyChanges { target: redLight; color: "black" }
                PropertyChanges { target: yellowLight; color: "black" }
                PropertyChanges { target: greenLight; color: "green" }
            }
        ]

        transitions: [
            Transition {
                from: "*"
                to: "*"
                reversible: true
                ParallelAnimation {
                    PropertyAnimation { target: redLight; property: "color"; duration: 500; easing.type: Easing.InOutQuad }
                    PropertyAnimation { target: yellowLight; property: "color"; duration: 500; easing.type: Easing.InOutQuad }
                    PropertyAnimation { target: greenLight; property: "color"; duration: 500; easing.type: Easing.InOutQuad }
                }
            }
        ]
    }
}


