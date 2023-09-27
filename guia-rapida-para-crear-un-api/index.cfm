<!--- Este archivo es para probar el API --->
<!--- Recuerda:
        1) Poner la ruta correcta del API en el cfhttp de este archivo
        2) Actualizar ORDERS.cfc con la logica de API que quieres 
        3) Actualizar Application.cfc con las variables/paths correspondientes
        4) Registrar tu carpeta de APIS en el ADMIN de CF
        5) Inicializar las APIS con index.cfm?init
  --->

  <cfhttp url="http://127.0.0.1:8500/APIS/ordenes/id123" method="GET" />
  <cfdump var="#cfhttp#">
