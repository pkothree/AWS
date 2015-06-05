#get-module -ListAvailable

import-module AWSPowerShell

#aws
$s3bucket = "Bucketname"
$region = "eu-central-1"
$access = "AccessKey"
$secret = "SecretKey"
$folder = "FolderNameInS3Bucket"

#local machine
$path = "LocalPath"

write-host "Getting the bucket: " $s3bucket
$files = Get-S3Object -BucketName $s3bucket -KeyPrefix $folder -AccessKey $access -SecretKey $secret #-Region $region

write-host "crawling through files now..."
foreach($file in $files)
{
    if($file.key -ne "")
    {
        write-host "File: " $file.Key
        $localfile = $path + $file
        Copy-S3Object -BucketName $s3bucket -Key $file.Key -LocalFile $localfile -AccessKey $access -SecretKey $secret #-Region $region
    }
}

Read-Host "Press ENTER to exist..."