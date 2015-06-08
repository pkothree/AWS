# AWS
Amazon Web Services Scripts
I will post a couple of AWS scripts in the near future and provide a short explanation here.


# GetInstancesRunning.ps1
This script will simply run through all the regions in AWS and will check if any instance has the state "running". You can check for every possible state there is.


# CopyAllFilesFromS3ToInstance.ps1
This script will run through a specified bucket in your S3 and will copy all containing files to a location. Usually you would use a local address for this ('D:\Install'). This might take a will, because it will only copy one file at a time. Also you will have to consider to be able to connect to S3!
