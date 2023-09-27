<cfcomponent>
    <cfset this.Name = "APIS">

    <!--- DEFINE REST CFC SETTINGS --->
    <cfset this.restsettings.autoregister = true>
    <cfset this.restsettings.skipCFCWithError = false>
    <cfset this.restsettings.serviceMapping = "CFLAT">

    <cffunction name="onApplicationStart">
        <cfreturn this>
    </cffunction>

    <!--- ADD INIT TO RESET ---> 
    <cffunction name="onRequest"> 
        <cfargument name="targetPage">
        <cfif isdefined("url.init")>
            <cfset restInitApplication("C:\ColdFusion2023\cfusion\wwwroot\CFlat","CFLAT")>
            <cfset onApplicationStart()>
        </cfif>
        <cfinclude template="#arguments.targetPage#">
        <cfreturn true>
    </cffunction>
</cfcomponent>
