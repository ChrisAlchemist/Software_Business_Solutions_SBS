(function ($) {
	
		var slider = $('.bxslider').bxSlider({
  mode: 'horizontal'
});

$('#reload-slider').click(function(e){
  e.preventDefault();
  slider.reloadSlider({
    mode: 'fade',
    auto: true,
    pause: 1000,
    speed: 500
  });
});

        $(window).scroll(function(){
    		if ($(this).scrollTop() > 100) {
    			$('.scrollup').fadeIn();
			 }
            
            else 
            {
				$('.scrollup').fadeOut();
			}

            if($(this).scrollTop()> 80)
            {
                $('.logo').css({ 'height':'5em', 
                    'margin-top':'-2.1em',
                    '-webkit-transition': 'all .2s ease-in-out',
                    '-moz-transition': 'all .2s ease-in-out',
                    '-o-transition': 'all .2s ease-in-out',
                    '-ms-transition': 'all .2s ease-in-out' 
                });

                $('#menu').css({
                    'opacity': '0.8'
                });

                //$("html, .logo").animate({ height: '5em'},{margin-top:'-2.1em'}, 1000);

            }
            else
            {
                $('.logo').css({ 'height':'4em',
                    'margin-top':'-1.7em',
                    '-webkit-transition': 'all .2s ease-in-out',
                    '-moz-transition': 'all .2s ease-in-out',
                    '-o-transition': 'all .2s ease-in-out',
                    '-ms-transition': 'all .2s ease-in-out'
                  });

                $('#menu').css({
                    'opacity': '1'
                });

                //$("html, .logo").animate({ height: '4em'},{margin-top:'-1.7em'}, 1000);
            }


		});
		$('.scrollup').click(function(){
			$("html, body").animate({ scrollTop: 0 }, 1000);
				return false;
		});
		
	 wow = new WOW({}).init();
     
    //Google Map
    var get_latitude = $('#google-map').data('latitude');
    var get_longitude = $('#google-map').data('longitude');

    function initialize_google_map() {
        var myLatlng = new google.maps.LatLng(get_latitude, get_longitude);
        var mapOptions = {
            zoom: 14,
            scrollwheel: false,
            center: myLatlng
        };
        var map = new google.maps.Map(document.getElementById('google-map'), mapOptions);
        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map
        });
    }
    google.maps.event.addDomListener(window, 'load', initialize_google_map);
		
})(jQuery);



