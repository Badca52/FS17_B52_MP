#!/bin/bash

mkdir -p temp;
cp -r ./scripts ./temp
cp modDesc.xml ./temp/modDesc.xml
cp icon.png ./temp/icon.png
cd temp
zip -r ../FS17_PriceLogger.zip *
cd ..
rm -rf temp
