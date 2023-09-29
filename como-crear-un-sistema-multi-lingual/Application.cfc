<cfcomponent>
	<!--- Habilito persistencia --->
	<cfset THIS.SessionManagement = true>
	<cfset THIS.ClientManagement = true>
	<cfset THIS.SetClientCookies = true>

    <cffunction name="onApplicationStart">
        <!--- Inicializo el componente que trae el archivo de idiomas --->
		<cfset Application["lang"] = 	
               		createObject("component","scripts").getFile("lang.json")>
        
    </cffunction>
	<cffunction name="onRequestStart"> 
		<cfif isdefined("url.init")>
			<cfset onApplicationStart()>
		</cfif>
	</cffunction>
        
</cfcomponent>
