<!--- ALL THE BACKEND LOGIC --->
<!--- EXAMPLE: ASYNC LINKS --->
    <cfparam name="id" default="3">
    <cfparam name="name" default="Atlas">
    <cfparam name="msg" default="Hola!">
    <cfset id = randrange(1000,9000)>
    <cfset obj = {"id"=id,"name"=name,"msg"=msg}>
    <cfoutput>#serializeJSON(obj)#</cfoutput>

  
<!--- EXAMPLE: ASYNC FORMS/ORCHESTRATOR --->
  <cfset result = {"success" : true, "msg" : "Hola!"}>
  <cfparam name="action" default="">
  <cfswitch expression="#action#">
      <cfcase value="login">
          <cfset result = Application.security.doLogin(form)>
      </cfcase>
      <cfcase value="register">
          <cfset result = Application.security.doRegister(form)>
      </cfcase>
  </cfswitch>
  <cfoutput>#serializeJSON(result)#</cfoutput>  
