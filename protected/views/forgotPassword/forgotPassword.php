<span id="title">ForgotPassword</span>

<fieldset>
    <?php /** @var BootActiveForm $form */
//    if(app()->user->hasFlash('warn_status')){
//        echo app()->user->hasFlash('warn_status');
//    }
    $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
        'id'=>'verticalForm',
        'type'=>'horizontal',
        'htmlOptions'=>array('class'=>'well'),
    )); ?>
    <?php echo $form->textFieldRow($form, 'email', array('class'=>'span3')); ?>
    <?php $this->widget('bootstrap.widgets.TbButton', array('htmlOptions'=>array('class'=>'btn'), 'buttonType'=>'submit', 'label'=>'Process')); ?>
    <?php $this->widget('bootstrap.widgets.TbButton', array('htmlOptions'=>array('class'=>'btn'), 'url' => '../site/login', 'label'=>'Cancel')); ?>

</fieldset>
<?php $this->endWidget(); ?>
