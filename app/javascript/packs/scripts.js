function recaptchaCallback() {

    $('input[name="recaptcha-clicked"]').val(1);

}

function expiredCallback() {

    $("input[name='recaptcha-clicked']").val("");

}

$(document).ready(function() {

    $("#form").submit(function(event) {

        event.preventDefault();

        var name = $("#form").find("input[name='name']").val();
        var email = $("#form").find("input[name='email']").val();
        var captcha = $("input[name='recaptcha-clicked']").val();

        if (name.length > 0 && email.length > 0 && captcha.length > 0) {

            $("#form").get(0).submit();

        } else {

            $("div#form-alert").css("display","block").find("p").text("* = required / requerido");

            $("html,body").animate({

                scrollTop: ($("div#form-alert").offset().top)

            },500);

        }

    });

    $(".locations").hide();

    $("h3").on("click", function(e) {

        e.preventDefault();

        whichH3 = $(this).index("h3");

        if ($(".locations").eq(whichH3).hasClass("yup")) {


        } else {

            $(".locations").removeClass("yup").hide().eq(whichH3).addClass("yup").fadeIn();

        }

    });


});