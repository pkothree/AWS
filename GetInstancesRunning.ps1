#Danny Davis
# http://danny-davis.net
# 3/6/2015

#Set Filter params for status
$filter = New-Object Amazon.EC2.Model.Filter
$filter.Name = "instance-state-name"
$filter.Value = "running"

$regions = Get-AWSRegion
foreach ($region in $regions)
{
#Display the current region
Write-Host $region

#Get the instance according to the filter
$instance = Get-EC2Instance -Filter $filter -region $region
#display the instanceid
write-host $instance.Instances.InstanceID

}