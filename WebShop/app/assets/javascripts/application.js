// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

(function($) {

  $.fn.menumaker = function(options) {
      
      var cssmenu = $(this), settings = $.extend({
        title: "Menu",
        format: "dropdown",
        sticky: false
      }, options);

      return this.each(function() {
        cssmenu.prepend('<div id="menu-button">' + settings.title + '</div>');
        $(this).find("#menu-button").on('click', function(){
          $(this).toggleClass('menu-opened');
          var mainmenu = $(this).next('ul');
          if (mainmenu.hasClass('open')) { 
            mainmenu.hide().removeClass('open');
          }
          else {
            mainmenu.show().addClass('open');
            if (settings.format === "dropdown") {
              mainmenu.find('ul').show();
            }
          }
        });

        cssmenu.find('li ul').parent().addClass('has-sub');

        multiTg = function() {
          cssmenu.find(".has-sub").prepend('<span class="submenu-button"></span>');
          cssmenu.find('.submenu-button').on('click', function() {
            $(this).toggleClass('submenu-opened');
            if ($(this).siblings('ul').hasClass('open')) {
              $(this).siblings('ul').removeClass('open').hide();
            }
            else {
              $(this).siblings('ul').addClass('open').show();
            }
          });
        };

        if (settings.format === 'multitoggle') multiTg();
        else cssmenu.addClass('dropdown');

        if (settings.sticky === true) cssmenu.css('position', 'fixed');

        resizeFix = function() {
          if ($( window ).width() > 768) {
            cssmenu.find('ul').show();
          }

          if ($(window).width() <= 768) {
            cssmenu.find('ul').hide().removeClass('open');
          }
        };
        resizeFix();
        return $(window).on('resize', resizeFix);

      });
  };
})(jQuery);

(function($){
$(document).ready(function(){

$("#cssmenu").menumaker({
   title: "Menu",
   format: "multitoggle"
});

});
})(jQuery);
