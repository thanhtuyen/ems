<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'employee-grid',
	'dataProvider'=>$model->search1(),
	//'filter'=>$model,
	'columns'=>array(
		'id',
		array('name' => 'fullname',
			  'value' => '$data->id0->fullname'),
		'job_title',
		'degree',
		'degree_name',
		//'background',
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
