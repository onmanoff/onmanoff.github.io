---
layout: post
title:  "PyQGis Project Load"
date:   2019-09-17 15:11
categories: qgis
---
```python
# If you are not inside a QG IS console you first need to import
# qgis and PyQt classes you will use in this script as shown below:
import os
from zipfile import ZipFile
from datetime import datetime
from qgis.core import  (QgsProject,
                                QgsVectorLayer,
                                QgsCoordinateReferenceSystem,
                                QgsCoordinateTransform,
                                QgsPointXY
                       )
def loadLayer (dt, var ,pres) :
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
    folder = 'D:\\tilemap\\NWP\\UM\\GDPS\\ERLY\\980202\\{0}\\{1}'.format(dt.strftime("%Y%m"), dt.strftime("%d"))
    file = 'g768_v070_ergl_pres_{0}.{1}_{2}_{3}.zip'.format(dt.strftime("%Y%m%d%H%M%S"), dt.strftime("%Y%m%d%H%M"), var, pres)
    lineLayer = 'LINE'
    print (os.path.join(folder, file))
    with ZipFile(os.path.join(folder, file)) as vzip:
        vzip.extract(lineLayer, folder);
    #    with vzip.open(lineLayer) as vfile:
    # Load another project
    project.read('D:\\PyQGIS\\sample.qgz')

#print(project.fileName())

dt = datetime(2019, 9, 7, 0, 0)
var = "TAV"
pres = 850
loadLayer(dt, var, pres)
```
