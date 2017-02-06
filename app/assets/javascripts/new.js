$(document).ready(function() {
  $('.burger[data-menu="sidebar"]').on('click tap', function(e){
    e.preventDefault();
    $('.sidebar.menu').sidebar('setting',{ transition:'overlay' }).sidebar('toggle');
  });

  $('.editable').on('click', '.new,.edit', function(e){
    e.preventDefault();
    $(this).parents('.manage-wrapper').find('form').toggle();
  })

  // $('.vk_share_button').html(VK.Share.button(false, {type: 'custom', text: "<img src=\"<%= asset_path('simb/vk.png') %>\" />"}));

  function windowPopup(url, width, height) {
	  // Calculate the position of the popup so
	  // it’s centered on the screen.
	  var left = (screen.width / 2) - (width / 2) - 70,
	      top = (screen.height / 2) - (height / 2) - 70;

	  window.open(
	    url,
	    "",
	    "menubar=no,toolbar=no,resizable=yes,scrollbars=yes,width=" + width + ",height=" + height + ",top=" + top + ",left=" + left
	  );
	}

	$(".js-social-share").on("click", function(e) {
	  e.preventDefault();

	  var urlParamName = $(this).data('urlParamName') || 'url';
	  windowPopup($(this).attr("href") + "?" + urlParamName + "=" + window.location.href, 500, 300);
	});

});
