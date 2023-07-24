import QtQuick
import QtQuick.Controls

Item {
    id: startMenu
    signal startClick(string type)

    Rectangle {
        height: 667
        width: 375
        color: "#2D8EDE"

        Text {
            text: "TIC-TAC-TOE"
            font.bold: Font.Bold
            font.pixelSize: 42
            color: "white"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            width: 276
            height: 51
            anchors.horizontalCenter: parent.horizontalCenter
            y: 208
        }
        TextButton {
            x: 32
            y: 482
            text: "Player vs CPU"
            onButtonClick: startClick("CPU")
        }
        TextButton {
            x: 200
            y: 482
            text: "Player vs Player"
            onButtonClick: startClick("PLAYER")
        }
    }
}
