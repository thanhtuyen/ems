 vs.tag = {
	admin:function(){
	 	$('.addTag').click(function() {
	 		if($('ul.holder').find('li').length <= 1) {
	 			alert("Please enter at least one tag name");
	 			return false;
	 		}
	 		$.ajax({
				type: 'POST',
				url : url,
				success : function(res) {
					self.parent('li').remove();
				}
				,error: function(xhr) {
					tag.text(tagName);
					alert(xhr.responseText);
				}
			});
	 		return false;
	 	});
		$('.smartTextBox-elem-deleteButton').live('click', function() {
			var tag = $(this).parent('li:first').find('span');
			if (confirm('Do you want to delete this tag [' + tag.text() + ']')) {
				var tagName = tag.text();
				tag.html('<img src="' + vs.urls.baseUrl + '/images/indicator.gif"> Deleting...')
				var self = $(this), url = self.attr('href');
				$.ajax({
					type: 'POST',
					url : url,
					success : function(res) {
						self.parent('li').remove();
					}
					,error: function(xhr) {
						tag.text(tagName);
						alert(xhr.responseText);
					}
				});
			}
			return false;
		});

		$(".editable_tag").editable(vs.tag.urls.urlUpdateTag, {
			indicator : '<img src="' + vs.urls.baseUrl + '/images/indicator.gif">',
			submit : 'OK',
			submitdata : function() {
				return {};
			}
			,onsubmit: function() {
				var form = $(this);
				var val = form.find('input').val();
				if (val == null || val.trim().length == 0) {
					alert('You can not update an empty tag');
					return false;
				}
				return true;
			}
			,callback: function(res) {
				if(res){
					eval('var tag = ' + res);
					$(this).text(tag[1]);
				}
			}
			,onerror: function(setting, self, xhr) {
				self.reset();
				alert(xhr.responseText);
			}
			,data: function(value, settings) {
				/* Convert <br> to newline. */
				//var retval = value.replace(/<br[\s\/]?>/gi, '\n');
				var retval = $('<div/>').html(value).text();
				return retval;
		    }
		});

		$("#normal-view").click(function(){
			$("#tagCloud-view").removeClass('active');
			$("#normal-view").addClass('active');
			$("#tagCloud").hide();
			$("#normalView").show();
		})
		$("#tagCloud-view").click(function(){
			$("#tagCloud-view").addClass('active');
			$("#normal-view").removeClass('active');
			$("#normalView").hide().removeClass('select');
			$("#tagCloud").show().addClass('select');
		})

		$("#tagCloud li:odd").find("a").addClass('odd');

		$('select[name=tags]').fcbkcomplete({
			newel: true
		})
	}
}