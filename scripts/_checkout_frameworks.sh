#!/bin/bash
rm -R frameworks;
mkdir frameworks;
cd frameworks;
#CoreRender.framework
curl "https://raw.githubusercontent.com/alexdrone/CoreRender/master/bin/dist.zip" > dist.zip && unzip dist.zip && rm dist.zip;
#Emit.framework
curl "https://raw.githubusercontent.com/alexdrone/Emit/master/bin/dist.zip" > dist.zip && unzip dist.zip && rm dist.zip;
