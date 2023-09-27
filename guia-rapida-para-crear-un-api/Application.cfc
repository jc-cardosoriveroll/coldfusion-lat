<cfcomponent> 
	<!--- Nombre de APP --->
	<cfset THIS.Name = "APIS" />
    
	<!--- PERSISTENCIA ---> 
	<cfset THIS.SessionManagement = false />
	<cfset THIS.ClientManagement =  false />
	<cfset THIS.SetClientCookies = false /> 

	<!--- CONFIG DE APIS --->
	<cfset THIS.restsettings.autoregister = true />
	<cfset THIS.restsettings.skipCFCWithError = false />   
	<cfset this.restsettings.servicemapping="APIS"/>	<!--- Carpeta --->
    
    <!--- CONFIG DE HEADER --->
	<cfset THIS.cfprocessingdirective.pageencoding = "utf-8" />
    
	<!--- ALGUNAS PROPIEDADES UTILES. --->
	<cfsetting requesttimeout="90" 
    			showdebugoutput="false" 
                enablecfoutputonly="false"/>
    
    <!--- FUNCION PARA INICIALIZAR APIS (con url.init)--->
    <cffunction name="onRequest">
        <cfargument name="targetPage">
        <cfif isdefined("url.init")>
            <cfset restInitApplication("C:\wwwroot\apis","APIS")>
            <cfset onApplicationStart()>     
        </cfif>
        <cfinclude template="#arguments.targetPage#">
        <cfreturn>
    </cffunction>
 
</cfcomponent>
