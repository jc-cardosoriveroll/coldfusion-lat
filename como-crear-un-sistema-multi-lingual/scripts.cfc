<cfcomponent>
	<cffunction name="getFile">
		<cfargument name="script">
        <cffile action="read" 
        		  file="#expandpath(arguments.script)#" 	
        		variable="local.file">
        <cfreturn deserializeJSON(local.script)>
    </cffunction>
</cfcomponent>
