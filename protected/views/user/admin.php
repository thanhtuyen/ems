<?php
/* @var $this UserController */
/* @var $model User */

$this->breadcrumbs=array(
	'Users'=>array('index'),
	'Manage',
);

// $this->menu=array(
// 	array('label'=>'List User', 'url'=>array('index')),
// 	array('label'=>'Create User', 'url'=>array('create')),
// );

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){

    $('#user-grid').yiiGridView('update', {
        data: $(this).serialize()
    });
    name = $('#user-grid2').attr('value');
    if (name) {

         $('#user-grid2').yiiGridView('update', {
            data: $(this).serialize()
	    });
    }


	return false;
});
");
?>

<?php echo CHtml::link(CHtml::image( Yii::app()->request->baseUrl .'/images/search-blue.png', 'DORE'),'#',array('class'=>'search-button')); ?>Search

<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
	'roles' => $roles

)); 

	$modelDeactive=new CActiveDataProvider('User', array(
	            'criteria'=>array(
	                'condition'=>'status=2',
	                'order'=>'id ASC',
	            ),
	        ));
?>
</div><!-- search-form -->
<?php $this->widget('bootstrap.widgets.TbTabs', array(
    'id' => 'mytabs',
    'type' => 'tabs',
    'tabs' => array(
      array('id' => 'tab1', 'label' => 'Active', 'content' => $this->renderPartial('listActive', array('model' => $model), true), 'active' => true),
      array('id' => 'tab2', 'label' => 'Deactive', 'content' =>$this->renderPartial('listDeactive', array('model' => $model), true)),
      array('id' => 'tab6', 'label' => 'New User', 'url' => '../User/create', true),
    ),
    'events'=>array('shown'=>'js:loadContent')
  )
);?>





