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

function func(a) {
    a = "#" + a;
    $(a).next().toggleClass("trans-lab2");
    if ($(a).val()==="") {
        $(a).prev().toggleClass("lab-foc");
    }
}