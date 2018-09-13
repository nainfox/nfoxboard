$(function(){
	
		$(".btn_cancle").on("mouseover focus",function(){
	        
	        $(".btn_cancle").css("color","#fff");
	        $(".btn_cancle").css("opacity","0.5");
	    });
	    
	    
	    $(".btn_cancle").on("mouseleave",function(){
	        
	        $(".btn_cancle").css("color","#fff");
	        $(".btn_cancle").css("background-color","#c7c7c7");
	        $(".btn_cancle").css("opacity","1");
	        
	    });

	    $(".btn_add").on("mouseover focus",function(){
	        
	        $(".btn_add").css("color","#fff");
	        $(".btn_add").css("opacity","0.5");
	    });
	    
	    
	    $(".btn_add").on("mouseleave",function(){
	        
	        $(".btn_add").css("color","#fff");
	        $(".btn_add").css("background-color","#5bc0de");
	        $(".btn_add").css("opacity","1");
	        
	    });
});	    