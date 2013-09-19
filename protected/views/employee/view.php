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
	<div class="wraper">
		<div class="employee_left">
			<span class="img_avatar">
			<?php 
			if($model->avatar) {
				$imagestring = Yii::app()->request->baseUrl.'/media/images/thumbnails/'.$model->avatar;
			} else {
				$imagestring = Yii::app()->request->baseUrl.'/media/images/thumbnails/noAvatar.png';
			}
			echo CHtml::image($imagestring);
			?>
		</span>
		</div>
		<div class="employee_main">
			<span>Full Name:</span> <?php echo $model->id0->fullname;?></br>
			<span>Birthday:  </span><?php echo date('M-d-Y', $model->id0->dob);?></br>
			<span>Email:	</span>   <?php echo $model->id0->email;?>

		</div>
		<div class="employee_right">
			<?php 
			if($model->cv) {
				$cv = Yii::app()->request->baseUrl.'/media/cv/has_cv.png';
			} else {
				$cv = Yii::app()->request->baseUrl.'/media/cv/no_cv.png';
			}
			echo CHtml::image($cv);
			?>
		</div>
	</div>
	
	<?php $this->widget('zii.widgets.CDetailView', array(
		'data'=>$model,
		'attributes'=>array(
			'job_title',
			'degree',
			'degree_name',
			'background',
			array('name' => 'telephone',
			 		'value' => '0'.$model->telephone),
			array('name' => 'mobile',
			 		'value' => '0'.$model->mobile),
			'homeaddress',
			array('name' => 'department_id',
				  'value' => $model->departments->name),

			'personal_email',
		),
	)); ?>
	<div class="view_tab_employee">
		<?php $this->widget('bootstrap.widgets.TbTabs', array(
	    'id' => 'mytabs',
	    'type' => 'tabs',
	    'tabs' => array(
	      array('id' => 'tab1', 'label' => 'Education', 'content' => $model->education, 'active' => true),
	      array('id' => 'tab2', 'label' => 'Skill', 'content' => $model->skill, true),
	      array('id' =>  'tab3', 'label' => 'Experience', 'content' => $model->experience, true),
	      array('id' => 'tab4', 'label' => 'Note', 'content' => $model->notes, true),

	      //array('id' => 'tab5', 'label' => 'Decline', 'content' => $this->renderPartial('listDecline', array('modelDecline' => $modelDecline), true)),
	      //array('id' => 'tab6', 'label' => 'New Vacation', 'url' => '../Vacation/create', true),
	    ),
	    'events'=>array('shown'=>'js:loadContent')
	  )
	);?>


	</br>
	</div>
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
