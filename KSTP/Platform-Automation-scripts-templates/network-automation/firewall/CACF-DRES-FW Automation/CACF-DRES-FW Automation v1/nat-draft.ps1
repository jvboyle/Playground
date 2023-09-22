########### ADD NAT ##########
#PLEASE NOTE YOU NEED TO CHECK ORDER OF NAT ON DRES VPN EDGE AFTER IMPLEMENTATION  

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/xml")
$headers.Add("Content-Type", "text/plain")

$body ="  
    <natRules>`n    
        <natRule>`n      
            <action>dnat</action>`n      
            <vnic>0</vnic>`n      
            <originalAddress>158.87.104.50</originalAddress>`n      
            <translatedAddress>100.72.120.50</translatedAddress>`n      
            <loggingEnabled>true</loggingEnabled>`n      
            <enabled>true</enabled>`n      
            <description>CACF SSH proxy</description>`n    
        </natRule>`n    
        <natRule>`n      
            <action>dnat</action>`n      
            <vnic>0</vnic>`n      
            <originalAddress>158.87.104.51</originalAddress>`n      
            <translatedAddress>100.72.120.51</translatedAddress>`n      
            <loggingEnabled>true</loggingEnabled>`n      
            <enabled>true</enabled>`n      
            <description>CACF SSH proxy</description>`n    
        </natRule>`n    
        <natRule>`n      
            <action>dnat</action>`n      
            <vnic>0</vnic>`n      
            <originalAddress>158.87.104.52</originalAddress>`n      
            <translatedAddress>100.72.120.52</translatedAddress>`n      
            <loggingEnabled>true</loggingEnabled>`n      
            <enabled>true</enabled>`n      
            <description>CACF SSHproxy</description>`n    
        </natRule>`n    
        <natRule>`n      
            <action>snat</action>`n      
            <vnic>0</vnic>`n      
            <originalAddress>100.72.120.50</originalAddress>`n      
            <translatedAddress>158.87.104.50</translatedAddress>`n      
            <loggingEnabled>true</loggingEnabled>`n      
            <enabled>true</enabled>`n      
            <description>CACF SSHproxy</description>`n    
        </natRule>`n    
        <natRule>`n      
            <action>snat</action>`n      
            <vnic>0</vnic>`n      
            <originalAddress>100.72.120.51</originalAddress>`n      
            <translatedAddress>158.87.104.51</translatedAddress>`n      
            <loggingEnabled>true</loggingEnabled>`n      
            <enabled>true</enabled>`n      
            <description>CACF SSHproxy</description>`n    
        </natRule>`n    
        <natRule>`n      
            <action>snat</action>`n      
            <vnic>0</vnic>`n      
            <originalAddress>100.72.120.52</originalAddress>`n      
            <translatedAddress>158.87.104.52</translatedAddress>`n      
            <loggingEnabled>true</loggingEnabled>`n      
            <enabled>true</enabled>`n     
            <description>CACF SSHproxy</description>`n   
        </natRule>`n  
    </natRules>"


$response = Invoke-RestMethod 'https://$region/api/4.0/edges/edge-140/nat/config/rules' -Method 'POST' -Headers $headers -Body $body -Credential $Cred
$response | ConvertTo-Json