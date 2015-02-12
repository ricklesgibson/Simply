jQuery(document).ready(function($) {
	$('form.quform').Quform();

	// Tooltip settings
	if ($.isFunction($.fn.qtip)) {
		$('.quform-tooltip').qtip({
			content: {
				text: false
			},
			style: {
				classes: 'qtip-default qtip-shadow quform-tt',
				width: '180px'
			},
			position: {
				my: 'left center',
				at: 'right center'
			}
		});
	}

	// Changes subject to a text field when 'Other' is chosen
	var $subject = $('#subject'),
		$subjectWrapper = $subject.parent(),
		subjectHtml = $subjectWrapper.html();

	$subjectWrapper.delegate('change', '#subject', function () {
		if ($(this).val() == 'Other') {
			$subjectWrapper.html('<input name="subject" type="text" id="subject" value="" />');

			$cancelOther = $('<a>').click(function () {
				$subjectWrapper.html(subjectHtml);
				$(this).remove();
				return false;
			}).attr('href', '#').addClass('quform-cancel-button').attr('title', 'Cancel');

			$subjectWrapper.append($cancelOther);
		}
	});

	// Preload images
	$.preloadImages([
		'quform/images/close.png',
		'quform/images/success.png',
		'quform/images/error.png',
		'quform/images/default-loading.gif'
	]);

	// Preload images for all present themes
}); // End document ready

(function ($) {
	$(window).load(function () {
		// Preload images for any active themes
		if ($('.quform-theme-light-light, .quform-theme-light-rounded').length) {
			$.preloadImages([
         		'quform/themes/light/images/button-active-bg-rep.png',
         		'quform/themes/light/images/close.png',
         		'quform/themes/light/images/input-active-bg-rep.png'
         	]);
		}

		if ($('.quform-theme-dark-dark, .quform-theme-dark-rounded').length) {
			$.preloadImages([
         		'quform/themes/dark/images/button-active-bg-rep.png',
         		'quform/themes/dark/images/close.png',
         		'quform/themes/dark/images/input-active-bg-rep.png',
         		'quform/themes/dark/images/loading.gif'
         	]);
		}

		if ($('.quform-theme-minimal-light').length) {
			$.preloadImages([
         		'quform/themes/minimal/images/close-light.png'
         	]);
		}

		if ($('.quform-theme-minimal-dark').length) {
			$.preloadImages([
         		'quform/themes/minimal/images/close-dark.png',
         		'quform/themes/minimal/images/loading-dark.gif'
         	]);
		}
	});
})(jQuery);