/* Author: Jonathan Simcoe, Kirk Strobeck, et al. */

$(document).ready(function() {

	$(window).scroll(function() {
	  if ($(window).scrollTop() >= 300) {
	  	 $('.logo').fadeIn();
	  }
	  if ($(window).scrollTop() <= 200) {
	  	$('.logo').fadeOut();
	  };
	});
	
});