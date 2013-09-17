vs.package = {
	admin:function(){
		init_date();
		$(".acceptedPackage, .rejectedPackage").click(function(){
			var action = $(this).attr('action');
			if(confirm('Are you sure you want to ' + action + ' this package?')) {
				var pId = $(this).parent().attr('pid');
				var redirectURL = $(this).attr('href');
				$.ajax({
					url : 'changeStatus',
					type: 'POST',
					data: {'status':action=='accept'? '1':'2', 'pId':pId},
					success : function(res) {
						window.location.href = redirectURL;
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						alert(XMLHttpRequest.responseText);
					}
				});
			} 
			return false;
		});
	},
	view:function(){
		$('input[name=submitPackage]').click(function() {
			window.location = $(this).attr('title');
		});
		$(".vmap").click(function(){
			$("#player-"+$(this).attr('pId')).hide();
			$("#gmap-"+$(this).attr('pId')).show();
			var map = $(this).attr('rel'),
			lat = $(this).attr('lat'),
			long = $(this).attr('lon');
			$("#"+map).show().attr('background','none');
			if(lat!=' -- ' && long!=' -- '){
				var position = new google.maps.LatLng(lat, long); 
				$("#"+map).gmap3(
						{
						    action: ':addMarker',
						    latLng: position,
						    map:{
						      center: true,
						      zoom: 8
						    },
						    marker:{
						      options:{
						        draggable: true
						      }
						    }
						  },
						  {action: 'setOptions', args:[{scrollwheel:true}]}

			    );
			}
			return false;
		})
		$(".vvideo").click(function(){
			$("#player-"+$(this).attr('pId')).show();
			$("#gmap-"+$(this).attr('pId')).hide();
			return false;
		})
		$(".btnAccept").click(function(){
			var url = $(this).attr('url'),
				self= $(this);
			//vs.openLoadingModal();
			self.html('<img src="' + vs.urls.baseUrl + '/images/indicator.gif">Processing...')
			$.ajax( {
				url : url,
				type: 'post',
				success : function(res) {
					self.remove();
				}
			});
			return false;
		})
		
		$(".btnReject").click(function(){
			var url = $(this).attr('url'),
				packId = $(this).attr('pId'),
				self= $(this);
			
			//vs.openLoadingModal();
			self.html('<img src="' + vs.urls.baseUrl + '/images/indicator.gif">Processing...')
			$.ajax( {
				url : url,
				type: 'post',
				success : function(res) {
					$(".ajaxResult").remove();
					$("#" + packId).remove();
			}
			});
			return false;
		})
		$(".archive").click(function(){
			
			vs.openLoadingModal();
			var $this = $(this),
			button = $this.data('button');
			$.ajax( {
				url : $this.attr('href'),
				type: 'post',
				success : function(res) {
					vs.loadModal(res);
				}
			});
			
			return false;
		});
		
		$(".dnc").click(function(){
			
			vs.openLoadingModal();
			var $this = $(this),
			button = $this.data('button');
			$.ajax( {
				url : $this.attr('href'),
				type: 'post',
				success : function(res) {
					vs.loadModal(res);
				}
			});
			
			return false;
		});
	},
	/**
	 * This function is to handle click event of the button "Request formatted CV" on package/update page
	 * @param string url The url to submit to
	 */
	_requestFormattedCvClick: function(url){
		vs.openLoadingModal();
		var $this = $(this);		
		$.ajax( {
			url : url,
			type: 'get',
			success : function(res) {
				vs.loadModal(res);
			}
		});
		
		return false;
	},
	update:function(){		
		$("select[name=help], select[name=helpDegree]").change(function(){
            var $this = $(this).parents("dd");
            return !$this.find("input").attr("value", this.value);
        });
		
		$(".add").click(function(){
            var clone = $(this).parents("fieldset").find(".vevent:first").clone(true);
            clone.clear().prepend('<a class="remove" href="#" title="Remove this">Remove</a>');
            return !$(this).parents("p").prev().append(clone);
        });
		
		$(".remove").live("click", function(){
            return !$(this).parents(".vevent").fadeOut(200, function(){
                $(this).remove();
            });
        });
		
		$(".sort").sortable();
		
		$('#tags').fcbkcomplete({
			cache:1,
			json_url: vs.urls.homeUrl + '/tag/json'
		});
		
		$('#package-form').validate({
			rules: {
				'PAddress[p_address_homephone]': {
					digits:true,
					minlength:6,
					maxlength:10
			    },
			    'PAddress[p_address_mobile]':{
			    	digits:true,
			    	minlength:6,
					maxlength:10
			    }
	  		}
		});
		
		$("input.formatted-cv").mousedown(function(e) {
            if ($(this).attr("checked") == true) {
               setTimeout("$('input[id=" + $(this).attr('id') + "]').removeAttr('checked');", 200);}
            else {
                return true
            }
        });
	
		$(".editable_company_add").editable(vs.package.urls.urlAddClientShareFN, {
			indicator : '<img src="' + vs.package.urls.baseURL + '/images/indicator.gif">',
			data : vs.package.assignedClients,
			type : "select",
			submit : "OK",
			style : "inherit",
			submitdata : function() {
				return {};
			}
			,callback: function(res) {
				var self = $(this),
					li = self.parents('li.smartTextBox-elem');
					li.removeClass('button-add');
					ul = li.parent();
				
					eval('var user = ' + res);
					
					clone = li.clone();
					clone.find('.editable_company_add').editable(vs.package.urls.urlAddClientShareFN, {
						indicator : '<img src="' + vs.package.urls.baseURL + '/images/indicator.gif">',
						data : vs.package.assignedClients,
						type : "select",
						submit : "OK",
						style : "inherit",
						submitdata : function() {
							return {};
						}
						,callback: function(res) {
							eval('var user = ' + res);
							$(this).text(user[1]);
						}
						,onerror: function(setting, self, xhr) {
							self.reset();
							alert(xhr.responseText);
						}
					});
					clone.find('a:hidden')
							.show()
							.attr('href', li.find('a').attr('href') + user[0])
						.end()
						.find('.editable_company_add')
							.removeClass('editable_company_add')
						.end()
						.find('strong').text(user[1]);
					var id = clone.find('.editable_clients').attr('id') + user[0];
					clone.find('.editable_clients').attr('id', id);
					clone.insertBefore(li);
					li.find('.editable_company_add').text('').append('<img src="../../../images/add.png" title="Add new Company" />');
					li.addClass('button-add');
				
			}
			,onerror: function(setting, self, xhr) {
				self.reset();
				alert(xhr.responseText);
			}
		});
		
		$('.smartTextBox-elem-deleteButton').live('click', function() {
			var self = $(this), url = self.attr('href');
			$.ajax({
				url : url,
				success : function(res) {
					self.parent('li').remove();
				}
			});
			return false;
		});
		
		
		$(".editable_company_add_rate").editable(vs.package.urls.urlAddClientShareRate, {
			indicator : '<img src="' + vs.package.urls.baseURL + '/images/indicator.gif">',
			data : vs.package.assignedClients,
			type : "select",
			submit : "OK",
			style : "inherit",
			submitdata : function() {
			return {};
		}
		,callback: function(res) {
			var self = $(this),
			li = self.parents('li.smartTextBox-elem');
			li.removeClass('button-add');
			ul = li.parent();
			
			eval('var user = ' + res);
			
			clone = li.clone();
			clone.find('.editable_company_add_rate').editable(vs.package.urls.urlAddClientShareRate, {
				indicator : '<img src="' + vs.package.urls.baseURL + '/images/indicator.gif">',
				data : vs.package.assignedClients,
				type : "select",
				submit : "OK",
				style : "inherit",
				submitdata : function() {
				return {};
			}
			,callback: function(res) {
				eval('var user = ' + res);
				$(this).text(user[1]);
			}
			,onerror: function(setting, self, xhr) {
				self.reset();
				alert(xhr.responseText);
			}
			});
			clone.find('a:hidden')
			.show()
			.attr('href', li.find('a').attr('href') + user[0])
			.end()
			.find('.editable_company_add_rate')
			.removeClass('editable_company_add_rate')
			.end()
			.find('strong').text(user[1]);
			var id = clone.find('.editable_clients').attr('id') + user[0];
			clone.find('.editable_clients').attr('id', id);
			clone.insertBefore(li);
			li.find('.editable_company_add_rate').text('').append('<img src="../../../images/add.png" title="Add new Company" />');
			li.addClass('button-add');
			
		}
		,onerror: function(setting, self, xhr) {
			self.reset();
			alert(xhr.responseText);
		}
		});		
	}
	,tags:function(){
		var $listTag = $("#listTags");
		var $primaryTag = $("#primaryTags");
		var $secondTag = $("#secondaryTags");
		var companyId = $(".company").attr('tagId');
		
		var setTagWeight = function (ui, type, value) {
			var linkId = ui.element.attr('tagId'),
				url = vs.urls.homeUrl + '/package/' + companyId + '/tagWeight';
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
			$(':ui-stars-cancel a').attr('title','Restart tag weight');
		}
		$('.stars').stars({
			inputType: "select",
			callback: setTagWeight
		});
		
		$('.ui-stars-cancel a').hover(function(){
			var self = $(this);
			self.attr('title','Reset rating');
		})
		
		$('#listTags').sortable({
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
				
				var options = $.extend({
					type: 'POST',
					url: vs.urls.homeUrl + '/package/' + companyId + '/addTag',
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
			var self = $(this),
				tagName = self.parents('li:first').find('span.tagName').text().trim(),
				tagId = self.parents('li:first').attr('tagId').trim(),
				url = vs.urls.homeUrl + '/package/' + companyId + '/' + self.attr('href');
			
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
			return false;
		});
		
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
		
		$('select[name=tags]').fcbkcomplete({
			newel: true,
			maxitems:1         
		})
		
		$('.createForm').each(function(i, fr) {
			var f = $(fr);
			var self = $(this);
			var binded = f.data('bind_event');
			if (binded != undefined && binded != null && binded > 0) {
				return;
			}
			f.data('bind_event', 1);
			f.find(':submit').click(function() {
				f.data('button', $(this).attr('alt'));
			});
			f.submit(function(e) {
				var $this = $(this),
					button = $this.data('button'),
					data = $this.serializeArray();
				data.push({name: 'button', value: button});
				e.preventDefault();
				$.ajax( {
					url : $this.attr('action'),
					type: 'post',
					data : data,
					success : function(res) {
						eval('var tag = ' + res);
						tagId = tag[0];
						tagName = tag[1];
						var liNew = $('#feedTmpl').tmpl({id: tagId, name: tagName});
						liNew.find('.stars').stars({
							inputType: "select",
							callback: setTagWeight
						});
						liNew.appendTo('#primaryTags');
						self.find("ul.holder .bit-box").remove();
						self.find("select#tags").empty();
					}
				});
				return false;
			})
		});
	}
	,packaging: function(){
		init_date();
	}
	,submittedPackages: function(){
		init_date();
	},
	attachFileToRequestFormattedCv: function(){
	},
	requestFormattedCvAfterUpload: function(id, fileName, responseJSON){
		var packageId = responseJSON.packageId;
		if (responseJSON.success) {
			// Store file name for later use
			$("#uploadWrapper_"+packageId+" form input#uploadedFiles").val($("#uploadWrapper_"+packageId+" form input#uploadedFiles").val() + "#" + responseJSON['filename']);
			// Remove previous files in upload list of EAjaxUpload because we only allow 1 file to be uploaded
			var totalUploadedFiles = $("#uploadWrapper_"+packageId+" ul.qq-upload-list li").length;
			$("#uploadWrapper_"+packageId+" ul.qq-upload-list li").each(function(i,e){
				if (i < (totalUploadedFiles - 1)) {
					$(e).remove();
				}
			});
		} else {
			//alert(responseJSON.error+" "+packageId); // <= No need to alert because EAjaxUpload will validate via ajax & alert any error message.
		}
	},
	_bindCancelRequestFormattedCvEvent: function(formId, isPopup, isPreparingPackage){
		// This var stores the redirect url after form is submitted.
		// The $("#"+formId).data('redirectUrl') value is set in the view package/attachFileToRequestFormattedCv
		if ((isPreparingPackage)) {
			var redirectUrl=$("#"+formId).data('redirectUrl');
		}
		$("form.request-formatted-cv-form .cancel-request-formatted-cv").click(function(){
			var uploadWrapper = $(this).closest('form').parent();
			var form = uploadWrapper.find("form");
			if (isPopup){
				vs.openModal();
			}
			$.post(
				form.attr('action'),
				{
					'uploadedFiles': form.find("input#uploadedFiles").val(),
					'cancel': 1
				},
				function(res){
					if (isPopup)
					{
						if (! isPreparingPackage){							
							vs.closeModal();					
						} else {							
							vs.closeModal();
							location.href=redirectUrl;							
						}
					}
				}
			);
    	});
	},
	/**
	* This function is to validate the "Request formatted CV" form in package/packaging or package/update page
	* In package/packing page, the request response from server is displayed inline whereas in package/update page, it is displayed on popup window
	* @param string formId The id of the "Request formatted CV" form
	* @param bool isPopup To check whether the form is open in popup window or inline (to do corresponding action)
	* @param bool isPreparingPackage To check whether the form is open after user has clicked "Prepare package". If it is true, after requesting formatted cv, user will be redirected to package update page
	*/
	_validateForm: function(formId, isPopup, isPreparingPackage){
		// This var stores the redirect url after form is submitted.
		// The $("#"+formId).data('redirectUrl') value is set in the view package/attachFileToRequestFormattedCv
		if ((isPreparingPackage)) {
			var redirectUrl=$("#"+formId).data('redirectUrl');
		}
		$("#"+formId).validate({
			submitHandler: function(form) {
				// Check if at least 1 file has been uploaded
				// If not, alert error message
				if ($("#uploadedFiles").val()==''){
					alert('Please upload a CV.');
					return false;
				}
				
				var formAction = $(form).attr('action');
				var uploadWrapper = $(form).parent();
				var packageId = uploadWrapper.attr('id');
				packageId = packageId.replace('uploadWrapper_','');

				// Show loading message
				if (! isPopup)
				{
					var li = $(form).closest('li');
					li.html(vs.params.text.loading);
				}
				else
				{
					vs.openLoadingModal();
				}
				// Call ajax
				$.post(
				formAction,
				{
					'mailTo': $(form).find("#mailTo").val(),
					'message': $(form).find("#message").val(),
					'uploadedFiles': $(form).find("input#uploadedFiles").val()
				},
				function(res){
					if (! isPopup)
					{
						li.remove();
						$("#linkRequestFormattedCv_"+packageId).parent().html('Formatted resume requested');
					}
					else
					{
						if (isPreparingPackage){
							location.href=redirectUrl;
						} else {						
							// Remove "Request formatted CV" button
							$("#requestFormattedCv").remove();
							vs.closeModal();
						}
					}
				}
				);

				return false;
			}
		});
	}
}