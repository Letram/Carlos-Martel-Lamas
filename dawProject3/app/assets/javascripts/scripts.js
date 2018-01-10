$(document).ready(function() {
    //openPhotoSwipe();
	tripsTab = $('#trip-list');
	tripList = tripsTab.find('li');
	degrees = [];
	display = [];
	buttonState = 1;
    tripsTab.find('li').each(function (index) {
		degrees.push(0.125);
		display.push(0);
		icon = $(this).find('.glyphicon-plus');
		icon.click(function () {
			//icon rotates 45deg(0.125turn) or places at the initial position
			$(this).css({'transform' : 'rotate('+ degrees[index] +'turn)'});
			$(this).css({'transition' : 'all 0.25s ease-in-out'});
			if(degrees[index] === 0.125)
				degrees[index] = 0;
			else
				degrees[index] = 0.125;

			//display(1) or hide(0) the description div
			if(display[index] === 0){
				$('#description' + index).show(250);
				display[index] = 1;
			} else{
                $('#description' + index).hide(250);
				display[index] = 0;
			}
        });
	});

	$('#thumbsUpIcon').click(function () {
		var parent = $(this).parent();
		var spanChildren = parent.children('span');
		if($(this).hasClass("not-voted")){
			var thumbsDown = $('#thumbsDownIcon');
			if(thumbsDown.hasClass('voted-down')){
				thumbsDown.removeClass('voted-down').addClass('not-voted');
                thumbsDown.parent().children('span').text(
                	parseInt(thumbsDown.parent().children('span').html())-1
				);
			}
			$(this).removeClass("not-voted").addClass("voted-up");
			spanChildren.text(parseInt(spanChildren.html())+1);
		}else{
            $(this).removeClass("voted-up").addClass("not-voted");
            spanChildren.text(parseInt(spanChildren.html())-1);
		}
    });

	$('#thumbsDownIcon').click(function () {
		var parent = $(this).parent();
		var spanChildren = parent.children('span');
		if($(this).hasClass("not-voted")){
            var thumbsUp = $('#thumbsUpIcon');
            if(thumbsUp.hasClass('voted-up')){
                thumbsUp.removeClass('voted-up').addClass('not-voted');
                thumbsUp.parent().children('span').text(
                    parseInt(thumbsUp.parent().children('span').html())-1
                );
            }
			$(this).removeClass("not-voted").addClass("voted-down");
			spanChildren.text(parseInt(spanChildren.html())+1);
		}else{
            $(this).removeClass("voted-down").addClass("not-voted");
            spanChildren.text(parseInt(spanChildren.html())-1);
		}
    });

    var openPhotoSwipe = function() {
    	console.log("holi");
        var pswpElement = document.querySelectorAll('.pswp')[0];	console.log(pswpElement);
        // build items array
        var itemsCarrousel = [
            {
                src: 'https://farm2.staticflickr.com/1043/5186867718_06b2e9e551_b.jpg',
                w: 500,
                h: 300
            },
            {
                src: 'https://farm7.staticflickr.com/6175/6176698785_7dee72237e_b.jpg',
                w: 500,
                h: 300
            }
        ];
        var ajax= new XMLHttpRequest();
    	ajax.onreadystatechange=function(){
	        if(this.readyState== 4 && this.status == 200) {
	            var res = JSON.parse(this.responseText);
	            for (var i = 0; i < res.length; i++) {
	        		console.log(res[i]);
	        		var source = res[i].src;
					var imageHeight = res[i].h;
					var imageWidth = res[i].w;
					itemsCarrousel.push({
						src: source,
						w: imageWidth,
						h: imageHeight
					});
	        	}
	        }
    	};
	    ajax.open("get","get_photos.php",false);
		ajax.send();
        /*
		var flickr = "http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?";
		$.getJSON(flickr, {
			tags: "Canarias, Canteras",
			tagmode: "all",
			format: "json"
		})
			.done(function(data){
				$.each(data.items, function(i, item){
					var source = item.media.m;
					var imageHeight = 300;
					var imageWidth = 500;
					itemsCarrousel.push({
						src: source,
						w: imageWidth,
						h: imageHeight
					});
				})
			})
			.fail(function(error){
				console.log("Fallo en el ajax", error);
			});
		*/
        var options = {
            history: false,
            focus: false,
            showAnimationDuration: 0,
            hideAnimationDuration: 0
        };
        var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, itemsCarrousel, options);
        gallery.init();
    };
	$(".photoGallery").click(openPhotoSwipe);

});
function showMoreFriends() {
	moreFriends = $('#moreFriends');
	button = $('#moreFriendsButton');
        //More = 1 , Less = 0
	if(buttonState === 1){
		button.html("Less");
		buttonState = 0;
	}else{
		button.html("More");
		buttonState = 1;
	}
		//we show a div with more friends
	if(moreFriends.css('display') === 'none')
		moreFriends.show(250);
	else
		moreFriends.hide(250);
}
