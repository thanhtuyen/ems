<?php
/* @var $this EmployeeController */
/* @var $model Employee */

$this->breadcrumbs=array(
	'Employees'=>array('index'),
	'Manage',
);

// $this->menu=array(
// 	array('label'=>'List Employee', 'url'=>array('index')),
// 	array('label'=>'Create Employee', 'url'=>array('create')),
// );

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#employee-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

zzzzzzzzzzzzz
<?php echo CHtml::link(CHtml::image( Yii::app()->request->baseUrl .'/images/search-blue.png', 'DORE'),'#',array('class'=>'search-button')); ?>Search

<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'employee-grid',
	'dataProvider'=>$model->search(),
	//'filter'=>$model,
	'columns'=>array(
		'id',
		'job_title',
		'degree',
		'degree_name',
		'background',
		'telephone',
		'department_id',
		/*
		'mobile',
		'homeaddress',
		'education',
		'skill',
		'experience',
		'notes',
		'avatar',
		'cv',
		'department',
		'created_date',
		'updated_date',
		'personal_email',
		*/
		array(
					'class'=>'CButtonColumn',
					'template'=>'{deactive} {update} {view}',
					'header'=>'Actions',
					'buttons'=>array(
									'deactive' => array(									
										'label'=>'Deactive',
										'imageUrl'=>Yii::app()->request->baseUrl.'/images/delete.png',
										'url'=>'Yii::app()->createUrl("employee/deactive",array("id"=>$data->id))',
									),
									
									'update' => array(    									   
										'imageUrl'=>Yii::app()->request->baseUrl.'/images/ico_edit.png',
			                            'url'=>'Yii::app()->createUrl("employee/update",array("id"=>$data->id))',
									), 
			                        'view' => array(
			                            'imageUrl'=>Yii::app()->request->baseUrl.'/images/view.png',
			                            'url'=>'Yii::app()->createUrl("employee/view",array("id"=>$data->id))',
			                        ),
	                ),
					'htmlOptions'=>array('width'=>100,'align'=>'center'),
	         ),
	),
)); ?>
