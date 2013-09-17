if(typeof String.prototype.trim !== 'function') {
	String.prototype.trim = function() {
		return this.replace(/^\s+|\s+$/g, ''); 
	}
}

var vs = {
	// --------
	params : {
		text : {
			loading : '<div class="loading">vSource is working, please wait ...</div>',
			smallLoading : '<span class="waiting"></span>',
			remove : 'Are you sure ?'
		}
	},
	
	widgets : {
		
	},
	
	// --------
	init : function() {
		$.ajaxSetup( {
			error: function(xhr) {
				alert(xhr.responseText);
				if(xhr.status == 500){
					$(location).attr('href',vs.urls.homeUrl);
				}
			}
		});

		$('#cbLoginAs').change(function() {
			window.location = vs.urls.homeUrl + '/site/changeLoginRole?loginAs=' + $(this).val();
		})
		
		// piano rows
		$('ul.list > li:odd').addClass('odd');
		
		$('.search-button').click(function(){
			$(this).find('span').toggleClass('filter');
		});
		
		$(".ajaxPopup").live("click", function(e) {
			var url = $(this).attr('href');
			vs.loadModalWithUrl(url);
			return false;
		});
		
		$(".ajaxLoad").live("click", function(e) {

			var li = $(this).parents("li");
                        if (li.length > 1) {
                            // Get the top ancestor
                            li = $(li[li.length - 1]);
                        }
                        
			li.data('open') ? li.data('open', 0) : li.data('open', 1);
			li.data('target', $(this));

			if (li.data('open') == 1) {
				li.next(".ajaxResult").remove();
				$.ajax( {
					url : this.href,
					async : false,
					beforeSend : function() {
						$('<li class="ajaxResult"></li>').insertAfter(li);
						li.next().html(vs.params.text.loading);
					},
					success : function(res) {
						li.next().html(res);
					}
				});
			} else {
				li.next(".ajaxResult").remove();
			}
			e.preventDefault();
		});

		$(".ajaxLoadTable").live("click", function(e) {

			var tr = $(this).parents("tr");

			tr.data('open') ? tr.data('open', 0) : tr.data('open', 1);
			tr.data('target', $(this));

			if (tr.data('open') == 1) {
				tr.next(".ajaxResult").remove();
				$.ajax( {
					url : this.href,
					async : false,
					beforeSend : function() {
						$('<tr class="ajaxResult"></tr>').insertAfter(tr);
						tr.next().html(vs.params.text.smallLoading);
					},
					success : function(res) {
						tr.next().html(res);
					}
				});
			} else {
				tr.next(".ajaxResult").remove();
			}
			e.preventDefault();
		});
		
		
		$(".ajaxClose", ".ajaxResult").live(
				"click",
				function(e) {
					$(this).parents(".ajaxResult").hide().prev().scrollTo(100)
							.removeData().end().remove();
					e.preventDefault();
				});

		$(".ajaxMap").live("click", function(e) {
			e.preventDefault();
			var target = $(this).parent(".map");
			var jobID = $(target).parents('form').find(':hidden').eq(0).val();
			$.ajax( {
				url : this.href,
				data : {
					jobID : jobID
				},
				success : function(res) {
					target.html(res);
				}
			});
		});

		// select the overlay element - and "make it an overlay"
		$("#overlay").overlay({
			// some mask tweaks suitable for facebox-looking dialogs
			mask: {
				// you might also consider a "transparent" color for the mask
				color: '#fff',
				// load mask a little faster
				loadSpeed: 200,
				closeOnClick: true,
				// very transparent
				opacity: 0.8
			},
			// disable this for modal dialog-type of overlays
			closeOnClick: false,
			// load it immediately after the construction
			load: false
			,onClose: function(event) {
				var api = event.target;
				api.getOverlay().find('.contentWrap').empty();
			}
		});
	}
	
	,getOverlay: function() {
		return $("#overlay").data('overlay');
	}
	
	,openModal: function() {
		var api = this.getOverlay();
		api.getOverlay().find('.contentWrap').html(vs.params.text.loading);
		api.load();
	}
	
	,loadModal: function(content) {
		var api = this.getOverlay();
		api.getOverlay().find('.contentWrap').html(content);
		if (!api.isOpened()) {
			api.load();
		}
	}
	
	,loadModalWithUrl: function(url, minWidth) {
		var api = this.getOverlay();
		if (minWidth != undefined) {
			api.getOverlay().css('width', minWidth);
		}
		api.getOverlay().find('.contentWrap').load(url);
		if (!api.isOpened()) {
			api.load();
		}
	}
	
	,openLoadingModal: function() {
		var api = this.getOverlay();
		api.getOverlay().find('.contentWrap').html(vs.params.text.loading);
		api.load();
	}

	,closeModal: function() {
		var api = this.getOverlay();
		api.close();
	}
	
	,clearForm: function(parent) {
		$(':input', parent)
		 .not(':button, :submit, :reset, :hidden')
		 .val('')
		 .removeAttr('checked')
		 .removeAttr('selected');
	}
}

vs.widgets.tag = {
	init: function(selector,subSelector) {
		var widget = $(selector);
		widget.find('a.ajaxTag').click(function() {
			vs.loadModalWithUrl($(this).attr('href'), 650);
			$("object").hide();
			
			var modal = vs.getOverlay();
			modal.getOverlay().one('onBeforeClose', function() {
				var url = widget.find('.tags-list:first').attr('url').trim();
				var target = widget.find('.tags-list');
				$("object").show();
				setTimeout(function() {
					target.load(url);
					if(subSelector){
						var subWidget = $(subSelector);
						var subTarget = subWidget.find('.tags-list');
						subTarget.load(url);
					}
				}, 100);
				return true;
			})
			return false;
		});
		return widget;
	}
}
$().ready(function() {
	vs.init();
});

init_date = function() {
	$(":date").dateinput({
		format: 'dd mmmm yyyy',	// the format displayed for the user
		selectors: true,             	// whether month/year dropdowns are shown
		//min: -2000,                    // min selectable day (100 days backwards)
		max:365,                    	// max selectable day (100 days onwards)
		offset: [10, 20],            	// tweak the position of the calendar
		speed: 'fast',               	// calendar reveal speed
		firstDay: 1                  	// which day starts a week. 0 = sunday, 1 = monday etc..
	});
};
Number.prototype.pxToEm = String.prototype.pxToEm = function(settings){
	//set defaults
	settings = jQuery.extend({
		scope: 'body',
		reverse: false
	}, settings);
	
	var pxVal = (this == '') ? 0 : parseFloat(this);
	var scopeVal;
	var getWindowWidth = function(){
		var de = document.documentElement;
		return self.innerWidth || (de && de.clientWidth) || document.body.clientWidth;
	};	
	
	/* When a percentage-based font-size is set on the body, IE returns that percent of the window width as the font-size. 
		For example, if the body font-size is 62.5% and the window width is 1000px, IE will return 625px as the font-size. 	
		When this happens, we calculate the correct body font-size (%) and multiply it by 16 (the standard browser font size) 
		to get an accurate em value. */
				
	if (settings.scope == 'body' && $.browser.msie && (parseFloat($('body').css('font-size')) / getWindowWidth()).toFixed(1) > 0.0) {
		var calcFontSize = function(){		
			return (parseFloat($('body').css('font-size'))/getWindowWidth()).toFixed(3) * 16;
		};
		scopeVal = calcFontSize();
	}
	else { scopeVal = parseFloat(jQuery(settings.scope).css("font-size")); };
			
	var result = (settings.reverse == true) ? (pxVal * scopeVal).toFixed(2) + 'px' : (pxVal / scopeVal).toFixed(2) + 'em';
	return result;
};

$.fn.equalHeights = function(px) {
	$(this).each(function(){
		var currentTallest = 0;
		$(this).children().each(function(i){
			if ($(this).height() > currentTallest) { currentTallest = $(this).height(); }
		});
		if (!px || !Number.prototype.pxToEm) currentTallest = currentTallest.pxToEm(); //use ems unless px is specified
		// for ie6, set height since min-height isn't supported
		if ($.browser.msie && $.browser.version == 6.0) { $(this).children().css({'height': currentTallest}); }
		$(this).children().css({'min-height': currentTallest}); 
	});
	return this;
};

$.fn.extend({	
	clear: function() {
		return this.each(function() { 
			$("input, textarea, select", this).each(function() { this.value = ""; });
		});
	},
	scrollTo : function(speed, easing) {
		return this.each(function() {
			var targetOffset = $(this).offset().top;
			$('html,body').animate({scrollTop: targetOffset}, speed, easing);
		});
	}
});
