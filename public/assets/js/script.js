// Preloader //

jQuery(document).ready(function($) {

$(window).load(function(){
  $('#preloader').fadeOut('slow',function(){$(this).remove();});
});

});


// Closes the sidebar menu
$("#menu-close").click(function(e) {
    e.preventDefault();
    $("#sidebar-wrapper").toggleClass("active");
});

// Opens the sidebar menu
$("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#sidebar-wrapper").toggleClass("active");
});

// Scrolls to the selected menu item on the page
$(function() {
    $('a[href*=#]:not([href=#])').click(function() {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {

            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html,body').animate({
                    scrollTop: target.offset().top
                }, 1000);
                return false;
            }
        }
    });
});

// wow

new WOW().init();

// carousel

$(document).ready(function() {

  var owl = $("#screenshots");

  owl.owlCarousel({
    autoPlay: false,
    pagination: false,
    stopOnHover: true,
  });

  // Custom Navigation Events
  $(".next").click(function(){
    owl.trigger('owl.next');
  })
  $(".prev").click(function(){
    owl.trigger('owl.prev');
  })

});

// Testimonial

$(document).ready(function() {

  $("#review").owlCarousel({

      slideSpeed : 300,
      paginationSpeed : 400,
      singleItem:true,


      // "singleItem:true" is a shortcut for:
      // items : 1,
      // itemsDesktop : false,
      // itemsDesktopSmall : false,
      // itemsTablet: false,
      // itemsMobile : false

  });

});

//モーダルを作りたい.hoverでクリックできることを表したい
$('.img_res').click(function(){

})


//YOUTUBEランダム再生機能
// $('#YOUTUBE').ready(function() {

// var videos = [
//   //srcの部分を変えるロジックを作る
// 'pRpvdcjkT3k',
// 'Te4wx4jtiEA',
// 'efTj6UYzvk4'
// ];
//プロゲートでsrcの部分を変えるjQueryを探す
// var index=Math.floor(Math.random() * videos.length);
// // var html='<div id="video"><h3>Random Video</h3><iframe width="720" height="480"   src="http://www.youtube.com/embed/' + videos[index] + '&autoplay=1" frameborder="0" allowfullscreen></iframe></div>';
// var html='http://www.youtube.com/embed/' + videos[index];
// $('#YOUTUBE.iframe').attr('src','html');
// // $('#YOUTUBE').write(html);
//
// });

// Set Header Background

$(window).scroll(function(){
  var sticky = $('.sticky'),
      scroll = $(window).scrollTop();

  if (scroll >= 100) sticky.addClass('fixed');
  else sticky.removeClass('fixed');
});

// Team overlay

// $(document).ready(function(){
//   $(".img-overlay").hover(function(){
//     $(".overlay").toggleClass("overlay_hover");
//   });

// });
