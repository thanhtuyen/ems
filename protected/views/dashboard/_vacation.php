<?php $stringHelper = new GlandoreHelper; ?>

<li class="each d_message">
	<div class="vacation" style="padding: 10px 10px;">  
	
		<a title="Sender" style="color: #333;" href="<?php echo Yii::app()->createUrl('/profile/view', array('id'=>$data->user_id));?>" >
		<?php 
			echo $data->user->getUserFullName($data->user_id); 
		?>
		</a> 
		
		<span class="vacation"></span> 
		
		<a title="<?php echo "requested on ".$data->getrequestDay(); ?>" style="color: #333;" href="<?php echo Yii::app()->createUrl('/vacation/view', array('id'=>$data->vacation_id));?>">
		<?php echo CHtml::encode($data->getReasonName()).': '; ?>  
		
		
		<?php  
			echo $data->total." ".$data->showday($data->total)."";
			//echo $stringHelper->substr($data->more_reason, 0, 30, '... ');
		?>
		
		<?php echo '<b class="sup_day" style="color: brown;">from '.CHtml::encode($data->getstartDay()).'</b>'; ?> 
		
		<span class="pin"></span> 
		<sup style="float: right; background: dimgrey; padding: 4px; margin: -4px; border-radius: 4px; color:<?php if($data->getStatusName()=="Waiting") echo "gold"; else echo "whiteSmoke"; ?>"><?php echo CHtml::encode($data->getStatusName()); ?></sup>
		
		</a>
	</div>
</li> 