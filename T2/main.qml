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
    minimumWidth: cl.implicitWidth + 2 * myMargin // Минимальная ширина окна

    ColumnLayout {
        id: cl
        spacing: myMargin
        anchors.fill: parent // Иначе не увидим выравнивание

        Comp {
            Layout.fillWidth: true
            text: "header"
        }
        Comp {
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: "content"
            Layout.alignment: Qt.AlignHCenter
            Layout.leftMargin: myMargin // Отступ слева
            Layout.rightMargin: myMargin // Отступ справа
        }
        RowLayout
        {
            height: 100
            width: parent.width
            Comp {
                Layout.fillWidth: true
                text: "1"
            }
            Comp {
                Layout.fillWidth: true
                text: "2"
            }
            Comp {
                Layout.fillWidth: true
                text: "3"
            }
        }
}}

