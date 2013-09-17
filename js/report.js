vs.report = {
	
	/*actionAccept: function() {
		$('.accept').live('click', function() {
			var me = $(this),
				form = me.parents('form');
			
			$.ajax({
			   type: "POST",
			   url: form.attr('action'),
			   data: form.serialize(),
			   success: function(msg){
					//me.parents('li').fadeOut(1000);
					//me.parents('li').fadeOut(500).delay(500).fadeIn(500);
			   }
			 });
			return false;
		})
	}*/
	index: function(){
		$('.ajaxAccept').live('click', function() { 
			var me = $(this).parents('li');
			//alert(me);
			
		})
	},	
	/*decline: function(){
		$('.ajaxDecline').click(function() { 
			alert("adsvqwe");
		})	
	}*/
}