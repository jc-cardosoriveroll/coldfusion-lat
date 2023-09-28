<!--- Parámetros básicos --->
<cfparam name="session.lang" default="SPA">
<cfparam name="action" default="home">
    
<!--- Si la pagina incluye ?lang=XXX, cambiar idioma --->    
<cfif isdefined("url.lang") and listfind("SPA,ENG",url.lang)>
	<cfset session.lang = url.lang>
</cfif>

<html>
    <cfinclude template="head.cfm">
    <!--- Incluir la pagina definida por action --->
    <cfinclude template="#action#.cfm">
    <cfinclude template="scripts">
</html>
