$(document).ready(function(){		
	$('.mainslider__slider').slick({
	  infinite: true,
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  arrows: true,
	  dots: true,
	  nextArrow: '.mainslider__arrowright',
		prevArrow: '.mainslider__arrowleft',
		appendDots: '.mainslider__dots'
	});
	
	$('.sertificatslider__slider').slick({
	  infinite: true,
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  arrows: true,
	  dots: false,
	  nextArrow: '.sertificatslider__right',
		prevArrow: '.sertificatslider__left'
	});
	
	
	 $('.slider-for').slick({
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  arrows: false,
	  fade: true,
	  asNavFor: '.slider-nav'
	});
	
	$('.productimg__previews').slick({
	  infinite: true,
	  slidesToShow: 4,
	  slidesToScroll: 1,
	  arrows: true,
	  dots: false,
	   vertical: true,
	    verticalSwiping: true,
		  centerMode: true,
			centerPadding: '60px',
			focusOnSelect: true,
			nextArrow: '.productimg__previewright',
			prevArrow: '.productimg__previewleft'
	});
	
	$('.related__slider').slick({
		  infinite: true,
		  slidesToShow: 4,
		  slidesToScroll: 1,
		  arrows: true,	 
			nextArrow: '.related__right',
			prevArrow: '.related__left',
			 responsive: [
    {
      breakpoint: 1024,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 1,
        infinite: true,
        dots: true
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 1
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }
    // You can unslick at a given breakpoint now by adding:
    // settings: "unslick"
    // instead of a settings object
  ]
	});
	
	 $('.productimg__preview img').on('click',function(){
		$('.productimg__img img').attr('src', $(this).attr('src'));		
		$('.productimg__img a').attr('href', $(this).attr('src'));
		
	})  

	 $('.productimg__previewright').on('click',function(){			
		$('.productimg__img a').attr('href', $('.productimg__preview.slick-slide.slick-current img').attr('src'));
		$('.productimg__img img').attr('src', $('.productimg__preview.slick-slide.slick-current img').attr('src'));		
		
	})  

	 $('.productimg__previewleft').on('click',function(){
		$('.productimg__img a').attr('href', $('.productimg__preview.slick-slide.slick-current img').attr('src'));
		$('.productimg__img img').attr('src', $('.productimg__preview.slick-slide.slick-current img').attr('src'));		
	})  

	$('.step-js').on('click', function() {
		$(this).find('.ordercontent__number').addClass('active');
		
	});
	

});

$(document).ready(function(){

	lightbox.option({
		  'resizeDuration': 200,
		  'fadeDuration': 200,
		  'imageFadeDuration': 200,
		  'resizeDuration': 200,
		  'showImageNumberLabel': false,
		  'wrapAround': true
		});
		
	$('#mobile-menu').click(function() {
		$('.mainmenu').slideToggle();
		});
});



jQuery(function($){
   $("input[name=phone]").mask("+7(999) 999-99-99");
});	


$('[data-toggle="modal"]').on('click', function () {	
	$('input').removeClass('error_input'); 
	$('input[name=phone]').val('');
	$('input[name=email]').val('');
	$('input[name=name]').val('');
	$('.modal input[name=block]').val($(this).attr('data-header'));
});


   
	



$(document).ready(function(){
	
	$('.wrapper1 div').width($('.wrapper2 table').width());
	
   $(function(){
		$(".wrapper1").scroll(function(){
			$(".wrapper2").scrollLeft($(".wrapper1").scrollLeft());
		});
		$(".wrapper2").scroll(function(){
			$(".wrapper1").scrollLeft($(".wrapper2").scrollLeft());
		});
	});
});

		

