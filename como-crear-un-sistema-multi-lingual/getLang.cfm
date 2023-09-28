<cffunction name="getLang">
	<cfargument name="field">    
    <cftry>
    <cfreturn 
        evaluate("Application.lang." & session.lang & "." & arguments.field)>
        <cfcatch>
        	<cfreturn arguments.field & "*">
        </cfcatch>
    </cftry>
</cffunction>
