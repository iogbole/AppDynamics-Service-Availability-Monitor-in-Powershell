Clear-Host

$tier_id = "XXX"
$service_name = "GeoServer"
$metric_name = "Availability"
$metric_prefix = "name=Server|Component:$tier_id|Custom Metrics|Service Availability|$service_name|$metric_name,"

$success = "value=1"
$failed = "value=0"

#https://FQDN:8443/geo/test.html

$url = 'https://appdynamics.com' #replace with the url you'd like to monitor. for GeoServer 
$req = [system.Net.WebRequest]::Create($url)

$req.Timeout = 30000 # 30 seconds 
$req.AllowAutoRedirect = $true # set this to $false to disable follow redirects 

try {
    $res = $req.GetResponse()
} 
catch [System.Net.WebException] {
    $res = $_.Exception.Response
}
$res.StatusCode
#OK
[int]$res.StatusCode
#200 
if ([int]$res.StatusCode -eq 200 ) { 
    Write-Host "Service respondsed with 200 OK. Send 1 to AppDynamics"
    Write-Host $metric_prefix$success
}
else {
    Write-Host "Service failed to respond. Send zero to AppDynamics"
    Write-Host $metric_prefix$failed

}