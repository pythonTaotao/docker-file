#!/bin/bash
dotnet /root/dotnet/DataExtract.Microservice.dll &
java "-Dfile.encoding=UTF-8" -Xms20g -Xmx20g -jar /root/java/ms-data-pretreatment2.jar --spring.profiles.active=prod
