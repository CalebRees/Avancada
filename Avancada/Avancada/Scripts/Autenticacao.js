$(document).ready(function () {
    $("#status").hide();
    $("#botao-entrar").click(function () {
        $.ajax({
            url: "/Autenticacao/AutenticarUsuario",
            data: { Login: $("#login").val(), Senha: $("#senha").val() },
            dataType: "json",
            type: "POST",
            async: true,
            beforeSend: function () {
                $("#status").html("Autenticando Usuário...");
                $("#status").show();
            },
            success: function (dados) {
                if (dados.OK) {
                    setTimeout(function () { window.location.href = "/Comum" }, 2000);
                } else {
                    $("#status").html(dados.Mensagem);
                    $("#status").show();
                }
            },
            error: function (dados) {
                $("#status").html(dados.Mensagem);
                $("#status").show();
            }
        });
    });

    
});