import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("ColumnLayout with Animation")
    property int myMargin: 10
    property string headerText: "Заголовок"
    property string contentText: "Контент"
    property int selectedButton: 1 // Указывает, какая кнопка выбрана
    minimumWidth: cl.implicitWidth + 2 * myMargin

    ColumnLayout {
        id: cl
        spacing: myMargin
        anchors.fill: parent

        // Заголовок
        Comp {
            Layout.fillWidth: true
            text: headerText
        }

        // Контент
        Comp {
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: contentText
            Layout.alignment: Qt.AlignHCenter
            Layout.leftMargin: myMargin
            Layout.rightMargin: myMargin
        }

        // Панель кнопок
        RowLayout {
            height: 100
            width: parent.width

            // Кнопка 1
            Comp {
                id: button1
                Layout.fillWidth: true
                text: "1"
                opacity: selectedButton == 1 ? 1 : 0.3
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        selectedButton = 1
                        headerText = "Вау, новый крутой заголовок!"
                        contentText = "Контент тоже изменился"
                    }
                }
            }

            // Кнопка 2
            Comp {
                id: button2
                Layout.fillWidth: true
                text: "2"
                opacity: selectedButton == 2 ? 1 : 0.3
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        selectedButton = 2
                        headerText = "Заголовок еще круче"
                        contentText = "И контент не подкачал"
                    }
                }
            }

            // Кнопка 3
            Comp {
                id: button3
                Layout.fillWidth: true
                text: "3"
                opacity: selectedButton == 3 ? 1 : 0.3
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        selectedButton = 3
                        headerText = "Самый крутой заголовок"
                        contentText = "Контент меркнет в его тени"
                    }
                }
            }
        }
    }

    // Анимация переходов
    states: [
        State {
            name: "button1Selected"
            when: selectedButton == 1
            PropertyChanges { target: button1; opacity: 1 }
            PropertyChanges { target: button2; opacity: 0.3 }
            PropertyChanges { target: button3; opacity: 0.3 }
        },
        State {
            name: "button2Selected"
            when: selectedButton == 2
            PropertyChanges { target: button1; opacity: 0.3 }
            PropertyChanges { target: button2; opacity: 1 }
            PropertyChanges { target: button3; opacity: 0.3 }
        },
        State {
            name: "button3Selected"
            when: selectedButton == 3
            PropertyChanges { target: button1; opacity: 0.3 }
            PropertyChanges { target: button2; opacity: 0.3 }
            PropertyChanges { target: button3; opacity: 1 }
        }
    ]

    transitions: [
        Transition {
            from: "*"
            to: "*"
            PropertyAnimation {
                target: button1
                properties: "opacity"
                duration: 300
            }
            PropertyAnimation {
                target: button2
                properties: "opacity"
                duration: 300
            }
            PropertyAnimation {
                target: button3
                properties: "opacity"
                duration: 300
            }
        }
    ]
}

