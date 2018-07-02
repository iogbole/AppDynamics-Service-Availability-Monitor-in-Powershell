# AppDynamics Service Availability Monitor in Powershell

This custom machine agent extension monitors the availability of web based services.  

It sends a GET request (using a pre-defined frequency) to the URL, if the response code is 200 OK, it sends 1 to AppDynamics, otherwise, it sends 0 to AppDynamics. Health rules and/or dahsboards can then be configured based on the metric value. 


This Service Availability monitoring extension come in handy when you need to monitor service availability and you have not purchased the AppDynamics Service Availability License. 

This extension is written in Powershell. Use  [ URL Monitoring extension](https://www.appdynamics.com/community/exchange/extension/url-monitoring-extension/) if you prefer Java based extension. 

### Installation 
copy the extension into MACHINE_AGENT_HOME/monitors, change the URL in the script and restart the machine agent.


