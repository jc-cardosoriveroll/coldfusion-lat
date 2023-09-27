<!-------------------------------->
<!--- INICIALIZAR COMPONENTE ----->
<!-------------------------------->
<cfcomponent restpath="/ordenes" 
                 rest="true" 
          displayname="orders">

    <!--------------------------------->
    <!--- FX PARA TRAER ORDEN DE ID --->
    <!--------------------------------->    
    <cffunction name="getOrderFromId" 
              access="remote" 
          httpMethod="GET" 
          returntype="string" 
            produces="application/json"    
            restpath="{amazonOrderId}">
        
        <!--------------------------------->
        <!---- DEFINE LOS ARGUMENTOS ------>
        <!--------------------------------->        
        <cfargument name="amazonOrderId" 
                required="true" 
           restargsource="Path" 
                    type="string">

          <!------------------------------------>
          <!-- AQUI VA LA LOGICA (PENDIENTE) --->
          <!------------------------------------>
          <cfset local.result = 
              {"success" : true, "msg" : "Felicidades!"}>


          <!---------------------------------->
          <!------- REGRESAR DATA JSON  ------>
          <!---------------------------------->
          <cfreturn serializeJSON(local.result)>

    </cffunction>
</cfcomponent>
