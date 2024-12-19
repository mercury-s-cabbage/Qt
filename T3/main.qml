import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12
import "."

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("ColumnLayout")
    property int myMargin: 10 // Устанавливаем отступы
    property string headerText: "Заголовок"
    property string contentText: "Контент"
    minimumWidth: cl.implicitWidth + 2 * myMargin // Минимальная ширина окна

    ColumnLayout {
        id: cl
        spacing: myMargin
        anchors.fill: parent // Иначе не увидим выравнивание

        Comp {
            Layout.fillWidth: true
            text: headerText
        }
        Comp {
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: contentText
            Layout.alignment: Qt.AlignHCenter
            Layout.leftMargin: myMargin // Отступ слева
            Layout.rightMargin: myMargin // Отступ справа
        }
        RowLayout {
             height: 100
             width: parent.width

             // Кнопка 1
             Comp {
                 id: button1
                 Layout.fillWidth: true
                 text: "1"
                 MouseArea {
                     anchors.fill: parent
                     onClicked: {
                         headerText = "Вау, новый крутой заголовок!"
                         contentText = "Контент тоже изменился"
                         button1.opacity = 1
                         button2.opacity = 0.3
                         button3.opacity = 0.3
                     }
                 }
             }

             // Кнопка 2
             Comp {
                 id: button2
                 Layout.fillWidth: true
                 text: "2"
                 MouseArea {
                     anchors.fill: parent
                     onClicked: {
                         headerText = "Загололовок еще круче"
                         contentText = "И контент не подкачал"
                         button1.opacity = 0.3
                         button2.opacity = 1
                         button3.opacity = 0.3
                     }
                 }
             }

             // Кнопка 3
             Comp {
                 Layout.fillWidth: true
                 text: "3"
                 id: button3
                 MouseArea {
                     anchors.fill: parent
                     onClicked: {
                         headerText = "Самый крутой заголовок"
                         contentText = "Контент меркнет в его тени"
                         button1.opacity = 0.3
                         button2.opacity = 0.3
                         button3.opacity = 1
                     }
                 }
             }
         }
     }
 }
