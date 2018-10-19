$(document).ready(function () {
    $("#but").click(function () {
        $(".nav-hid-bk").toggleClass("nav-hid-bk2");
        $(".nav-hid").toggleClass("nav-hid2");

    });
    $(".nav-hid-bk").click(function () {
        $(".nav-hid-bk").removeClass("nav-hid-bk2");
        $(".nav-hid").removeClass("nav-hid2");

    });
});

$(document).ready(function () {
    $(".login input").focus(function(){
        $(".trans-lab").toggleClass("trans-lab2");
    });
});
