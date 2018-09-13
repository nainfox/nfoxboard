$(function(){
	
		$(".navbar_list>li>a").on("mouseover focus",function(){
	        
			$(".navbar_list>li").css("background-color","none");
			$(".navbar_list>li>a").css("color","#fff");
	    });
	    
	    
	    $(".navbar_list>li>a").on("mouseleave",function(){
	        
	        $(".navbar_list>li>a").css("color","#9d9d9d");
	        
	    });

});	