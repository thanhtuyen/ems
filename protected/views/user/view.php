<style type="text/css">
  A:link {text-decoration: none}
  A:visited {text-decoration: none}
  A:active {text-decoration: none}
  A:hover {text-decoration: none;}
</style>
<?php
/* @var $this UserController */
/* @var $model User */

$this->breadcrumbs=array(
	'Users'=>array('index'),
	$model->id,
);

// $this->menu=array(
// 	array('label'=>'List User', 'url'=>array('index')),
// 	array('label'=>'Create User', 'url'=>array('create')),
// 	array('label'=>'Update User', 'url'=>array('update', 'id'=>$model->id)),
// 	array('label'=>'Delete User', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
// 	array('label'=>'Manage User', 'url'=>array('admin')),
// );
?>
<p>
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
    }elseif(app()->user->hasFlash('changedPassword')) {
      echo app()->user->getFlash('changedPassword');
    }
    ?>
  </p>
  	<div class = "view_user">
      <button style="float: right; margin-right: 5px;""><a onclick="history.go(-1);">Cancel</a></button>
      <button style="float: right; margin-right: 5px;"><a href="<?php print Yii::app()->createUrl('/user/update', array('id'=>$model->id));?>">Update User</a></button>

      <h3 class="title" ><?php echo $model->fullname; ?></h3>

      <?php $this->widget('bootstrap.widgets.TbDetailView',array(
        'data'=>$model,
        'attributes'=>array(
        'firstname',
        'lastname',
          'fullname',
      	'email',
        'dob',
      	'lastvisit',
      	'created_date',
         array('name' => 'updated_date',
               'value' => $model->updated_date? date('M-d-Y',$model->updated_date):''),

    	),
  		)); ?>
	    </br>
      <?php
      if($model->status == 1) {
        $this->widget('bootstrap.widgets.TbButton',array(
          'label' => 'Deactive User',
          //'type' => 'danger',
          'size' => 'small',
          'url'  => array('user/deactive','id'=>$model->id),
        ));
      } else {
        $this->widget('bootstrap.widgets.TbButton',array(
          'label' => 'Active User',
          //'type' => 'danger',
          'size' => 'small',
          'url'  => array('user/active','id'=>$model->id),
        ));
      }

      ?>
	  </div>
