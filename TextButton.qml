import QtQuick

Item {
    id: item
    signal buttonClick
    property string text
    Rectangle {
        width: 143
        height: 143
        radius: 20
        color: "white"
        MouseArea {
            anchors.fill: parent
            onClicked: buttonClick()
        }
        Text {
            anchors.centerIn: parent
            text: item.text
        }
    }
}
