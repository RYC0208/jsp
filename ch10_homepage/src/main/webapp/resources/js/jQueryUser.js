$(()=>{
  // 네비 각각 내려오기
  /*
  $('.nav>li').mouseover(function() {
    $(this).children('.submenu').stop().slideDown();
  });
  $('.nav>li').mouseout(function() {
    $(this).children('.submenu').stop().slideUp();
  });
  */

  // 네비 전체 내려오기
  $('nav').mouseover(function() {
    $('.submenu').stop().slideDown();
  });
  $('nav').mouseout(function() {
    $('.submenu').stop().slideUp();
  });

  // img slide
  let x = $('#imgslide>div')
  setInterval(function() {
    if(x.position().left == -2000) {
      x.animate({left: '-=1000px'},function() {
        x.css('left',0);
      });
    } else {
      x.animate({left: '-=1000px'});
    } 
  }, 2000);
})