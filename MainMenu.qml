import QtQuick

Item {
    Rectangle {
        anchors.fill: parent
        color: "green"

        Text {
            anchors {
                top: parent.top
                topMargin: parent.height / 5
                horizontalCenter: parent.horizontalCenter
            }
            text: "BlackJack"
            font.family: "Montserrat Alternates Black"
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 50
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
        }
    }
}

