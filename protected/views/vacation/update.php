<?php
/* @var $this VacationController */
/* @var $model Vacation */

$this->breadcrumbs=array(
	'Vacations'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

// $this->menu=array(
// 	array('label'=>'List Vacation', 'url'=>array('index')),
// 	array('label'=>'Create Vacation', 'url'=>array('create')),
// 	array('label'=>'View Vacation', 'url'=>array('view', 'id'=>$model->id)),
// 	array('label'=>'Manage Vacation', 'url'=>array('admin')),
// );
?>
<div class="update_employee">
	<h1>Update Vacation <?php echo $model->id; ?></h1>

	<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>
</div>