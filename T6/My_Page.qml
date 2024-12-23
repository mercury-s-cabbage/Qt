import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.2
Page{
id:root
property alias backgroundColor:back_fon.color
property alias button1Text:batton_nav1.text
property alias button2Text:batton_nav2.text
property alias button3Text:batton_nav3.text
signal button1Clicked();
signal button2Clicked();
signal button3Clicked();


background: Rectangle{
id:back_fon
}

Button {
id:batton_nav1
anchors.right: parent.right
anchors.bottom: parent.bottom
anchors.margins: defMargin
onClicked: {
root.button1Clicked()
}
}

Button {
id:batton_nav2
anchors.left: parent.left
anchors.bottom: parent.bottom
anchors.margins: defMargin
onClicked: {
root.button2Clicked()
}
}

Button {
id:batton_nav3
anchors.top: parent.top
anchors.margins: defMargin
onClicked: {
root.button3Clicked()
}
}
}
