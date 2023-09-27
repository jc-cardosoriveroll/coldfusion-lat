<!--- TEST --->
<h1>TEST</h1>

<cfset local.auth = tobase64("1:test")>
<cfset local.body = {"orderStatus" : "SHIPPED"}> 

<cfhttp url="http://kraken:8500/rest/CFlat/orders/12345"
        method="GET">
        <cfhttpparam type="header" 
                     name="Authorization" 
                     value= "Basic #local.auth#">

        <cfhttpparam type="body" value="#serializeJSON(local.body)#">
</cfhttp>        

<cfdump var="#deserializeJSON(cfhttp.filecontent)#">
