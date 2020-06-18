# Asteria

Asteria is an open source software that compare two columns inside a sheet between two excel files. The result of this compare is written in an other excel with the extension .compare, that you have to delete to open with Excel, with three diferents sheet (Common Cells, No Common Cells AvsB and No Common Cell BvsA). 

# SonarCloud Quality Gate

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=gabridc_Asteria&metric=alert_status)](https://sonarcloud.io/dashboard?id=gabridc_Asteria)

# Requeriments

Asteria is compatible with Windows, Linux and Mac OS X but you have to install some libraries to use it. Asteria have been developed using Qt Framework with Python so you should install Qt Libraries (PySide2).

- Python 3 and Pip
- PySide2
- Openpyxl

Developers are creating a requeriments.txt that install all for you but unfortnatly at this moment you will have to intall by yourself.

You can follow this guides to install:

- Python 3 and Pip: https://www.python.org/downloads/
- PySide: https://pypi.org/project/PySide2/
      
      pip install PySide2
- Openpxyl: https://openpyxl.readthedocs.io/en/stable/
      
      pip install openpyxl

# Licensing

Asteria is published under GNU GPLv3 licensing as you can see in COPYING.txt file.
