$(function(){
	
		$(".btn_list").on("mouseover focus",function(){
	        
			$(".btn_list").css("color","#fff");
	        $(".btn_list").css("opacity","0.6");
	    });
	    
	    
	    $(".btn_list").on("mouseleave",function(){
	        
	        $(".btn_list").css("color","#fff");
	        $(".btn_list").css("background-color","#5bc0de");
	        $(".btn_list").css("opacity","1");
	        
	    });

});	