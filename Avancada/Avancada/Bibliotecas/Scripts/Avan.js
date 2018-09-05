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
