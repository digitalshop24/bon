$(document).ready(function() {
	$('.eventCarousel').slick({
		arrows: false,
		autoplay: false,
		dots: false
	});

    $('.postCarousel').on('setPosition', function(event, slick, direction){
        var width = $(this).find(".slick-slide").first().width();
        $(this).find(".slick-slide").height(width/4);
    });

    $('.postCarousel').slick({
        arrows: true,
        autoplay: false,
        dots: false,
        responsive: [
            {
              breakpoint: 768,
              settings: {
                arrows:false,
                dots:true
              }
            }
        ]
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
    if (isSafari()) {
        $('.aboutParth').css("height","auto");
    }
    $('#new_invitation')
    function isSafari() {
        return /^((?!chrome).)*safari/i.test(navigator.userAgent);
    }
    

});

