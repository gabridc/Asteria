import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.14

import MainWindowPy 1.0


Window {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    color: "#e9e7e7"
    title: qsTr("Asteria")

    property list<ApplicationWindow> compareParams

    Item {
        id: logo
        width: 128
        height: 60
        anchors.left: parent.left
        anchors.leftMargin: 39
        anchors.top: parent.top
        anchors.topMargin: 23

        Rectangle {
            id: rectangle2
            color: "#00000000"
            anchors.fill: parent
            border.width: 3
            border.color: "#fbbb21"
        }
    }

    MainWindowPy
    {
        id: mainWindowPy

        onSheetsA: {
            compareParams[0].show()
            compareParams[0].addItemSheetsA(sheet)

        }

        onSheetsB: {
            compareParams[0].show()
            compareParams[0].addItemSheetsB(sheet)
        }
    }


    Item {
        id: body
        anchors.top: logo.bottom
        anchors.topMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        Item {
            id: ficheroBase
            x: 25
            y: 22
            width: 395
            height: 45

            Button {
                id: button
                x: 308
                text: qsTr("Open File")
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                onClicked: fileDialogBase.visible = true
            }

            Rectangle {
                id: rectangle
                x: 6
                y: 8
                width: 261
                height: 28
                color: "#00000000"

                TextInput {
                    id: textInput
                    x: 0
                    y: 4
                    width: 261
                    height: 20
                    text: qsTr("   Choose destination file ( A )")
                    horizontalAlignment: Text.AlignLeft
                    font.pixelSize: 12

                }
            }
        }

        Item {
            id: ficheroModificados
            x: 25
            y: 73
            width: 395
            height: 45
            Button {
                id: button1
                x: 308
                text: qsTr("Open File")
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                onClicked: fileDialogModificados.visible = true
            }

            Rectangle {
                id: rectangle1
                x: 6
                y: 8
                width: 261
                height: 28
                color: "#00000000"
                TextInput {
                    id: textInput1
                    x: 0
                    y: 5
                    width: 261
                    height: 20
                    text: qsTr("   Choose destination file ( B )")
                    horizontalAlignment: Text.AlignLeft
                    font.pixelSize: 12
                }
            }
        }

        Button {
            id: buttonComparar
            y: 108
            text: qsTr("Compare")
            anchors.left: resultado.right
            anchors.leftMargin: -100
            anchors.bottom: resultado.top
            anchors.bottomMargin: 5
            checkable: true
            onClicked: {
                var component = Qt.createComponent("CompareParams.qml")
                compareParams.push( component.createObject(Window))

                compareParams[0].clearItemsSheetsA()
                compareParams[0].clearItemsSheetsB()
                compareParams[0].clearItemsColumnsA()
                compareParams[0].clearItemsColumnsB()

                compareParams[0].addColumnsA()
                compareParams[0].addColumnsB()
                mainWindowPy.setFileBaseSlot(textInput.text, textInput1.text)
            }
        }

        Rectangle {
            id: resultado
            x: 39
            y: 141
            width: 541
            height: 172
            color: "#00000000"
            border.color: "#000000"

            Text {
                id: textresultado
                text: qsTr("")
                visible: true
                anchors.fill: parent
                anchors.top: parent.top
                textFormat: Text.PlainText
                font.pixelSize: 12
            }
        }

    }



    FileDialog {
        id: fileDialogBase
        title: "Please choose a file"
        folder: shortcuts.home
        onAccepted: {
            textInput.text = fileDialogBase.fileUrls[0]
            console.log("You chose: " + fileDialogBase.fileUrls)
        }
        onRejected: {
            console.log("Canceled")
        }
    }

    FileDialog {
        id: fileDialogModificados
        title: "Please choose a file"
        folder: shortcuts.home
        onAccepted: {
            textInput1.text = fileDialogModificados.fileUrls[0]
            console.log("You chose: " + fileDialogModificados.fileUrls)
        }
        onRejected: {
            console.log("Canceled")
        }
    }


    function paramsFixed(sheetA, columnA, sheetB, columnB)
    {
        textresultado.text = sheetA + " " + columnA + " " + sheetB + " " + columnB
        mainWindowPy.setSheetnamesAndColumns(sheetA, columnA, sheetB, columnB)

    }

    function closeCompareParams()
    {
        compareParams[0].close()
    }


}

/*##^##
Designer {
    D{i:1;anchors_height:60;anchors_width:128;anchors_x:39;anchors_y:23}D{i:14;anchors_x:492}
D{i:5;anchors_height:200;anchors_width:200}
}
##^##*/
