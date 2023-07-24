import QtQuick

import "TicTacToeComputer.js" as Logic

Item {
    id: item
    property var playingField: Logic.origBoard
    property bool isAgainstCPU
    property bool isPlayer1: true

    Rectangle {
        height: 667
        width: 375
        color: "#2D8EDE"
        Text {
            id: text
            visible: false
            font.pixelSize: 42
            font.bold: Font.Bold
            color: "white"
            y: 40
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 42
            width: 324
            height: 324
            radius: 20

            Grid {
                anchors.centerIn: parent
                columns: 3
                rows: 3
                Repeater {
                    model: 9
                    Rectangle {
                        id: cubes
                        width: 89
                        height: 89
                        border.width: 1
                        border.color: "black"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                enabled = false
                                if (playingField[index] !== Logic.aiPlayer
                                        && playingField[index] !== Logic.huPlayer) {
                                    text.visible = false
                                    playingField[index]
                                            = isPlayer1 ? Logic.huPlayer : Logic.aiPlayer
                                    if (isAgainstCPU) {
                                        var aiMove = Logic.minimax(
                                                    playingField,
                                                    Logic.aiPlayer)
                                        if (aiMove
                                                && aiMove.index !== undefined)
                                            playingField[aiMove.index] = Logic.aiPlayer
                                    } else {
                                        isPlayer1 = !isPlayer1
                                    }
                                    var isGameOver = Logic.winning(
                                                playingField, Logic.aiPlayer)
                                            || Logic.winning(playingField,
                                                             Logic.huPlayer)

                                    playingFieldChanged()
                                    if (!playingField.some(
                                                (value => typeof value === "number"))
                                            || isGameOver) {
                                        let winner = Logic.winning(
                                                playingField,
                                                Logic.aiPlayer) ? Logic.aiPlayer : Logic.winning(
                                                                      playingField,
                                                                      Logic.huPlayer) ? Logic.huPlayer : ""
                                        if (winner === Logic.aiPlayer) {
                                            text.text = isAgainstCPU ? "Ai Won" : "Player 2 Won"
                                            text.visible = true
                                        } else if (winner === Logic.huPlayer) {
                                            text.text = isAgainstCPU ? "Player Won" : "Player 1 Won"
                                            text.visible = true
                                        } else {
                                            text.text = "Tie"
                                            text.visible = true
                                        }
                                        button.text = "Reset Game"
                                    }
                                }
                            }
                        }

                        Image {
                            id: mark
                            property var fieldValue: playingField[index]
                            property bool isHuPlayer: fieldValue === Logic.huPlayer
                            width: 90
                            height: 90
                            visible: isHuPlayer || fieldValue === Logic.aiPlayer
                            anchors.centerIn: parent
                            source: "./Assets/" + (isHuPlayer ? "Circle.png" : "X.png")
                        }
                    }
                }
            }
        }
        TextButton {
            id: button
            x: 120
            y: 116
            text: "Back to Main Menu"
            onButtonClick: {
                reset(button.text.indexOf("Reset") !== -1)
            }
        }
    }
    function reset(isReset) {
        parent.pop()
        if (isReset)
            parent.push("./TicTacToe.qml", {
                            "isAgainstCPU": isAgainstCPU
                        })
    }
}
