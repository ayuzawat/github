$key = "ACe40b890171089a71174156d8470b666d"
$secret = "f793a7154fdf1d10de72a3589ea47aea"
$uri = "https://api.twilio.com/2010-04-01/Accounts/$key/Calls"
$xml = "http://demo.twilio.com/docs/voice.xml"
$parameters = @{Url=$xml; To="+818037098469"; From="+815031969596"; }

# BASICîFèÿ
$auth = "${key}:${secret}"
$base64 = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($auth))
$header = @{Authorization = "Basic $base64"}

Invoke-WebRequest -Uri $uri -Method POST -Body $parameters -Headers $header
