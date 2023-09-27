<cfcomponent rest="true" 
         restpath="/orders" 
         displayname="orders">
    
        <!--- Define what to do with GET /orders/orderID --->
         <cffunction name="getOrderFromId" 
                access="remote" 
                httpmethod="GET" 
                returntype="string" 
                produces="application/json" 
                restpath="{orderId}" >

            <cfargument name="orderId"
                    required="true"
                    restargsource="path" 
                    type="string">


            <!--- What to do (Authenticate/go to DB) --->
            <cftry>
                <!--- CALL AUTH --->
                <cfset local.auth = 
                        trim(getHTTPRequestData().headers.Authorization)>
                <cfset local.checkAuth = checkAuth(credentials=local.auth)>
                <cfif not(local.checkAuth.success)>
                <cfreturn serializeJSON(local.checkAuth)>   
                </cfif>

                <cfset local.result = 
                {"success" : true 
                ,"msg" : "Bienvenido: #local.checkAuth.data.name#"}>

                <!------------------------------------------>
                <cfreturn serializeJSON(local.result)>

                 <cfcatch type="ANY">
                <cfset local.result = 
                 {"success" : false 
                        ,"msg" : cfcatch}>

                <cfreturn serializeJSON(local.result)>

              </cfcatch>
            </cftry>

        </cffunction>


        <!--- Define what to do with PUT /orders/orderID --->
        <cffunction name="updateOrderStatus" 
        access="remote" 
        httpmethod="PUT" 
        returntype="string" 
        produces="application/json" 
        restpath="{orderId}" >

    <cfargument name="orderId"
            required="true"
            restargsource="path" 
            type="string">


    <!--- What to do (Authenticate/go to DB) --->
<cftry>
        <!--- CALL AUTH --->
        <cfset local.auth = 
                trim(getHTTPRequestData().headers.Authorization)>
        <cfset local.checkAuth = checkAuth(credentials=local.auth)>
        <cfif not(local.checkAuth.success)>
             <cfreturn serializeJSON(local.checkAuth)>   
        </cfif>

        <!--- RETURN WHAT WAS INCLUDED IN REQUEST BODY --->
        <cfset local.args = deserializeJSON(toString(getHTTPRequestData().content))>

        <cfset local.result = 
        {"success" : true 
        ,"msg" : "Bienvenido: #local.checkAuth.data.name#"
        ,"data" : local.args}>

        <!------------------------------------------>
        <cfreturn serializeJSON(local.result)>

     <cfcatch type="ANY">
        <cfset local.result = 
         {"success" : false 
                ,"msg" : cfcatch}>

        <cfreturn serializeJSON(local.result)>

    </cfcatch>
</cftry>

</cffunction>

<cffunction name="checkAuth" access="private">
        <cfargument name="credentials">
        
        <cfset local.EncodedCredentials =
                listlast(arguments.credentials," ")> 
        <cfset local.Credentials = 
                toString(toBinary(local.EncodedCredentials))>

        <cfset local.result = 
            {"success" : false 
                  ,"msg" : "Not Auth"
            } >

        <!---- CHECK IN DB WITH CFQUERY --->
        <cfset local.validAuth = {"id" : 1, "pass" : "test", "name" : "JC"}>
        <cfset local.id = listfirst(local.Credentials,":")>
        <cfset local.pass = listlast(local.Credentials,":")>

        <!--- CHECK AUTH --->
        <cfif not((local.id eq validAuth.id) AND (local.pass eq validAuth.pass))>
           <cfset local.result = 
                {"success" : false 
                ,"msg" : "Invalid Login!"}>
            <cfreturn local.result>
        </cfif>

        <cfset local.result = 
        {"success" : true 
        ,"msg" : "OK"
        ,"data" : {"name" : local.validAuth.name}}>

        <cfreturn local.result>
  </cffunction>

</cfcomponent>
