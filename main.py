import sys


from PySide2.QtQml import *
from PySide2.QtGui import QGuiApplication
from PySide2.QtQuick import QQuickView
from PySide2.QtCore import QUrl, QObject, Signal, Slot, Property
from Compare import Compare


class MainWindowPy(QObject):

    ## Unica forma de pasar el nombre de los parámetros a QML ##
    sheetsA = Signal(str, arguments=['sheet'])
    sheetsB = Signal(str, arguments=['sheet'])
    
    
    def __init__(self, fileBase=""):
        QObject.__init__(self)
        self._fileBase = fileBase
        self.compare = ""

    @Slot(str, str)
    def setFileBaseSlot(self, fileBase, fileDestino):
        if fileBase.find("file:") != -1 and fileDestino.find("file:") != -1:
            print("Run Compare")
            self.compare = Compare(fileBase,fileDestino)
            wbA = self.compare.getWbA()
            wbB = self.compare.getWbB()
            for sheet in wbA.sheetnames:
                self.sheetsA.emit(str(sheet))
            for sheet in wbB.sheetnames:
                self.sheetsB.emit(str(sheet))

        else:
            print("Path not correct. Should be a path accesible from windows explorer")
    @Slot(str, str,str,str)
    def setSheetnamesAndColumns(self,sheetA,columnA,sheetB,columnB):
        self.compare.compareExcel(sheetA,columnA,sheetB,columnB)





def main():
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    qmlRegisterType(MainWindowPy, 'MainWindowPy', 1, 0, 'MainWindowPy')

    mainWindow = MainWindowPy()

    engine.load(QUrl("main.qml"))
  
    if not engine.rootObjects():
        sys.exit(-1)    

    app.exec_()


if __name__ == "__main__":
    main()




   

