jQuery(function($){
     var arquivo = $("#arquivo");
     $("#span_name").text('Selecione o arquivo...');
     arquivo.change(function(){
        $("#span_name").text(arquivo.val());
     });
     var arquivo_new = $("#arquivo_arquivo");
     $("#span_name").text('Selecione o arquivo...');
     arquivo_new.change(function(){
        $("#span_name").text(arquivo_new.val());
     });


    $("#chamado_sistema_id").change(function(){
       var sistema_id = this.value;
       if (sistema_id == null || sistema_id == ''){
          sistema_id = 0;
       }
       $.ajax({ 
               url: "/chamados/get_tipo_chamado/" + sistema_id,
               context: document.body, 
               success: function(){
               }
       });
    });
});
