<?php
$this->breadcrumbs = array(
	'Dashboard',
);
?>

<?php
Yii::import("application.extensions.GlandoreHelper");
?>

<?php if(Yii::app()->user->hasFlash('warn_status')):?>
	<h3 class="warn_info">
        <?php echo Yii::app()->user->getFlash('warn_status'); ?>
    </h3>
<?php endif; ?> 

<h1>Welcome to <i><?php echo CHtml::encode(Yii::app()->name); ?></i></h1>

<p>Congratulations! You have successfully created your Yii application.</p>

<p>You may change the content of this page by modifying the following two files:</p>
<ul>
	<li>View file: <code><?php echo __FILE__; ?></code></li>
	<li>Layout file: <code><?php echo $this->getLayoutFile('main'); ?></code></li>
</ul>

<p>For more details on how to further develop this application, please read
the <a href="http://www.yiiframework.com/doc/">documentation</a>.
Feel free to ask in the <a href="http://www.yiiframework.com/forum/">forum</a>,
should you have any questions.</p>

<?php if(Yii::app()->user->checkAccess('admin')||Yii::app()->user->checkAccess('manager')): ?> 

<div class="main_dashboard">

	<div class="dash dash_message">
		<strong class="title">Most recent messages</strong>
		<a id="add" style="line-height: 21px;" title="Create new message" href="<?php echo Yii::app()->createUrl('/message/create');?>">
			Create message
		</a>
		<div class="group">
		<?php $this->widget('zii.widgets.CListView', array(
			'dataProvider'=>$dataProvider,
			'itemView'=>'_message',
			'template'=>'{items}',	
			//'emptyText' => '',
			//'summaryText' => '',
		)); ?>
		</div>	
		<?php if(Message::model()->exists()): ?>
		<li class="each"><a class="viewall" title="View more messages" href="<?php echo Yii::app()->createUrl('/message/');?>">more</a></li>
		<?php endif; ?>
	</div>
	<div class="dash dash_vacation">
		<strong class="title">Most recent vacations</strong>
		<a id="add" style="line-height: 21px;" title="Create new vacation" href="<?php echo Yii::app()->createUrl('/vacation/create');?>">
			Create vacation
		</a>
		<div class="group">
		<?php $this->widget('zii.widgets.CListView', array(
			'dataProvider'=>$vacation,
			'itemView'=>'_vacation',
			'template'=>'{items}',	
			//'emptyText' => '',
			//'summaryText' => '',
		)); ?>
		</div>
		<?php if(Vacation::model()->exists()): ?>
		<li class="each"><a  class="viewall" title="View more vacations" href="<?php echo Yii::app()->createUrl('/vacation/');?>">more</a></li>
		<?php endif; ?>
	</div>
	<div class="dash dash_profile">
		<strong class="title">Most recent profiles</strong>
		<a id="add" style="line-height: 26px;" title="Create new profile" href="<?php echo Yii::app()->createUrl('/profile/newprofile/'); ?>">
			Create profile
		</a>
		<div class="group">
		<?php $this->widget('zii.widgets.CListView', array(
			'dataProvider'=>$profile,
			'itemView'=>'_profile',
			'template'=>'{items}',	
			//'emptyText' => '',
			//'summaryText' => '',
		)); ?>
		</div>		
		<?php if(Profile::model()->exists()): ?>
		<li class="each"><a  class="viewall" title="View more profiles" href="<?php echo Yii::app()->createUrl('/profile/');?>">more</a></li>
		<?php endif; ?>
	</div>
	 
	<div class="dash dash_user">
		<strong class="title">Most recent users</strong>
		<a id="add" style="line-height: 21px;" title="Create new user" href="<?php echo Yii::app()->createUrl('/user/create');?>">
			Create user
		</a>
		<div class="group">
		<?php $this->widget('zii.widgets.CListView', array(
			'dataProvider'=>$user,
			'itemView'=>'_user',
			'template'=>'{items}',	
			'emptyText' => '',
			'summaryText' => '',
		)); ?>
		</div>	
		<?php if(User::model()->exists()): ?>	
		<li class="each"><a  class="viewall" title="View more users" href="<?php echo Yii::app()->createUrl('/user/');?>">more</a></li>
		<?php endif; ?>
	</div>
	 
</div>


<?php elseif(Yii::app()->user->checkAccess('input_user')): ?> 

<div class="main_dashboard">

	<div class="dash dash_message">
		<strong class="title">Most recent messages</strong>
		<?php if(Yii::app()->user->checkAccess('admin')||Yii::app()->user->checkAccess('manager')): ?> 
		<a id="add" style="line-height: 21px;" title="Create new message" href="<?php echo Yii::app()->createUrl('/message/create');?>">
			Create message
		</a>		
		<?php endif; ?>
		
		<div class="group">
		<?php $this->widget('zii.widgets.CListView', array(
			'dataProvider'=>$dataProvider,
			'itemView'=>'_message',
			'template'=>'{items}',	
			//'emptyText' => '',
			//'summaryText' => '',
		)); ?>
		</div>	
		<?php if(Message::model()->exists()): ?>
		<li class="each"><a class="viewall" title="View more messages" href="<?php echo Yii::app()->createUrl('/message/');?>">more</a></li>
		<?php endif; ?>
	</div>
	<div class="dash dash_vacation">
		<strong class="title">Most recent vacations</strong>
		<a id="add" style="line-height: 21px;" title="Create new vacation" href="<?php echo Yii::app()->createUrl('/vacation/create');?>">
			Create vacation
		</a>
		<div class="group">
		<?php $this->widget('zii.widgets.CListView', array(
			'dataProvider'=>$vacation,
			'itemView'=>'_vacation',
			'template'=>'{items}',	
			//'emptyText' => '',
			//'summaryText' => '',
		)); ?>
		</div>
		<?php if(Vacation::model()->exists()): ?>
		<li class="each"><a  class="viewall" title="View more vacations" href="<?php echo Yii::app()->createUrl('/vacation/');?>">more</a></li>
		<?php endif; ?>
	</div>
	<div class="dash dash_profile" style="width: 100%;">
		<strong class="title" style="line-height: 0px;">Most recent profiles</strong>
		<a id="add" style="line-height: 18px;" title="Create new profile" href="<?php echo Yii::app()->createUrl('/profile/newprofile/'); ?>">
			Create profile
		</a>
		<div class="group">
		<?php $this->widget('zii.widgets.CListView', array(
			'dataProvider'=>$profile,
			'itemView'=>'_profile',
			'template'=>'{items}',	
			//'emptyText' => '',
			//'summaryText' => '',
		)); ?>
		</div>		
		<?php if(Profile::model()->exists()): ?>
		<li class="each"><a  class="viewall" title="View more profiles" href="<?php echo Yii::app()->createUrl('/profile/');?>">more</a></li>
		<?php endif; ?>
	</div>
	 
</div>

<?php elseif(Yii::app()->user->checkAccess('user')): ?> 

<div class="main_dashboard">

	<div class="dash dash_message">
		<strong class="title">Most recent messages</strong>
		<!--<a id="add" title="Create new message" href="<?php echo Yii::app()->createUrl('/message/create');?>">
			Create message
		</a>-->
		<div class="group">
		<?php $this->widget('zii.widgets.CListView', array(
			'dataProvider'=>$dataProvider,
			'itemView'=>'_message',
			'template'=>'{items}',	
			//'emptyText' => '',
			//'summaryText' => '',
		)); ?>
		</div>	
		<?php if(Message::model()->exists()): ?>
		<li class="each"><a class="viewall" title="View more messages" href="<?php echo Yii::app()->createUrl('/message/');?>">more</a></li>
		<?php endif; ?>
	</div>
	<div class="dash dash_vacation">
		<strong class="title">Most recent vacations</strong>
		<a id="add" style="line-height: 26px;" title="Create new vacation" href="<?php echo Yii::app()->createUrl('/vacation/create');?>">
			Create vacation
		</a>
		<div class="group">
		<?php $this->widget('zii.widgets.CListView', array(
			'dataProvider'=>$vacation,
			'itemView'=>'_vacation',
			'template'=>'{items}',	
			//'emptyText' => '',
			//'summaryText' => '',
		)); ?>
		</div>
		<?php if(Vacation::model()->exists()): ?>
		<li class="each"><a  class="viewall" title="View more vacations" href="<?php echo Yii::app()->createUrl('/vacation/');?>">more</a></li>
		<?php endif; ?>
	</div>
	 
</div>


<?php endif; ?>

<script type="text/javascript">
	var countItem = <?php echo $dataProvider->getTotalItemCount()?>;
	if(countItem == 0) { $('.search-form').toggle(); }
</script>
	
