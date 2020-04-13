#!/usr/bin/env python3

import os
import time
from zipfile import ZipFile

def getAllFilePaths(directory):
    filePaths = []
    for root, directories, files in os.walk(directory):
        for fileName in files:
            filePath = os.path.join(root, fileName)
            filePaths.append(filePath)
    print(filePaths)

getAllFilePaths('/home/mediocre/Pictures')
