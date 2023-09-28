<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>


<!--- SAMPLE 1: GET/URL/LINK --->
    <a href="##" id="link" data-action="" data-name="JC" data-id="1">EJECUTAR</a>
    <div id="result"></div>
    
    <script>
    $("#link").click(function(e){
        e.preventDefault();
        var name = $(this).attr("data-name");
        var id = $(this).attr("data-id");
        $.get("api.cfm?name=" + encodeURI(name) + "&id=" + id,
                function(data,status)
                {
                    var obj = jQuery.parseJSON(data);
                    $("#result").html("<b>tu ID es: " + obj.id + "</b>");
                }
            )
    });
    </script>  

      
<!--- SAMPLE 2: POST/FORM --->
    <form action="api.cfm" method="POST">
        <input name="email" type="text"> 
        <input name="pass" type="text">
        <input type="hidden" name="action" value="login">
        <input type="submit">
    </form>
    <div id="result"></div>  

  <script>
  $("form").submit(function(e){
      e.preventDefault();
      var data = $(this).serialize();
      $.post( "api.cfm", data, function( data ) {
            $( "#result" ).html( data );
      });
   
  })
  </script>      
