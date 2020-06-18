import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.3
import QtQuick.Controls 1.6


ApplicationWindow {
    id: compareParamsWindow
    width: 480
    height: 480
    color: "#e9e7e7"
    title: qsTr("Properties")

    TextInput {
        id: textInput2
        x: 31
        y: 32
        width: 384
        height: 20
        text: qsTr("Choose the sheet and column to be compare")
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 12
    }


    Item {
        id: ficheroBase
        x: 31
        y: 50
        width: 415
        height: 171
        TextInput {
            id: textInput
            x: 0
            y: 11
            width: 135
            height: 20
            text: qsTr("Properties File A")
            transformOrigin: Item.TopLeft
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 12
        }

        Item {
            id: hojaFA
            y: 35
            width: 200
            height: 59
            anchors.left: parent.left
            anchors.leftMargin: 10
            transformOrigin: Item.Left

            TextInput {
                id: textInput3
                width: 80
                height: 20
                text: qsTr("Sheet")
                font.pixelSize: 12

            }

            ComboBox {
                id: comboBoxSheetsAList
                x: 0
                y: 22
                model: ListModel
                {
                    id: sheetsAList
                }
            }
        }

        Item {
            id: columnaFA
            x: 0
            y: 100
            width: 200
            height: 59
            TextInput {
                id: textInput4
                width: 80
                height: 20
                text: qsTr("Column")
                font.pixelSize: 12
            }

            ComboBox {
                id: comboBoxColumnsAList
                x: 0
                y: 22
                clip: false
                model: ListModel
                {
                    id: columnsAList
                }
                visible: true

            }
            transformOrigin: Item.Left
            anchors.leftMargin: 8
            anchors.left: parent.left
        }




    }

    Item {
        id: ficheroDestino
        x: 31
        y: 227
        width: 415
        height: 171
        TextInput {
            id: textInput1
            x: 0
            y: 11
            width: 135
            height: 20
            text: qsTr("Properties File B")
            transformOrigin: Item.TopLeft
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 12
        }

        Item {
            id: hojaFB
            y: 35
            width: 200
            height: 59
            TextInput {
                id: textInput5
                width: 80
                height: 20
                text: qsTr("Sheet")
                font.pixelSize: 12
            }

            ComboBox {
                id: comboBoxSheetsBList
                x: 0
                y: 22
                model: ListModel
                {
                    id: sheetsBList
                }
            }
            transformOrigin: Item.Left
            anchors.leftMargin: 10
            anchors.left: parent.left
        }

        Item {
            id: columnaFB
            x: 0
            y: 100
            width: 200
            height: 59
            TextInput {
                id: textInput6
                width: 80
                height: 20
                text: qsTr("Columnn")
                font.pixelSize: 12
            }

            ComboBox {
                id: comboBoxColumnsBList
                x: 0
                y: 22
                visible: true
                model: ListModel
                {
                    id: columnsBList
                }
                clip: false

            }
            transformOrigin: Item.Left
            anchors.leftMargin: 8
            anchors.left: parent.left
        }
    }

    Item {
        id: buttons
        x: 140
        y: 404
        width: 172
        height: 26

        Button {
            id: accept
            text: qsTr("Accept")
            anchors.left: parent.left
            anchors.leftMargin: 0
            onClicked: {
                paramsFixed( comboBoxSheetsAList.currentText,comboBoxColumnsAList.currentText , comboBoxSheetsBList.currentText, comboBoxColumnsBList.currentText)
                closeCompareParams()

            }
        }

        Button {
            id: cancel
            x: 117
            y: 0
            text: qsTr("Cancel")
            anchors.right: parent.right
            anchors.rightMargin: 0
            onClicked:closeCompareParams()
        }
    }

    function clearItemsSheetsA()
    {
        sheetsAList.clear()
    }

    function clearItemsSheetsB()
    {
        sheetsBList.clear()
    }

    function clearItemsColumnsA()
    {
        columnsAList.clear()
    }

    function clearItemsColumnsB()
    {
        columnsBList.clear()
    }

    function addItemSheetsA(sheet)
    {
        sheetsAList.append({
                               value: sheet
                           })
    }

    function addItemSheetsB(sheet)
    {
        sheetsBList.append({
                               value: sheet
                           })
    }

    function addColumnsA(sheet)
    {
        columnsAList.append({value: "A"})
        columnsAList.append({value: "B"})
        columnsAList.append({value: "C"})
        columnsAList.append({value: "D"})
        columnsAList.append({value: "E"})
        columnsAList.append({value: "F"})
        columnsAList.append({value: "G"})
        columnsAList.append({value: "H"})
        columnsAList.append({value: "I"})
        columnsAList.append({value: "J"})
        columnsAList.append({value: "K"})
        columnsAList.append({value: "L"})
        columnsAList.append({value: "M"})
        columnsAList.append({value: "N"})
        columnsAList.append({value: "Ñ"})
        columnsAList.append({value: "O"})
        columnsAList.append({value: "P"})
        columnsAList.append({value: "Q"})
        columnsAList.append({value: "R"})
        columnsAList.append({value: "S"})
        columnsAList.append({value: "T"})
        columnsAList.append({value: "U"})
        columnsAList.append({value: "V"})
        columnsAList.append({value: "W"})
        columnsAList.append({value: "X"})
        columnsAList.append({value: "Y"})
        columnsAList.append({value: "Z"})
    }

    function addColumnsB(sheet)
    {
        columnsBList.append({value: "A"})
        columnsBList.append({value: "B"})
        columnsBList.append({value: "C"})
        columnsBList.append({value: "D"})
        columnsBList.append({value: "E"})
        columnsBList.append({value: "F"})
        columnsBList.append({value: "G"})
        columnsBList.append({value: "H"})
        columnsBList.append({value: "I"})
        columnsBList.append({value: "J"})
        columnsBList.append({value: "K"})
        columnsBList.append({value: "L"})
        columnsBList.append({value: "M"})
        columnsBList.append({value: "N"})
        columnsBList.append({value: "Ñ"})
        columnsBList.append({value: "O"})
        columnsBList.append({value: "P"})
        columnsBList.append({value: "Q"})
        columnsBList.append({value: "R"})
        columnsBList.append({value: "S"})
        columnsBList.append({value: "T"})
        columnsBList.append({value: "U"})
        columnsBList.append({value: "V"})
        columnsBList.append({value: "W"})
        columnsBList.append({value: "X"})
        columnsBList.append({value: "Y"})
        columnsBList.append({value: "Z"})
    }



}



/*##^##
Designer {
    D{i:3;anchors_x:31}D{i:4;anchors_x:476}D{i:7;anchors_x:476}D{i:11;anchors_x:31}D{i:12;anchors_x:476}
D{i:15;anchors_x:476}
}
##^##*/
