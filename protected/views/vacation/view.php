<?php
/* @var $this VacationController */
/* @var $model Vacation */

$this->breadcrumbs=array(
	'Vacations'=>array('index'),
	$model->id,
);

// $this->menu=array(
// 	array('label'=>'List Vacation', 'url'=>array('index')),
// 	array('label'=>'Create Vacation', 'url'=>array('create')),
// 	array('label'=>'Update Vacation', 'url'=>array('update', 'id'=>$model->id)),
// 	array('label'=>'Delete Vacation', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
// 	array('label'=>'Manage Vacation', 'url'=>array('admin')),
// );
?>
	<?php
	    $this->widget('bootstrap.widgets.TbAlert', array(
	      'block'=>true, // display a larger alert block?
	      'fade'=>true, // use transitions?
	      'closeText'=>'×', // close link text - if set to false, no close link is displayed
	      'alerts'=>array( // configurations per alert type
	        'success'=>array('block'=>true, 'fade'=>true, 'closeText'=>'×'), // success, info, warning, error or danger
	        'info'=>array('block'=>true, 'fade'=>true, 'closeText'=>'×'),
	        'warning'=>array('block'=>true, 'fade'=>true, 'closeText'=>'×'),
	        'error'=>array('block'=>true, 'fade'=>true, 'closeText'=>'×'),
	      ),
	    ));

	    if(app()->user->hasFlash('error')){
	      echo app()->user->getFlash('error');
	    } elseif(app()->user->hasFlash('warning')){
	      echo app()->user->getFlash('warning');
	    } elseif(app()->user->hasFlash('info')){
	      echo app()->user->getFlash('info');
	    } elseif(app()->user->hasFlash('success')){
	      echo app()->user->getFlash('success');
	    }
	?>
	<div class = "view_user">
		<h3>View Vacation of <?php echo $modelUser->fullname; ?></h1>
		<h4>This vaction is <span style="color:red;"><?php echo $model::getStatusName($model->status);?></span></h4>
		<?php $this->widget('bootstrap.widgets.TbDetailView', array(
			'data'=>$model,
			'attributes'=>array(
			//	'id',
				'start_date',
				'end_date',
				'total',
				'type',
				'reason',

			//	'user_id',
			//	'approve_id',
			//	'created_date',
				//'status',
				//'updated_date',
			),
		)); ?>
	</div>