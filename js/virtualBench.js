vs.virtualBench = {
	index: function() {
		var $container = $('.candidate-list');
		
	    // change size of clicked element
	    $('.ajaxClose').live('click', function(){
		  var parent = $(this).parent().parent().parent();
		  //parent.attr('class', 'element isotope-item').attr('style', '');            
		  parent.removeClass('large');
		  parent.find('.detailCandidate').hide();
		  parent.find('.candidate-item').show().attr('show', 'yes');	  		
		  //$container.isotope('reLayout');    
	    });
	    
	    $('input[type=radio]').live('click',function(){
	    	var strIds = "";
	    	var keyword = $('#keyword').val();
	    	var tagList = $('#taglist');
	    	var tagArray = new Array();
	    	var rate = $(this).val();
	    	tagList.find('.active').each(function() {
				tagArray.push($(this).attr('id'));
			});		
	    	for(var i=0;i<tagArray.length; i++) {
				strIds += tagArray[i];
				if(i<tagArray.length-1) 
					strIds += ",";
			}
	    	$('.candidate-block').html(vs.params.text.loading);
	    	$.ajax( {
				url : 'search?tid='+strIds+'&keyword='+ keyword+'&rate='+rate,
				async : false,
				success : function(res) {				
					$('.candidate-block').html(res);
					
					//ajax loading full candidate detail when finished filter
					//vs.virtualBench.loadDetailPackages();
					if($('.candidate-block').find('.empty').text()!='No results found.') {
						$container = $('.candidate-list');
					}
				}
			});
	    })
	    
	    $container.find('.show-hide').live('click', function(){
	    	var href = $(this).attr('href');
	      $(this).find("a").toggleClass('hide')
	      var parent = $(this).parent().toggleClass('large');
	      $container.isotope('reLayout');
	            
	      var shortDetail = parent.find('.candidate-item');
	      var fullDetail = parent.find('.detailCandidate');
	      if(shortDetail.attr('show') =='yes') {      			
	      	shortDetail.hide();
	      	fullDetail.show();
	      //ajax loading full candidate detail when completed load page
			var self = fullDetail;
			self.html(vs.params.text.loading);
	      	$.ajax( {
				url : href,
				async : false,
				success : function(res) {
					self.html(res);
				}
			});
	      	shortDetail.attr('show', '');
	  	  }else {
	  	  	shortDetail.show();
	  	  	fullDetail.hide();
	  	  	shortDetail.attr('show', 'yes');
		  }
	    });
	   
//      $container.isotope({
//        itemSelector : '.element',
//        //animationEngine : $.browser.opera ? 'jquery' : 'best-available'
//    	masonry: {
//        	columnWidth: 3
//          }
//      }); 
	    
	    $("#search").submit(function(){
	    	var strIds = "";
	    	var keyword = $(this).find('#keyword').val();
	    	var tagList = $('#taglist');
	    	var tagArray = new Array();
	    	var rate = $(this).val();
	    	tagList.find('.active').each(function() {
				tagArray.push($(this).attr('id'));
			});		
	    	for(var i=0;i<tagArray.length; i++) {
				strIds += tagArray[i];
				if(i<tagArray.length-1) 
					strIds += ",";
			}
	    	$('.candidate-block').html(vs.params.text.loading);
	    	$.ajax( {
				url : 'search?tid='+strIds+'&keyword='+ keyword+'&rate='+rate,
				async : false,
				success : function(res) {				
					$('.candidate-block').html(res);
					//ajax loading full candidate detail when finished filter
					//vs.virtualBench.loadDetailPackages();
					if($('.candidate-block').find('.empty').text()!='No results found.') {
						$container = $('.candidate-list');
					}
				}
			});
	    	return false;
	    }) 
      
      //filter by tag
      $('.tag-item').live('click', function(){
			//$('#taglist .tag-item').removeClass('active');
			//$(this).addClass('active'); 
			/*****/
			var strIds = "";
			var rate = $("input:checked").attr('value');
			if($(this).attr('id') =='') { //search all
				$('#taglist .tag-item').removeClass('active');
				$(this).addClass('active'); 
			} else {
				$(this).toggleClass('active');
				$(this).parent().find('li:first').removeClass('active');				
				var tagArray = new Array();
				$(this).parent().find('.active').each(function() {
					tagArray.push($(this).attr('id'));
				});				
				for(var i=0;i<tagArray.length; i++) {
					strIds += tagArray[i];
					if(i<tagArray.length-1) 
						strIds += ",";
				}
			}						
			/*****/
			//ajax loading list of packages 
			$('.candidate-block').html(vs.params.text.loading);
			$.ajax( {
				url : 'search?tid='+strIds+'&rate='+rate,
				async : false,
				success : function(res) {				
					$('.candidate-block').html(res);
					
					//ajax loading full candidate detail when finished filter
					//vs.virtualBench.loadDetailPackages();
					if($('.candidate-block').find('.empty').text()!='No results found.') {
						$container = $('.candidate-list');
//						$container.isotope({
//					        itemSelector : '.element',
//					        //animationEngine : $.browser.opera ? 'jquery' : 'best-available'
//				        	masonry: {
//				        	columnWidth: 3
//				          }
//					      });
					}
				}
			});
	  });
      //check/uncheck favourite
      $('.favourite').live('click', function(){
    	  var parent = $(this).parent();
    	  var self = $(this);
    	  parent.html(vs.params.text.smallLoading);
    	  $.ajax( {
				url : 'updateFavourite?fvalue='+$(this).attr('value')+ '&vid='+$(this).attr('vid'),
				success : function(res) {				
    		  		self.attr('src', res);
    		  		parent.html(self);
    		  		if(self.attr('value') == '0')  {
    		  			self.attr('value', '1');
    		  		}else {
    		  			self.attr('value', '0');
    		  		}
				}
			});
      });
      
      //ajax loading full candidate detail when completed load page
	  // vs.virtualBench.loadDetailPackages();
		      
	},
	loadDetailPackages: function() {
		$('.element .candidate-item a').each(function(index) {		
			//ajax loading full candidate detail when completed load page
			var self = $(this);
	      	$.ajax( {
				url : $(this).attr('href'),
				async : false,
				beforeSend : function() {				
					//li.next().html(vs.params.text.loading);
				},
				success : function(res) {
					//li.next().html(res);
					self.parent().parent().parent().find('.detailCandidate').html(res);
				}
			});
		  });
	},
	publish: function() {
		heightC1 = $('.col1 .candidate-column').height();
		heightC2 = $('.col2 .candidate-column').height();
		$('.col2 .candidate-column').height(heightC1 + heightC2);
		$('.col1 .candidate-column').height(heightC1 + heightC2);
		
		$("#tags").multiSelect({ oneOrMoreSelected: '*' });
		$("#tags2").multiSelect({ oneOrMoreSelected: '*' });
		
		$('#search-block1').click(function() {
			$('#block2').hide();
			$('#block1').show();
		});
		
		$('#search-block2').click(function() {
			$('#block1').hide();
			$('#block2').show();
		});
		
		$('#company').live('change', function() {
			$('#company_form').submit();
		});
		
		$('.candidate-column').sortable({
	        connectWith: '.candidate-column',
	        //handle: '.drag-item',
	        cursor: 'move',
	        placeholder: 'placeholder',
	        forcePlaceholderSize: true,
	        opacity: 0.6
	    }).disableSelection();
		
		$('.candidate-column').bind('sortupdate', function(event, ui) {
			if (ui.sender == null) {
				return;
			}
			
			var packageId = ui.item.attr('id'),
				url = "packageToClient",
				options = null;
				var company = ui.item.parent().parent().parent().attr('company');
				options = $.extend({
					type: 'POST',
					url: url,
					data: {'company': company, 'package_id':packageId},
					success: function(data, status) {
						$('.empty').remove();
						//ui.sender.parents('.column').trigger('update-estimation');
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						alert(XMLHttpRequest.responseText);
					}
				}, options || {});

			$.ajax(options);
		});
		/*
		 * copy code from chau.vuong
		 */
		$('.featured').live('click', function(){
			var item = $(this);
			var url = $(this).attr('href');
			
			//item.html('<img src="' + vs.urls.baseUrl + '/images/indicator.gif"> Deleting...')
			$.ajax({
				type: 'POST',
				url : url,
				success : function(res) {
					item.removeClass("featured");
					item.addClass("not-featured");
				}
				,error: function(xhr) {
					alert(xhr.responseText);
				}
			});
			return false;
		})
		
		$('.not-featured').live('click', function(){
			var item = $(this);
			var url = $(this).attr('href');
			
			//item.html('<img src="' + vs.urls.baseUrl + '/images/indicator.gif">')
			$.ajax({
				type: 'POST',
				url : url,
				success : function(res) {
					item.removeClass("not-featured");
					item.addClass("featured");
			}
			,error: function(xhr) {
				alert(xhr.responseText);
			}
			});
			return false;
		})
		
		
		
		/*End*/
	},
	admin:function(){
		init_date();
		$("#content").attr("style","position:static")
		$(".ranking").each(function(){
			$(this).stars();
		});
		$(".view-favourite").each(function(){
			$(this).tooltip({
				position: "bottom center", 
				opacity: 0.9
			});
		});
		
		
		$('.featured').live('click', function(){
			var item = $(this);
			var url = $(this).attr('href');
			
			if (confirm('Do you want to remove featured for this package?')) {
				//item.html('<img src="' + vs.urls.baseUrl + '/images/indicator.gif"> Deleting...')
				$.ajax({
					type: 'POST',
					url : url,
					success : function(res) {
						item.removeClass("featured");
						item.addClass("not-featured");
					}
					,error: function(xhr) {
						alert(xhr.responseText);
					}
				});
			}
			return false;
		})
		
		$('.not-featured').live('click', function(){
			var item = $(this),
			url = $(this).attr('href');
			$.ajax({
				type: 'POST',
				url : url,
				success : function(res) {
					item.removeClass("not-featured");
					item.addClass("featured");
			}
			,error: function(xhr) {
				alert(xhr.responseText);
			}
			});
			return false;
		})
		
		$('.delete').live('click', function() {
			var item = $(this).parent().parent('li.candidate-item');
			if (confirm('Do you want to delete this package?')) {
				item.html('<img src="' + vs.urls.baseUrl + '/images/indicator.gif">Deleting...')
				var self = $(this),url = $(this).attr('href');
				$.ajax({
					type: 'POST',
					url : url,
					success : function(res) {
						item.remove();
					}
					,error: function(xhr) {
						alert(xhr.responseText);
					}
				});
			}
			return false;
		});
		
	}
	,acceptedForm:function(){
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
	}
	
	
}
