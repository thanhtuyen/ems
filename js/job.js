vs.job = {
	admin : function() {
		//init date controll
		init_date();
		
		if($(".list li").length==0){
			$("#page_actions li.sort").remove();
		}
		
		$(".deactive-job").live('click', function() {
			var jobId = $(this).attr('id'); 
			var redirectURL = $(this).attr('href');
			if(confirm('Are you sure you want to deactive this job?')) {
				$.ajax({
					url : vs.job.urls.urlChangeStatus,
					type: 'POST',
					data: {'value':'3', 'id':jobId},
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
		
		$(".editable_priority").editable(vs.job.urls.urlChangePriority, {
			indicator : '<img src="' + vs.job.urls.baseURL + '/images/indicator.gif">',
			data : vs.job.priorityOptions,
			type : "select",
			submit : "OK",
			style : "inherit",
			submitdata : function() {
				return {};
			}
		});

		$(".editable_expiration").editable(vs.job.urls.urlChangeExpiration, {
			indicator : '<img src="' + vs.job.urls.baseURL + '/images/indicator.gif">',
			data : vs.job.expirationOptions,
			type : "select",
			submit : "OK",
			style : "inherit",
			submitdata : function() {
				return {};
			}
		});

		$(".editable_status").editable(vs.job.urls.urlChangeStatus, {
			indicator : '<img src="' + vs.job.urls.baseURL + '/images/indicator.gif">',
			data : vs.job.statusOptions,
			type : "select",
			submit : "OK",
			style : "inherit",
			submitdata : function() {
				return {};
			}
		});

		$(".editable_recruiter").editable(vs.job.urls.urlAssignJobForUser, {
			indicator : '<img src="' + vs.job.urls.baseURL + '/images/indicator.gif">',
			data : vs.job.recruiters,
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
	
		$(".editable_recruiter_add").editable(vs.job.urls.urlAssignJobForUser, {
			indicator : '<img src="' + vs.job.urls.baseURL + '/images/indicator.gif">',
			data : vs.job.recruiters,
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
				clone.find('.editable_recruiter_add').editable(vs.job.urls.urlAssignJobForUser, {
					indicator : '<img src="' + vs.job.urls.baseURL + '/images/indicator.gif">',
					data : vs.job.recruiters,
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
					.find('.editable_recruiter_add')
						.removeClass('editable_recruiter_add')
						.addClass('editable_recruiter')
					.end()
					.find('strong').text(user[1]);
				var id = clone.find('.editable_recruiter').attr('id') + user[0];
				clone.find('.editable_recruiter').attr('id', id);
				clone.insertBefore(li);
				li.find('.editable_recruiter_add').text('').append('<img src="../../images/add.png" title="Add new Recruiter" />');
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
	},
	
	prioritize: function() {
		//init date controll
		init_date();
		
		$('.column-priority').sortable({
	        connectWith: '.column-priority',
	        //handle: '.drag-item',
	        cursor: 'move',
	        placeholder: 'placeholder',
	        forcePlaceholderSize: true,
	        opacity: 0.3
	    }).disableSelection();
		
		$('.column-priority').bind('sortupdate', function(event, ui) {
			if (ui.sender == null) {
				return;
			}
			var jobId = ui.item.attr('id'),
				url = "updateprioritize",
				options = null;
				var priority = ui.item.parent().attr('id'),
			options = $.extend({
				type: 'POST',
				url: url,
				data: {'job_id': jobId, 'job_priority':priority},
				success: function(data, status) {
					//ui.item.parents('.column').trigger('update-estimation');
					//ui.sender.parents('.column').trigger('update-estimation');
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.responseText);
				}
			}, options || {});

			$.ajax(options);
		});
	},
	
	calJobColumnHeight: function() {
		var h = $(window).height() - (237 + $('.recruiter-block').height());
		$('.ui-auto-scroll').css({
			height: Math.max(h, 216),
			overflow: 'auto'
		});
	},
	
	active: function() {
		this.calJobColumnHeight();
		
		$(window).resize(function() {
			vs.job.calJobColumnHeight();
		})
		
		var priorityArray = new Array('Low', 'Medium', 'High');
		//highlight choosen recuiters: set color = yellow
		var colorArray = ['Olive', 'Purple', 'Aqua', 'Lime', 'Teal', 'Green', 'Yellow', 'Fuchsia', 'Red', 'Silver', 'Gray']
		var current_color = 0;
		$( ".recruiter-item" ).click(function() {
			if($(this).attr('color')=="yes") {
				$(this).css('background-color', '#DEE7F8');
				$('li > span:contains('+$(this).find('span').text()+')').css('background-color', '');
				$(this).attr('color', '');
				current_color--;
			}else {
				$(this).css('background-color', '#659DFF');
				$('li > span:contains('+$(this).find('span').text()+')').css('background-color', colorArray[Math.round((Math.random() * 10)) % colorArray.length]);
				$(this).attr('color', 'yes');
			}
		});
//		$( ".recruiter-block" ).draggable({cursor: 'move'});
//		$( ".recruiter-block" ).resizable();
		
		
		//register event drag and drop for jobs
		$('.job-column').sortable({
                    connectWith: '.job-column',
                    //handle: '.drag-item',
                    cursor: 'move',
                    //placeholder: 'placeholder',
                    helper: 'clone',
                    forcePlaceholderSize: true,
                    opacity: 1
                }).disableSelection();
                
                // dung.vo added July 04, 2011
                $('.job-column').bind('sortreceive', function(event, ui) {  
                    // inform the pending CVs when deactive a job
                    var job_status = ui.item.parent().parent().parent().attr('id');
                    if (job_status == 3) {
                        var cvpending = ui.item.attr('cvpending');
                        if (cvpending > 0) {
                            var jobId = ui.item.attr('id');
                            
                            $("#mydialog").dialog("open");            
                            $( "#mydialog" ).dialog( "option", "buttons", 
                                { "Yes": function() { 
                                        // move CV's to podlings     
                                        var options = $.extend({
                                            type: 'POST',
                                            url: "moveCVPodling",
                                            data: {'id': jobId},
                                            success: function(data, status) {
                                            },
                                            error: function(XMLHttpRequest, textStatus, errorThrown) {
                                                    alert(XMLHttpRequest.responseText);
                                            }
                                        }, options || {});
                                        $.ajax(options);
                                        
                                        $(this).dialog("close"); 
                                    },
                                  "No": function() { 
                                      // don't move CV's to podlings
                                      $(this).dialog("close"); 
                                  },
                                  "Cancel": function() { 
                                      // don't move job
                                      $(ui.sender).sortable('cancel');                                      
                                      $(this).dialog("close"); 
                                  }
                            });
                            //return false;                                
                        }
                    }	                    
                }); // end inform the pending CV's when deactive a job
                
		//update status for job when job draged and droped
		$('.job-column').bind('sortupdate', function(event, ui) {
			if (ui.sender == null) {
				return;
			}
			var priority = ui.item.parent().attr('priority');
			//if user drag & drop a job to priority area
			if(priority >= 0) {
				ui.item.find('.priority').text(priorityArray[priority]);
				ui.item.find('.priority').attr('class', 'priority priority-'+priority)
				priority-0 
				ui.item.prependTo($('.active-job-column'));
			}
			var jobId = ui.item.attr('id'),
			url = "changestatus",
			options = null;
			var job_status = ui.item.parent().parent().parent().attr('id'),
			options = $.extend({
				type: 'POST',
				url: url,
				data: {'id': jobId, 'value':job_status, 'priority':priority},
				success: function(data, status) {
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.responseText);
				}
			}, options || {});                                                
                        $.ajax(options);                        	
		});
		//register event drag and drop recruiters to jobs
		$( "#recruiterList" ).accordion();
		$( "#recruiterList li" ).draggable({
			appendTo: "body",
			helper: "clone"
		});
		$( ".job-item ol" ).droppable({
			activeClass: "ui-state-default",
			//hoverClass: "ui-state-hover",
			accept: ":not(.ui-sortable-helper)",
			drop: function( event, ui ) {
				var self = this; 
				$( this ).find( ".placeholder" ).remove();
				var userId = ui.draggable.attr('id');
				var jobId = $(this).parent().parent().attr('id');
				if(userId != '' && userId.indexOf("job") == -1 && jobId != '') {
					$.ajax({
						url : 'assignJobForUser',
						type: 'POST',
						data: {'id': jobId+'-0', 'value':userId},
						success : function(res) {
							//add recruiter to job
							var color = ui.draggable.attr('color');
							if(color == 'yes') {
								color = 'style="background:#FDFF00"';
							}
							var str = '<span '+ color + '>' + $.trim(ui.draggable.text()) + '</span> <a id="' + userId+ '" class="user-item smartTextBox-elem-deleteButton" href="">'+'</a>';
							$( "<li></li>" ).html(str).appendTo(self) ; 
						},
						error: function(XMLHttpRequest, textStatus, errorThrown) {
							alert(XMLHttpRequest.responseText);
						}
					});
				}
			}
		}).sortable({
			items: "li:not(.placeholder)",
			sort: function() {
				// gets added unintentionally by droppable interacting with sortable
				// using connectWithSortable fixes this, but doesn't allow you to customize active/hoverClass options
				$( this ).removeClass( "ui-state-default" );
			}
		});
		//remove recruiter from job
		$('.user-item').live('click', function() {
			var self = $(this), userId = self.attr('id'), jobId = self.parent().parent().parent().parent().attr('jobid');
			$.ajax({
				url : 'removeUserFromJob?jobId='+jobId+'&userId='+userId,
				type: 'POST',
				success : function(res) {
					var count = self.parent().parent().children().size();
					if(count <= 1) {
						$( '<li class="placeholder">' ).html('<i>Drop recruiters to here</i>').appendTo(self.parent().parent()) ; 
					}
					self.parent().remove();
				}
			});
			return false;
		});
		//set priority when drag and drop job
		
	},
	
	update:function(){
		$("select[name=help]").change(function(){
            var $this = $(this).parents("dd");
            return !$this.find("input").attr("value", this.value);
        });
		
		$('select.multiple').multiselect().multiselectfilter();
		
		// Bind onchange event of Industry drop down list
		$("#Job_jobIndustry").change(function(){
			var self = $(this);
			// Show loading indicator
			
			$("#Job_job_category").parent().append(" " + vs.params.text.smallLoading);
			$.get(
				vs.urls.homeUrl + '/job/getCategoriesByIndustry',
				{industry: self.val()},
				function(res)
				{
					var promptText = "Select Category";
					var options = '<option value="">' + promptText + '</option>';					
										
					categories = eval(res);
					for(i=0; i<categories.length; i++)
					{
						options += '<option value="' + categories[i].category_id + '">' + categories[i].category_name + '</option>'
					}
					
					$("#Job_job_category").html(options);
					
					// Remove loading indicator
					$("#Job_job_category").parent().find('span.waiting').remove();
				}
			);
		});
	}
}
