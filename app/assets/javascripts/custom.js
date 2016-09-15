$(document).ready(function() {
	$('.eventCarousel').slick({
		arrows: false,
		autoplay: false,
		dots: true
	});

    $('.postCarousel').slick({
        arrows: true,
        autoplay: false,
        dots: false
    });
   
    $('#new_invitation').on("ajax:success", function(data, status, xhr) {
        var email=$("#invitation_email").val();
        if (email.length > 3) {
            $(".err").css("display", "none");
            $(this).html('<span class="thankU">Ваша заявка отправлена.<br/> Спасибо!</span>');
        } else $(".err").css("display", "block"); 
    });
    $('#new_invitation').on("ajax:error", function(xhr, status, error) {
        $('#reportalert').text('Failed.');
    });

});

