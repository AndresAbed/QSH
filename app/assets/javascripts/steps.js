$(document).ready(function(){
  var currLoc = location.href.toLowerCase();
  if (currLoc == "http://localhost:3000/"
    || currLoc == "http://localhost:3000/#"
    || currLoc == "http://www.flyr.com.ar/"
    || currLoc == "http://www.flyr.com.ar/#") {
    var steps = $(".steps");
  	var offset = steps.offset();
  	var $num = $(".numbers");
  	$(this).scroll(function(){
  		if ($(this).scrollTop() > (offset.top)-300) {
  			$num.each(function(i) {
  			  var $el = $(this);
  			  setTimeout(function() {
  			  	$el.css({"opacity":"1"})
  			    $el.addClass('animated fadeInUp');
  			  }, 150 * i);
  			});
        var title = steps.find(".title")
        title.css({"opacity":"1"});
        title.addClass("animated fadeInLeft");
        title.find("i").css({"opacity":"1"});
        title.find("i").addClass("animated fadeInLeft");
  		};
  	});
  };  
})