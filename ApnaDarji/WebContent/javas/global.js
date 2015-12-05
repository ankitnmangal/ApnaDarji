

var sideMenuPos =1;
var howItWorksPos= 9;

$(function() {
	ChangeImage();
	StartHowItWorks();
	$('.linker-box-li').mouseenter(function(){
		$(this).children('#linker-details').slideDown(200);
		$(this).find('#box-purpose-name').animate({
													left : '50px',
													}, 100);
	 });
	$('.linker-box-li').mouseleave(function(){
		$(this).children('#linker-details').slideUp(200);
		$(this).find('#box-purpose-name').animate({left : '0px',}, 100);
	 });
	
	$(".how-it-works-img-inline-div").click(function(){
		$(this).siblings().children('#how-it-works-text').hide();
	    $(this).children('#how-it-works-text').show();
	     howItWorksPos = ($(this).index() - 1 )*20 + 9;
//	    alert(idx);
	     
//	    alert(howItWorksPos);
	    $('.arrow img').animate({ left : ""+(howItWorksPos)+"%"}, 200);
	    setTimeout(function(){}, 4000);
	}); 
	
	$('.que').click(function(){
		if($(this).children('img').attr('class') == 'img-clicked')
		{
			$(this).parent('.que-ans').children('.ans').slideToggle(500);
			$(this).children('img').toggleClass('img-clicked');
		}
		else
		{
			$('.ans').slideUp(500);
			$('img').removeClass('img-clicked');
			$(this).parent('.que-ans').children('.ans').slideToggle(500);
			$(this).children('img').toggleClass('img-clicked');
		}
		
		
	});
});


// this function swipe side menu on click event of menu button.
function showSideMenu(){
	$('#side-menu').animate({
		'left' : '+=' + 400*sideMenuPos + 'px',
	}, 200);
	sideMenuPos = sideMenuPos*-1;
}

// This function changes image after given seconds of slider box on landing page
function ChangeImage(){
	var header = $('#slider');

	var backgrounds = new Array('url(resources/model1.jpg)',
			 'url(resources/model2.jpg)',
			'url(resources/model3.jpg)');

	var current = 0;

	function nextBackground() {
		current++;
		current = current % backgrounds.length;
		header.css('background-image', backgrounds[current]);
	}
	setInterval(nextBackground, 3000);

	header.css('background-image', backgrounds[0]);
}

function StartHowItWorks(){
	howItWorksPos = 9;
//	alert();
	Swipe();
	function Swipe(){
//						alert("swipe");
	    				$('.arrow img').animate({ left : ""+howItWorksPos+"%"}, 200);
	    				$(".how-it-works-img-inline-div").children('#how-it-works-text').hide();
	    			    $("#how-it-works-img-inline-div" + (((howItWorksPos -9) /20 )+1)+"").children('#how-it-works-text').show();
	    				if(howItWorksPos == 89){
	    			    	howItWorksPos = -11;
	    			    }
	    				howItWorksPos = howItWorksPos + 20;
	    			}
	
    setInterval(Swipe, 5000);
}










