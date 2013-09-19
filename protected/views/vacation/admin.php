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
 



<?php 
	$modelWaiting=new CActiveDataProvider('Vacation', array(
	            'criteria'=>array(
	                'condition'=>'status=1',
	                'order'=>'id ASC',
	            ),
	        ));

	$modelCancel=new CActiveDataProvider('Vacation', array(
	            'criteria'=>array(
	                'condition'=>'status=2',
	                'order'=>'id ASC',
	            ),
	        ));

	$modelAccepted=new CActiveDataProvider('Vacation', array(
	            'criteria'=>array(
	                'condition'=>'status=3',
	                'order'=>'id ASC',
	            ),
	        ));
	$modelDecline=new CActiveDataProvider('Vacation', array(
	            'criteria'=>array(
	                'condition'=>'status=5',
	                'order'=>'id ASC',
	            ),
	        ));

?>


<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('bootstrap.widgets.TbTabs', array(
    'id' => 'mytabs',
    'type' => 'tabs',
    'tabs' => array(
      array('id' => 'tab1', 'label' => 'All Vacation', 'content' => $this->renderPartial('allVacation', array('model' => $model), true), 'active' => true),
      array('id' => 'tab2', 'label' => 'Awaiting', 'content' =>$this->renderPartial('listAwaiting', array('modelWaiting' => $modelWaiting), true)),
      array('id' =>  'tab3', 'label' => 'Request Cancel', 'content' =>$this->renderPartial('listRequestCancel', array('modelCancel' => $modelCancel), true)),
      array('id' => 'tab4', 'label' => 'Accepted', 'content' => $this->renderPartial('listAccepted', array('modelAccepted' => $modelAccepted), true)),
      array('id' => 'tab5', 'label' => 'Decline', 'content' => $this->renderPartial('listDecline', array('modelDecline' => $modelDecline), true)),
      array('id' => 'tab6', 'label' => 'New Vacation', 'url' => '../Vacation/create', true),
    ),
    'events'=>array('shown'=>'js:loadContent')
  )
);?>




