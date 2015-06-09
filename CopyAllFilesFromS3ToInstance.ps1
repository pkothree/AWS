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
try
{
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
}
catch
{
    write-host "Error occured" -ForegroundColor Red 
    write-host $error[0].Exception -ForegroundColor Red -BackgroundColor Yellow
}

finally
{
    read-host "Press ENTER to exist..."
}