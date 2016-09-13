$(document).ready(function() {
	$('.eventCarousel').slick({
		arrows: false,
		autoplay: true,
		dots: true
	});

    $('.postCarousel').slick({
        arrows: false,
        autoplay: true,
        dots: true
    });

    $('#new_invitation').on("ajax:success", function(data, status, xhr) {
        // $(this).text('<span>Ваша заявка отправлена. Спасибо!</span>');
        $(this).html('<span class="thankU">Ваша заявка отправлена.<br/> Спасибо!</span>');
    });
    $('#new_invitation').on("ajax:error", function(xhr, status, error) {
        $('#reportalert').text('Failed.');
    });

});

