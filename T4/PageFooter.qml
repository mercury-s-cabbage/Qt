import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Rectangle {
    id: root
    height: 60
    width: parent.width
    gradient: Gradient {
        GradientStop { position: 0; color: "lightgray" }
        GradientStop { position: 1; color: "white" }
    }

    signal newMessage(string msg)

    RowLayout {
        anchors.fill: parent
        spacing: 10

        TextField {
            id: edtText
            selectByMouse: true
            Layout.fillWidth: true
            placeholderText: "Write a message..."
            font.pointSize: 10
            color: "black"
        }

        Button {
            id: btnAddItem
            text: "Send"
            height: root.height
            onClicked: {
                newMessage(edtText.text);
                edtText.clear();
            }
        }
    }
}
