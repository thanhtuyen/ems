
vs.company = {
	admin:function(){
		//init date controll
		init_date();
		
		$(".delete").click(function(){
			vs.loadModalWithUrl($(this).attr('href'), 300);
			return false;
		});
	},
	tag:function(){
		var $listTag = $("#listTags");
		var $primaryTag = $("#primaryTags");
		var $secondTag = $("#secondaryTags");
		var companyId = $(".company").attr('tagId');
		
		$('select[name=company_id]').change(function() {
			window.location = vs.urls.homeUrl + '/company/' + $(this).val() + '/tag';
			return false;
		});
		
		var setTagWeight = function (ui, type, value) {
			var linkId = ui.element.attr('tagId'),
			url = vs.urls.homeUrl + '/company/' + companyId + '/tagWeight';
			var options = $.extend({
				type: 'POST',
				url: url,
				data: {id: linkId, value: value},
				success: function(data, status) {
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.responseText);
				}
			}, options || {});
	
			$.ajax(options);
		}
		$('.stars').stars({
			inputType: "select",
			callback: setTagWeight
		});
		
		$('#listTags').sortable({
	        //handle: '.drag-item',
	        cursor: 'move',
	        placeholder: 'placeholder',
	        opacity: 0.3
	    }).disableSelection();
		
		$('#primaryTags').droppable({
			accept: "#listTags li",
			hoverClass: "ui-state-hover",
			drop: function( event, ui ) {
				//prepare new line item
				var oldItem = ui.draggable.clone();
				var span = ui.draggable
					.removeClass()
					.find('span').remove(),
					tagName = span.text(),
					tagId	= ui.draggable.attr('tagId');
				
				ui.draggable.html(vs.params.text.loading).empty()//.appendTo('#primaryTags');
				
				var options = $.extend({
					type: 'POST',
					url: vs.urls.homeUrl + '/company/' + companyId + '/addTag',
					data: {tagId: tagId, tagName: tagName},
					success: function(data, status) {
						ui.draggable.remove();
						var liNew = $('#feedTmpl').tmpl({id: tagId, name: tagName});
						liNew.find('.stars').stars({
							inputType: "select",
							callback: setTagWeight
						});
						liNew.appendTo('#primaryTags');
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						alert(XMLHttpRequest.responseText);
						ui.draggable.remove();
						ui.sender.append(oldItem);
					}
				}, options || {});

				$.ajax(options);
			}
		});
		
		
		$('#primaryTags a.ajaxRemove').die('click').live('click', function() {
			try {
				var self = $(this),
					liParent = self.parents('li');
				
				var 
					tagName = liParent.find('span.tagName').text().trim();
					tagId = liParent.attr('tagId'),
					url = self.attr('href');
				
				if (confirm('Do you want to delete this tag [' + tagName + ']')) {
					var options = $.extend({
						type: 'POST',
						url: url,
						success: function(data, status) {
							$('<li><span class="tagName">' + tagName + '</span></li>').attr('tagId', tagId).appendTo('#listTags');
							self.parents('li:first').remove();
						},
						error: function(XMLHttpRequest, textStatus, errorThrown) {
							alert(XMLHttpRequest.responseText);
						}
					}, options || {});
	
					$.ajax(options);
				}	
			} catch (e) {
				alert(e)
			}
			
			return false;
		});
		
		var remove_icon = "<a href='removeTag' title='Remove Tag' class='ui-icon ui-icon-refresh'>Remove Tag</a>";
		function addTag( $item ) {
			$item.fadeOut(function() {
				var $list = $( "ul", $primaryTag ).length ?
					$( "ul", $primaryTag ) :
					$( "<ul class='listTags ui-helper-reset'/>" ).appendTo( $primaryTag );

				$item.find( "a.ui-icon-trash" ).remove();
				$item.find("span.tagName").addClass('editable_sencondary');
				
				var url = "addTag",
				options = null;
				var tagName = $item.find("span.tagName").text();
				options = $.extend({
					type: 'POST',
					url: url,
					data: {'company_id': companyId, 'tag_name':tagName},
					success: function(data, status) {
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						alert(XMLHttpRequest.responseText);
					}
				}, options || {});

				$.ajax(options);
				$item.append(remove_icon).appendTo($list).fadeIn();
			});
		}
		
		
		function removeTag($item) {
			$item.find("span").removeClass('editable_sencondary');
			$item.fadeOut(function() {
				$item
					.find( "a.ui-icon-refresh" )
						.remove()
					.end()
					.appendTo($listTag)
					.fadeIn();
				var companyId = $(".company").attr('id'),
				url = "removeTag",
				options = null;
				var tagName = $item.find("span.tagName").text();
				options = $.extend({
					type: 'POST',
					url: url,
					data: {'company_id': companyId, 'tag_name':tagName},
					success: function(data, status) {
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						alert(XMLHttpRequest.responseText);
					}
				}, options || {});

				$.ajax(options);
			});
		}

		

		// resolve the icons behavior with event delegation
		$( "ul.listTags > li > a").live('click',function( event ) {
			var $item = $( this ).parent(),
				$target = $( event.target );

			if ( $target.is( "a.ui-icon-trash" ) ) {
				addTag( $item );
			} else if ( $target.is( "a.ui-icon-refresh" ) ) {
				removeTag( $item );
			}

			return false;
		});

		
		
	}
}