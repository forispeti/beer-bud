import QtQuick
import QtQuick.Controls

ApplicationWindow {
    visible: true
    height: 667
    width: 375
    color: "grey"

    StackView {
        id: stackPage

        anchors.fill: parent
        pushEnter: Transition {
            OpacityAnimator {
                to: 1
                duration: 0
            }
        }
        popEnter: Transition {
            OpacityAnimator {
                to: 1
                duration: 0
            }
        }
        popExit: Transition {
            OpacityAnimator {
                to: 0
                duration: 0
            }
        }
        initialItem: StartMenu {
            onStartClick: type => {
                              let currItem = stackPage.push("./TicTacToe.qml", {
                                                                "isAgainstCPU": type === "CPU"
                                                            })
                              //                              currItem.reset.connect(isReset => {
                              //                                                         stackPage.pop()
                              //                                                         if (isReset)
                              //                                                         stackPage.push(
                              //                                                             "./TicTacToe.qml",
                              //                                                             {
                              //                                                                 "isAgainstCPU": type === "CPU"
                              //                                                             })
                              //                                                     })
                          }
        }
    }
}
