import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    Rectangle {
        anchors.fill: parent
        Image {
            id: backgroundMenu
            anchors.fill: parent
            source: "qrc:/images/menu_back.png"
        }

        Text {
            id: blackJackText
            anchors {
                top: parent.top
                topMargin: parent.height / 5
                horizontalCenter: parent.horizontalCenter
            }
            text: "BlackJack"
            color: "#e6a76c"
            font.family: "Montserrat Alternates Black"
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 80
            layer.enabled: true
            layer.effect: Glow {
                samples: 20
                color: "black"
                transparentBorder: true
            }
        }

        FlipableButton {
            id: exitButton
            width: 100
            height: 100
            btnText: "Выйти из игры"
            frontImage:  "qrc:/images/exit.png"
            backImage: "qrc:/images/exit.png"
            anchors {
                bottom: parent.bottom
                left: parent.left
                bottomMargin: parent.height / 8
                leftMargin: 50
            }
            onBtnClicked: {
                Qt.quit()
            }
        }
        FlipableButton {
            id: settingsButton
            width: 100
            height: 100
            btnText: "Настройки"
            frontImage:  "qrc:/images/settings.png"
            backImage: "qrc:/images/settings.png"
            anchors {
                bottom: exitButton.top
                left: parent.left
                bottomMargin: 30
                leftMargin: 50
            }
            onBtnClicked: {
            }
        }
        FlipableButton {
            id: playButton
            width: 100
            height: 100
            btnText: "Играть"
            frontImage:  "qrc:/images/play.png"
            backImage: "qrc:/images/play.png"
            anchors {
                bottom: settingsButton.top
                left: parent.left
                bottomMargin: 30
                leftMargin: 50
            }
            onBtnClicked: {
            }
        }
    }
}

