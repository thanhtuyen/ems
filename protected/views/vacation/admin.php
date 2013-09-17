<?php
/* @var $this VacationController */
/* @var $model Vacation */

$this->breadcrumbs=array(
	'Vacations'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List Vacation', 'url'=>array('index')),
	array('label'=>'Create Vacation', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#vacation-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Vacations</h1>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'vacation-grid',
	'dataProvider'=>$model->search(),
	//'filter'=>$model,
	'columns'=>array(
		array('name' => 'fullname',
			'value' => '$data->user->fullname',
			'htmlOptions'=>array('width'=>150,'align'=>'center'),),
		array('name' => 'request_day',
			'value' => '$data->getrequestDay()'),
		array('name' => 'start_date',
			'value' => '$data->getstartDate()'),
		array('name' => 'end_date',
			'value' => '$data->getEnddate()'),
		'total',
		'type',
		array('name' => 'status',
			'value' => '$data::getStatusName($data->status)'),
		
		//'reason',
		/*
		'user_id',
		'approve_id',
		'created_date',
		'status',
		'updated_date',
		*/
		array(
					'class'=>'CButtonColumn',
					'template'=>'{update} {view}',
					'header'=>'Actions',
					'buttons'=>array(
									'update' => array(    									   
										'imageUrl'=>Yii::app()->request->baseUrl.'/images/ico_edit.png',
			                            'url'=>'Yii::app()->createUrl("vacation/update",array("id"=>$data->id))',
									), 
			                        'view' => array(
			                            'imageUrl'=>Yii::app()->request->baseUrl.'/images/view.png',
			                            'url'=>'Yii::app()->createUrl("vacation/view",array("id"=>$data->id))',
			                        ),
	                ),
					'htmlOptions'=>array('width'=>100,'align'=>'center'),
	         ),
	),
)); ?>
