import QtQuick 2.0

Rectangle {
    id: comp
    width: 100
    height: 50
    border.width: 1
    radius: 5
    color: "gray" // Начальный цвет

    property alias text: label.text
    property alias fontSize: label.font.pixelSize

    Text {
        id: label
        anchors.centerIn: parent
        font.pixelSize: 18
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    states: [
        State {
            name: "selected"
            PropertyChanges {
                target: comp
                color: "green" // Цвет в выбранном состоянии
            }
        },
        State {
            name: "default"
            PropertyChanges {
                target: comp
                color: "gray" // Цвет в обычном состоянии
            }
        }
    ]

    transitions: [
        // Плавная анимация перехода от одного состояния к другому
        Transition {
            from: "default"
            to: "selected"
            reversible: true
            ParallelAnimation {
                ColorAnimation {
                    target: comp
                    property: "color"
                    duration: 500
                    easing.type: Easing.InOutQuad
                }
            }
        },
        Transition {
            from: "selected"
            to: "default"
            reversible: true
            ParallelAnimation {
                ColorAnimation {
                    target: comp
                    property: "color"
                    duration: 500
                    easing.type: Easing.InOutQuad
                }
            }
        }
    ]

    MouseArea {
        anchors.fill: parent
        onClicked: {
            // Меняем состояние при клике
            comp.state = comp.state === "selected" ? "default" : "selected";
        }
    }
}

