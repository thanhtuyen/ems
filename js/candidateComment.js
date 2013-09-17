vs.candidateComment = {
	index: function() {
		$(":input[type=textarea]").counter({
		    goal: 400,
		    count: 'up'           
		});
		$('div.candidateComments form').each(function(i, fr) {
			var f = $(fr);
			var binded = f.data('bind_event');
			if (binded != undefined && binded != null && binded > 0) {
				return;
			}
			f.data('bind_event', 1);
			f.submit(function(e) {
				if($.trim(f.find('textarea').val())==0) {
					alert("Please enter a comment");
					return false;
				}
				var $this = $(this);
				e.preventDefault();
				$.ajax( {
					url : $this.attr('action'),
					type: 'post',
					data : $this.serialize(),
					success : function(res) {
						var notes = f.parents('.candidateComments:first').find('ul');
						$(res).hide().prependTo(notes).fadeIn(1500);
						vs.clearForm(f);
						notes.find('> span').fadeOut(400, function() {
							$(this).remove();
						});
					}
				});
				return false;
			})
		});
	}
}