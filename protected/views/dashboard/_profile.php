

<?php $stringHelper = new GlandoreHelper; ?>

<li class="each d_message">		
<a title="Profile detail" style="" href="<?php echo Yii::app()->createUrl('/profile/view', array('id'=>$data->user_id));?>" >
	<div class="vacation" style="padding: 10px 10px;">  
		<span style=""><?php echo CHtml::encode($data->user_code); ?></span>
		<span class="user"></span>  
		<?php 
			echo $data->user->getUserFullName($data->user_id); 
		?>
		<span style="">[<?php echo CHtml::encode($data->getUserJobFunction()); ?>]</span> 
		<span style="">[<?php echo CHtml::encode(isset($data->user_time)?date('M-d-Y H:i',$data->user_time):''); ?>]</span>
		<sup class="<?php echo "sup_day ".$data->user_scenario; ?>">
		<?php echo ($data->user_scenario=='create'?'new':$data->user_scenario); ?> 
		</sup>
	</div>
</a>
</li>