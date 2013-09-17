<li class="each d_message">
<a title="User info" style="color: #333;" href="<?php echo Yii::app()->createUrl('/user/view', array('id'=>$data->user_id));?>" >
	<div class="vacation" style="padding: 10px 10px;">  
		<span style="">[<?php echo  CHtml::encode($data->getCreatedDate()); ?>]</span>
		<span class="user"></span> 
		<span style="">[<?php echo CHtml::encode($data->user_username); ?>]</span>
		<span style=""><?php echo CHtml::encode($data->getFullName($data->user_id)); ?></span>
		<span style="">[<?php echo CHtml::encode($data->getRoleName()); ?>]</span>
	</div>
</a>
</li>