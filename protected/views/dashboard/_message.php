<?php $stringHelper = new GlandoreHelper; ?>
	
<li class="each d_message">
	<div class="" style="padding: 10px 10px;"> 
		 
			<?php 
			switch($data->mod_types)
			{
				case 1: $TypeName = "notice";	break;
				case 2: $TypeName = "news";		break;
				case 3: $TypeName = "message";	break;
				default: break;
			}
			
			?>
			<!-- auto attach span tag -->
			<?php if($data){
				DialogBox::createDialogBox(
							 $this
							,"rand_id".$data->mod_id
							,"View Message #".$data->mod_id." of ".$data->getUserName($data->mod_sender_id)	
							,"dashboard/viewmessage/".$data->mod_id
							,"testinput"
							,"sampleIconCssStyle ".$TypeName
							,800,500 
						); 
				}
			?> 
		
		<?php //echo $data->getTypeName().': '; ?>
	 
		<a title="Sender" style="color: #333;" href="<?php echo Yii::app()->createUrl('/profile/view', array('id'=>$data->mod_sender_id));?>" >  
		<?php 
			/*
			if($data->getUserRole($data->mod_sender_id)=="admin") 
				echo "Managing Director";
			else if($data->getUserRole($data->mod_sender_id)=="manager") 
				echo "Glandore Manager";
			else if($data->getUserRole($data->mod_sender_id)=="input") 
				echo "Glandore Admin";
			else 
			*/
			
			//echo $data->getUserName($data->mod_sender_id); 			
		?>
		</a>
		
		<?php //echo "<em style=\"color: grey;\"> said: </em>"; ?>
		
		<a title="<?php echo "from ".$data->getUserName($data->mod_sender_id); 	?>" style="color: #333;" href="<?php echo Yii::app()->createUrl('/message/view', array('id'=>$data->mod_id));?>">
		<?php 
			if($data->mod_title) echo $stringHelper->substr($data->mod_title, 0, 55, '... [more]'); 
			else echo $stringHelper->substr($data->mod_info, 0, 55); 
		?>
		<sup class="sup_day" style="color: brown;">
			<?php echo '['.CHtml::encode(date('M-d-Y',$data->mod_date)).']'; ?> 		
		</sup>
		</a> 
		
	</div>
</li> 