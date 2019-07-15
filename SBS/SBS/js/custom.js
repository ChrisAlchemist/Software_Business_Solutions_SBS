jQuery(document).ready(function( $ ) {


  // Preloader
  $(window).on('load', function() {
    $('#preloader').delay(100).fadeOut('slow',function(){$(this).remove();});
  });

  // Hero rotating texts
  $("#hero .rotating").Morphext({
    animation: "flipInX",
    separator: ",",
    speed: 3000
  });
  
  // Initiate the wowjs
  new WOW().init();
  
  // Initiate superfish on nav menu
  $('.nav-menu').superfish({
    animation: {opacity:'show'},
    speed: 400
  });
  
  // Mobile Navigation
  if( $('#nav-menu-container').length ) {
      var $mobile_nav = $('#nav-menu-container').clone().prop({ id: 'mobile-nav'});
      $mobile_nav.find('> ul').attr({ 'class' : '', 'id' : '' });
      $('body').append( $mobile_nav );
      $('body').prepend( '<button type="button" id="mobile-nav-toggle"><i class="fa fa-bars"></i></button>' );
      $('body').append( '<div id="mobile-body-overly"></div>' );
      $('#mobile-nav').find('.menu-has-children').prepend('<i class="fa fa-chevron-down"></i>');
      
      $(document).on('click', '.menu-has-children i', function(e){
          $(this).next().toggleClass('menu-item-active');
          $(this).nextAll('ul').eq(0).slideToggle();
          $(this).toggleClass("fa-chevron-up fa-chevron-down");
      });
      
      $(document).on('click', '#mobile-nav-toggle', function(e){
          $('body').toggleClass('mobile-nav-active');
          $('#mobile-nav-toggle i').toggleClass('fa-times fa-bars');
          $('#mobile-body-overly').toggle();
      });
      
      $(document).click(function (e) {
          var container = $("#mobile-nav, #mobile-nav-toggle");
          if (!container.is(e.target) && container.has(e.target).length === 0) {
             if ( $('body').hasClass('mobile-nav-active') ) {
                  $('body').removeClass('mobile-nav-active');
                  $('#mobile-nav-toggle i').toggleClass('fa-times fa-bars');
                  $('#mobile-body-overly').fadeOut();
              }
          }
      });


  } else if ( $("#mobile-nav, #mobile-nav-toggle").length ) {
      $("#mobile-nav, #mobile-nav-toggle").hide();
  }
  
  // Stick the header at top on scroll
  $("#header").sticky({topSpacing:0, zIndex: '50'});

  // Smoth scroll on page hash links
  $('a[href*="#"]:not([href="#"])').on('click', function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
          var target = $(this.hash);
          if (target.length) {
              
              var top_space = 0;
              
              if( $('#header').length ) {
                top_space = $('#header').outerHeight();
              }
              
              $('html, body').animate({
                  scrollTop: target.offset().top - top_space
              }, 1500, 'easeInOutExpo');

              if ( $(this).parents('.nav-menu').length ) {
                $('.nav-menu .menu-active').removeClass('menu-active');
                $(this).closest('li').addClass('menu-active');
              }

              if ( $('body').hasClass('mobile-nav-active') ) {
                  $('body').removeClass('mobile-nav-active');
                  $('#mobile-nav-toggle i').toggleClass('fa-times fa-bars');
                  $('#mobile-body-overly').fadeOut();
              }
              
              return false;
          }
      }
  });
  
  // Back to top button
  $(window).scroll(function() {

      if ($(this).scrollTop() > 100) {
          $('.back-to-top').fadeIn('slow');
      } else {
          $('.back-to-top').fadeOut('slow');
      }
      
  });
  
  $('.back-to-top').click(function(){
      $('html, body').animate({scrollTop : 0},1500, 'easeInOutExpo');
      return false;
  });

});

function mostrarDescripcion(numPortafolio){
  
  switch(numPortafolio){
    case 1:
      $("#imagenesPortafolio").attr("src","img/work/logicZotz/logicZotz4.jpg");
      $("#descripcionPortafolio").text("Video juego desarrollado en el lenguaje java, el cual tiene el objetivo de enseñar las bases de un leguaje de programación a niños de primaria y secundaria de entre 7 y 14 años. Esto claro en compañia del personaje favorito de la famosa serie de anime Dragon Ball.");
    break;
    case 2:
      $("#imagenesPortafolio").attr("src","img/work/cpr_soluciones/cpr_soluciones9.jpg");
      $("#descripcionPortafolio").text("Prototipo web desarrollado en ReactJS y exclusivamente para la empresa deipi, el cual tiene como objetivo ayudar a la administracion y visualizacion de los productos de diferentes categotias y su vez brindar una mejor publicidad de ellos.");
    break;
    case 3:
      $("#imagenesPortafolio").attr("src","img/work/tgz/tgz4.jpg");
      $("#descripcionPortafolio").text("Sitio web desarrollado para un club de gamer, en el cual se pueden enterar de lo ultimo del momento en videojuegos, dar opinion sobre algun videojuego y promocionar algun torneo o evento relacionado con esta area.");
    break;
    case 4:
      $("#imagenesPortafolio").attr("src","img/work/toz/toz4.jpg");
      $("#descripcionPortafolio").text("Sitio web desarrollado para un club de anime, en el cual se pueden enterar de lo ultimo del momento en el mundo del anime, dar opinion sobre su distintas series de este genero, compartir sitios o articulos sobre anime y ver los ultimos capitulos de las series en emisión.");
    break;
    
  } 

    $('#modalDescripcionPortafolio').modal({ fadeDuration: 100 });
  }

//propiedades para el icono de la s apps
if($( window ).width()>=1263){
  $("#service-mobile").css({'width': '16%'});
  $("#icon-mobile").css({'margin-left': '18%'});
  //alert("es: " + $( window ).width());
}
else{
  
 //alert("estilo del icono"); 
 $("#service-mobile").removeAttr("style");
  $("#icon-mobile").removeAttr("style");
}

$(window).resize(function() {
if($( window ).width()>=1263){
  $("#service-mobile").css({'width': '16%'});
  $("#icon-mobile").css({'margin-left': '18%'});
  //alert("es: " + $( window ).width());
}
else{
 //alert("estilo estilo del icono"); 
 $("#service-mobile").removeAttr("style");
  $("#icon-mobile").removeAttr("style");
}
}); 