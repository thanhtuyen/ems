vs.submitted = {
		
	approvingStep1: function() {
		$(":input[type=textarea]").counter({
		    goal: 400,
		    count: 'up'           
		});
		$(".options :input[type=submit]").click(function() {
			var textarea = $(this).parent().parent().parent().find(":input[type=textarea]");
			if($.trim(textarea.val()) == 0) {
				alert("Please enter a message in message box");
				$("#DecisionForm_comment").focus();
				//textarea.val('');
				return false;
			};
		});
		$("select[name=feedback]").change(function() {
			$(this).parents("fieldset").find("textarea").val(this.value);
			$(":input[type=textarea]").focus();
		});
		$('ul.tabs').tabs('div.panes > div');
		$('select[name=to]').fcbkcomplete({
            json_url: vs.urls.homeUrl + '/user/listEmail',
            firstselected: true,
            addontab: true,
            cache: true,
            newel: true,
            height: 5
        });
		$('select[name=cc]').fcbkcomplete({
			json_url: vs.urls.homeUrl + '/user/listEmail',
			addontab: true,
			cache: true,
			newel: true,
			height: 5
		});
		$('.ajaxApproving .ajaxClose').click(function() {
			vs.closeModal();
		});
		
		$("#frmReject").submit(function(){
			var action=$(this).attr('action');
			var data=$(this).serialize();
			vs.openLoadingModal();
			$.post(
				action,
				data,
				function(res){
					if ($("#freshmeat-list") != null) {
						$.fn.yiiListView.update('freshmeat-list');						
					}
					vs.closeModal();
				}
			);
			return false;
		});
	}	
}