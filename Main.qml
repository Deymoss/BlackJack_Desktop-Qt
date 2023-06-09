import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    minimumWidth: 640
    minimumHeight: 480
    Component.onCompleted: {
        showFullScreen()
    }
    visible: true
    Loader {
        id: pageLoader
        anchors.fill: parent
        sourceComponent: mainMenu
    }
    Component {
        id: mainMenu
        MainMenu {}
    }
}
