<!--- Parámetros básicos --->
<cfparam name="session.lang" default="SPA">
<cfparam name="action" default="home">
    
<!--- Si la pagina incluye ?lang=XXX, cambiar idioma --->    
<cfif isdefined("url.lang") and listfind("SPA,ENG",url.lang)>
	<cfset session.lang = url.lang>
</cfif>



<!--- Traer el struct con el idioma, las etiquetas --->
<cftry>
	<cfset variables.lang = evaluate("Application.lang." & session.lang)>
    <cfcatch>
    	<cfset variables.lang = evaluate("Application.lang.SPA")>
    </cfcatch>
</cftry>


<!--- UDF para regresar la variable --->
<cffunction name="gLang"> 
    <cfargument name="texto">
    <cftry>
        <cfreturn lang[arguments.texto]>
        <cfcatch>
            <cfreturn arguments.texto & "*">
        </cfcatch>
    </cftry>
</cffunction>


<html>
    <!--- Incluir la pagina definida por action --->
    <cfinclude template="#action#.cfm">
</html>
