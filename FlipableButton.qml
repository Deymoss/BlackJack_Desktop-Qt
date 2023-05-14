import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    property string btnText: ""
    property string frontImage: ""
    property string backImage: ""
    onBtnTextChanged: buttonText.text = btnText
    onFrontImageChanged: frontImg.source = frontImage
    onBackImageChanged: backImg.source = backImage
    signal btnClicked
    MouseArea {
        id: flipableButton
        width: parent.width + buttonText.width + 30
        height: parent.height
        state: "front"
        hoverEnabled: true

        onClicked: {
            btnClicked()
        }

        onEntered: {
            if (!flippable.transitions.running)
                flippable.state = "back"
            buttonText.layer.enabled = true
            expand.start()
        }
        onExited: {
            buttonText.layer.enabled = false
            //buttonText.anchors.leftMargin = 30
            collapse.start()
        }

        Flipable {
            id: flippable
            property bool flipped: false
            width: 100
            height: 100
            anchors {
                left: parent.left
                bottom: parent.bottom
                bottomMargin: 0
            }
            front: Image {
                id: frontImg
                anchors.fill: parent
                anchors.centerIn: parent
                source: backImage
                fillMode: Image.PreserveAspectFit
            }
            back: Image {
                id: backImg
                anchors.fill: parent
                anchors.centerIn: parent
                source: frontImage
                fillMode: Image.PreserveAspectFit
            }
            antialiasing: true
            transform: Rotation {
                id: rotation
                origin.x: flippable.width / 2
                origin.y: flippable.height / 2
                axis.x: 0
                axis.y: 1
                axis.z: 0 // set axis.y to 1 to rotate around y-axis
                angle: 0 // the default angle
            }

            states: [
                State {
                    name: "back"
                    PropertyChanges {
                        target: rotation
                        angle: 180
                    }
                    PropertyChanges {
                        target: flippable
                        anchors.bottomMargin: 10
                    }
                },
                State {
                    name: "front"
                    PropertyChanges {
                        target: rotation
                        angle: 360
                    }
                    PropertyChanges {
                        target: flippable
                        anchors.bottomMargin: 0
                    }
                }
            ]

            transitions: [
                Transition {
                    from: "*"
                    to: "back"
                    ParallelAnimation {
                        NumberAnimation {
                            target: rotation
                            property: "angle"
                            duration: 200
                        }
                        NumberAnimation {
                            target: flippable
                            property: "anchors.bottomMargin"
                            duration: 200
                        }
                    }
                    onRunningChanged: {
                        if (!running) {
                            flippable.state = "front"
                        }
                    }
                },
                Transition {
                    from: "*"
                    to: "front"
                    NumberAnimation {
                        target: rotation
                        property: "angle"
                        duration: 200
                    }
                    NumberAnimation {
                        target: flippable
                        property: "anchors.bottomMargin"
                        duration: 200
                    }
                }
            ]
        }
        Text {
            id: buttonText
            anchors {
                left: flippable.right
                leftMargin: 30
                verticalCenter: parent.verticalCenter
            }
            text: text
            font.family: "Montserrat Alternates Black"
            color: "white"
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 30
            PropertyAnimation on anchors.leftMargin {
                id: expand
                to: 50
                duration: 150
                running: false
            }
            PropertyAnimation on anchors.leftMargin {
                id: collapse
                to: 30
                duration: 150
                running: false
            }
            layer.enabled: false
            layer.effect: Glow {
                samples: 25
                color: "#610e0e"
                transparentBorder: true
            }
        }
    }
}
