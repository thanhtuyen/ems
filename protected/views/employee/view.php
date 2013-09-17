<?php
/* @var $this EmployeeController */
/* @var $model Employee */

$this->breadcrumbs=array(
	'Employees'=>array('index'),
	$model->id,
);

// $this->menu=array(
// 	array('label'=>'List Employee', 'url'=>array('index')),
// 	array('label'=>'Create Employee', 'url'=>array('create')),
// 	array('label'=>'Update Employee', 'url'=>array('update', 'id'=>$model->id)),
// 	array('label'=>'Delete Employee', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
// 	array('label'=>'Manage Employee', 'url'=>array('admin')),
// );
?>
<div class = "view_employee">
	<h1>View Employee #<?php echo $model->id; ?></h1>

	<?php $this->widget('zii.widgets.CDetailView', array(
		'data'=>$model,
		'attributes'=>array(
			'job_title',
			'degree',
			'degree_name',
			'background',
			'telephone',
			'mobile',
			'homeaddress',
			'education',
			'skill',
			'experience',
			'notes',
			// 'avatar',
			// 'cv',
			'department_id',
			// 'created_date',
			// 'updated_date',
			'personal_email',
		),
	)); ?>

	<div class="form-actions">
	      <?php $this->widget('bootstrap.widgets.TbButton', array(
	        'buttonType'=>'link',
	        'type'=>'primary',
	        'label'=>$model->id ? 'Update' : 'Edit',
	        'url'=>'../Employee/Update/'.$model->id,
	        'htmlOptions'=>array('style'=>'margin-left: 70px; bac '),
	      ));
	      if($model->isNewRecord){
	        $this->widget('bootstrap.widgets.TbButton', array(
	          'buttonType'=>'reset',
	          'htmlOptions'=>array('style'=>'margin-left: 10px;'),
	          'label'=>'Reset',
	        ));
	      } else {
	        $this->widget('bootstrap.widgets.TbButton', array(
	          //'buttonType'=>'link',
	          'label'=>'Cancel',
	          'htmlOptions'=>array('style'=>'margin-left: 10px;'),
	          'url'=>'../../Employee/Admin',
	        ));
	      }
	      ?>
	    </div>
</div>
