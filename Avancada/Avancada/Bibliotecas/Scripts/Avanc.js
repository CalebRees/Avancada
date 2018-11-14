$(document).ready(function () {
    $("#but").click(function () {
        $(".nav-hid-bk").toggleClass("nav-hid-bk2");
        $(".nav-hid").toggleClass("nav-hid2");

    });
    $(".nav-hid-bk").click(function () {
        $(".nav-hid-bk").removeClass("nav-hid-bk2");
        $(".nav-hid").removeClass("nav-hid2");

    });
    $("input").focus(function () {
        $(this).next().toggleClass("trans-lab2");
        if ($(this).val() === "") {
            $(this).prev().toggleClass("lab-foc");
        }
    });
    $("input").blur(function () {
        $(this).next().toggleClass("trans-lab2");
        if ($(this).val() === "") {
            $(this).prev().toggleClass("lab-foc");
        }
    });
    $("#botao-sair").click(function () {
        $.ajax({
            url: "/Autenticacao/DesautenticarUsuario",
            dataType: "json",
            type: "POST",
            async: true,
            success: function (dados) {
                if (dados.OK)
                    window.location.href = "/Comum/Index";
            }
        });
    });
});

