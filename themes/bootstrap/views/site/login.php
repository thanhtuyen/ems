<?php
/* @var $this SiteController */
/* @var $model LoginForm */
/* @var $form CActiveForm  */

$this->pageTitle=Yii::app()->name . ' - Login';
$this->breadcrumbs=array(
	'Login',
);
?>

<span id="title">Login</span>

<fieldset>
    <?php /** @var BootActiveForm $form */
    $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
        'id'=>'verticalForm',
        'type'=>'horizontal',
        'htmlOptions'=>array('class'=>'well'),
    )); ?>
    <?php echo $form->textFieldRow($model, 'username', array('class'=>'span3')); ?>
    <?php echo $form->passwordFieldRow($model, 'password', array('class'=>'span3')); ?>
    <?php echo $form->checkboxRow($model, 'rememberMe'); ?>
    <?php $this->widget('bootstrap.widgets.TbButton', array('htmlOptions'=>array('class'=>'btn'), 'buttonType'=>'submit', 'label'=>'Sign In')); ?>
    <div id="forgotpass">
        <a href="<?php echo app()->homeUrl; ?>">Forgot password?</a>
    </div>
</fieldset>
<?php $this->endWidget(); ?>
