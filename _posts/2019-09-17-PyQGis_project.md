---
layout: post
title:  "PyQGis Project Load"
date:   2019-05-20 15:11
categories: qgis
---
```python
# If you are not inside a QG IS console you first need to import
# qgis and PyQt classes you will use in this script as shown below:
import os
from zipfile import ZipFile
from qgis.core import  (QgsProject,
                                QgsVectorLayer,
                                QgsCoordinateReferenceSystem,
                                QgsCoordinateTransform,
                                QgsPointXY
                       )

# Get the project instance
project = QgsProject.instance()
# Print the current project file name (might be empty in case no projects have been loaded)
project.clear()

# vlayer = QgsVectorLayer("D:\\tilemap\\NWP\\UM\\GDPS\\ERLY\\980202\\201905\\15\\LINE", "LINE", "ogr")
# if not vlayer.isValid():
#     print("Layer failed to load!")
# 
# project.addMapLayer(vlayer)
# print(project.fileName())
# 
folder = 'D:\\tilemap\\NWP\\UM\\GDPS\\ERLY\\980202\\201905\\15'
file = 'g768_v070_ergl_pres_20190515060000.201905150600_RELV_950.zip'
lineLayer = 'LINE'
with ZipFile(os.path.join(folder, file)) as vzip:
    vzip.extract(lineLayer, folder);
#    with vzip.open(lineLayer) as vfile:


# Load another project
project.read('D:\\PyQGIS\\sample.qgz')
```
