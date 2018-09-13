$(function(){
		
	
		$(".btn_search").on("mouseover focus",function(){
	        
	        $(".btn_search2").css("color","#fff");
	        $(".btn_search2").css("opacity","0.7");
	    });
	    
	    
	    $(".btn_search").on("mouseleave",function(){
	        
	        $(".btn_search2").css("color","#fff");
	        $(".btn_search2").css("opacity","1");
	        
	    });

		
	    
	    $(".btn_write").on("mouseover focus",function(){
	        
	        $(".btn_write").css("color","#fff");
	        $(".btn_write").css("opacity","0.5");
	    });
	    
	    
	    $(".btn_write").on("mouseleave",function(){
	        
	        $(".btn_write").css("color","#fff");
	        $(".btn_write").css("opacity","1");
	        
	    });
});	    