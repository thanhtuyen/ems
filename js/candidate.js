vs.candidate = {
	unFreshmeat: function() {
		init_date();
		$('.confirm-fairgame').live('click', function() {
			return confirm('Are you sure you want to move this candidate to Fair Game?');
		});
	},
	freshmeat: function() {
		init_date();
		
		// Bind click events for Accept button
		$("a.accept").live('click', function(){			
			vs.openModal();
			$.get(
				$(this).attr('href'),
				{},
				function(res){
					$.fn.yiiListView.update('freshmeat-list');
					vs.closeModal();
				}
			);			
			return false;
		});
		// Bind click events for Reject button
		$("a.reject").live('click', function(){
			vs.openLoadingModal();
			var $this = $(this),
			button = 'reject',
			data = new Array();
			data.push({name: 'button', value: button});			
			$.ajax( {
				url : $this.attr('href'),
				type: 'post',
				data : data,
				success : function(res) {
					vs.loadModal(res);
				}
			});
			// End bind click event for Reject button			
			return false;
		});
		// Bind click events for Fair game button
		$("a.fair-game").live('click', function(){			
			vs.openModal();
			$.get(
				$(this).attr('href'),
				{},
				function(res){
					$.fn.yiiListView.update('freshmeat-list');
					vs.closeModal();
				}
			);			
			return false;
		});
	}

	,moveFairGame: function() {
		
	},
	
	fairGame: function() {
		init_date();
		// Bind click events for Accept button
		$("a.accept").live('click', function(){			
			vs.openModal();
			$.get(
				$(this).attr('href'),
				{},
				function(res){
					$.fn.yiiListView.update('freshmeat-list');
					vs.closeModal();
				}
			);			
			return false;
		});
		// Bind click events for Reject button
		$("a.reject").live('click', function(){
			vs.openLoadingModal();
			var $this = $(this),
			button = 'reject',
			data = new Array();
			data.push({name: 'button', value: button});			
			$.ajax( {
				url : $this.attr('href'),
				type: 'post',
				data : data,
				success : function(res) {
					vs.loadModal(res);
				}
			});
			// End bind click event for Reject button			
			return false;
		});
	},
	
	accepted: function() {
		init_date();
	},
	
	search: function() {
		init_date();
		$(".requested").click(function(){
			var self = $(this),
				url = self.attr('href');
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
		
	}
	/**
	 * Bind events for decision form
	 */
	,_bindDecisionForm: function(){
		$('div.ajaxDecision form').each(function(i, fr) {
			var f = $(fr);
			var binded = f.data('bind_event');
			if (binded != undefined && binded != null && binded > 0) {
				return;
			}
			f.data('bind_event', 1);
			f.find(':submit').click(function() {
				f.data('button', $(this).attr('alt'));
			});
			f.submit(function(e) {
				vs.openLoadingModal();
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
						vs.loadModal(res);
					}
				});
				return false;
			})
		});
	}
	,view: function() {
		// Bind events for decision form
		vs.candidate._bindDecisionForm();
		
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
		
		$(".setAnotherReminder").click(function(){			
			vs.openLoadingModal();
			var $this = $(this);			
			$.ajax( {
				url : $this.attr('href'),
				type: 'post',
				success : function(res) {
					vs.loadModal(res);
				}
			});
			
			return false;
		});
		
		// Bind click event for "Prepare package" button (in order to see this button, go to My candidates, click a candidate, scroll down to see)
		$("input.prepare-package").live('click', function(){
			vs.openLoadingModal();
			$.get(
				$(this).attr('href'),
				{},
				function(res){
					res=$.parseJSON(res);
					// Load popup
					$.ajax( {
						url : res.requestFormattedCvUrl,
						type: 'get',
						success : function(res) {
							vs.loadModal(res);
						}
					});
				}
			);
			return false;
		});
		// End Bind click event for "Prepare package"			
	}
	,archive:function(){
		init_date();
		$(".reminder").each(function(){
			$(this).tooltip({
				position: "bottom center", 
				opacity: 0.9
			});
		});
	}
	,archiveForm:function(){
		$('.sendReminder').each(function(i, fr) {
			var f = $(fr);
			var binded = f.data('bind_event');
			if (binded != undefined && binded != null && binded > 0) {
				return;
			}
			f.data('bind_event', 1);
			f.find(':submit').click(function() {
				f.data('button', $(this).attr('alt'));
			});
			
			f.submit(function(e) {
				// Get submitted id
				var submittedId = f.find("input[name=submittedId]").val();
				
				vs.openLoadingModal();
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
						// At this stage, we have just created a todo job for this candidate.
						// Now we do archive this candidate via ajax
						$.post(
							vs.urls.homeUrl + '/submitted/archive/' + submittedId,
							{},
							function(res){
								// Reload page or reload clistview
								if ($("#my-candidates-list") != null) {
									$.fn.yiiListView.update('my-candidates-list');
								} else {
									location.reload();
								}
							}
						);
						$(".ajaxResult p").find(".archive").remove();
						vs.closeModal();
					}
				});
				return false;
			})
		});
		
		$(":input[type=textarea]").counter({
		    goal: 400,
		    count: 'up'           
		});
	}
	,myUnpackagedCandidates:function(){
		init_date();
		
		// Bind click event for "Prepare package"
		$("a.prepare-package").live('click', function(){
			vs.openLoadingModal();
			$.get(
				$(this).attr('href'),
				{},
				function(res){
					res=$.parseJSON(res);
					// Load popup
					$.ajax( {
						url : res.requestFormattedCvUrl,
						type: 'get',
						success : function(res) {
							vs.loadModal(res);
						}
					});
				}
			);
			return false;
		});
		// End Bind click event for "Prepare package"
	}
	,dncForm:function(){
		$("#dnc-form").submit(function(e){
			if ($("#dnc-form").valid())
			{
				var action =$(this).attr('action');
				var data = $(this).serialize();				
				vs.openLoadingModal();				
				$.post(
					action,
					data,
					function(res){
						// Reload corresponding list view or reload page						
						if ($("#my-candidates-list") != null){							
							$.fn.yiiListView.update("my-candidates-list");
							vs.closeModal();
						} else {
							location.reload();
						}
					}
				);
			}
			return false;
		});
		
		$(":input[type=textarea]").counter({
		    goal: 400,
		    count: 'up'           
		});
	}
	,setAnotherReminder:function(){
		$('.sendReminder').each(function(i, fr) {
			var f = $(fr);
			var binded = f.data('bind_event');
			if (binded != undefined && binded != null && binded > 0) {
				return;
			}
			f.data('bind_event', 1);
			f.find(':submit').click(function() {
				f.data('button', $(this).attr('alt'));
			});
			
			f.submit(function(e) {
				// Get submitted id
				var submittedId = f.find("input[name=submittedId]").val();
				
				vs.openLoadingModal();
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
						vs.closeModal();
					}
				});
				return false;
			})
		});
	}
	,dncList: function(){
		init_date();		
	}
	
	,searchCandidate: function() {
		$('.ajaxSubmit').live('click', function() {
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
	}
}