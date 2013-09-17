<?php
/* @var $this MessageController */
/* @var $model Message */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'message-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'types'); ?>
		<?php echo $form->textField($model,'types',array('size'=>11,'maxlength'=>11)); ?>
		<?php echo $form->error($model,'types'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'status'); ?>
		<?php echo $form->textField($model,'status',array('size'=>11,'maxlength'=>11)); ?>
		<?php echo $form->error($model,'status'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'created_date'); ?>
		<?php echo $form->textField($model,'created_date'); ?>
		<?php echo $form->error($model,'created_date'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'message_info'); ?>
		<?php echo $form->textArea($model,'message_info',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'message_info'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'mod_user_id'); ?>
		<?php echo $form->textField($model,'mod_user_id',array('size'=>11,'maxlength'=>11)); ?>
		<?php echo $form->error($model,'mod_user_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'mod_sender_id'); ?>
		<?php echo $form->textField($model,'mod_sender_id',array('size'=>11,'maxlength'=>11)); ?>
		<?php echo $form->error($model,'mod_sender_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'title'); ?>
		<?php echo $form->textField($model,'title',array('size'=>60,'maxlength'=>500)); ?>
		<?php echo $form->error($model,'title'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->