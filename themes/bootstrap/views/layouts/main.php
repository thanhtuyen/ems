<?php /* @var $this Controller */ ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

    <link rel="stylesheet" type="text/css" href="<?php echo app()->theme->baseUrl; ?>/css/styles.css" />
    <link rel="shortcut icon" href="<?php echo app()->theme->baseUrl; ?>/images/ico/title.png" type="image/x-icon" />

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>

<?php   
    Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . '/js/jquery.functions.js');   
    Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . '/js/vacation.js');   
    Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . '/js/jquery.tools.min.js');   
    Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . '/js/jquery.fcbkcomplete.min.js');   
    Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . '/js/jquery.counter-1.0.min.js');   
    Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . '/js/jquery.ui.stars.min.js');   
    Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . '/js/jquery.tmpl.min.js');   
    Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . '/js/flowplayer-3.2.6.min.js');     
?>
</head>

<body>

<a href="<?php echo app()->createUrl('/site/index');?>"><img class="img" src="<?php echo app()->theme->baseUrl; ?>/images/ico/mainnav.png" alt="Image"></a>
<?php $this->widget('bootstrap.widgets.TbNavbar',array(
    'items'=>array(
        array(
            'class'=>'bootstrap.widgets.TbMenu',
            'items'=>array(
                /*
                array('label'=>'Home', 'url'=>array('/site/index')),
                array('label'=>'About', 'url'=>array('/site/page', 'view'=>'about')),
                array('label'=>'Contact', 'url'=>array('/site/contact')),
                array('label'=>'Login', 'url'=>array('/site/login'), 'visible'=>app()->user->isGuest),
                array('label'=>'Logout ('.app()->user->name.')', 'url'=>array('/site/logout'), 'visible'=>!app()->user->isGuest)
                */
                array(
                    'label'=>'Dasboard',
                    'url'=>array('/Site/Index')
                ),
                array(
                    'label'=>'Profile',
                    'url'=>array('/Employee/Admin'),
                   // 'visible'=>(app()->user->role =='admin' || app()->user->role =='manager' || app()->user->role =='leader' || app()->user->role =='hr')
                ),
                array(
                    'label'=>'User',
                    'url'=>array('/User/Admin'),
                   // 'visible'=>(app()->user->role =='admin' || app()->user->role =='manager' || app()->user->role =='leader')
                ),
              array(
                'label'=>'Contract',
                'url'=>array('/Contract/Admin'),
                //'visible'=>(app()->user->role =='admin' || app()->user->role =='hr' || app()->user->role =='accountant')
              ),
               array(
                'label'=>'Vacation',
                'url'=>array('/Vacation/Admin'),
                //'visible'=>(app()->user->role =='admin' || app()->user->role =='hr' || app()->user->role =='accountant')
              ),
            ),
        ),
        array(
            'class'=>'bootstrap.widgets.TbMenu',
            'htmlOptions'=>array('class'=>'pull-right'),
            'items'=>array(
                //array('label'=>'Login', 'url'=>array('/site/login'), 'visible'=>webapp()->user->isGuest),
                array('label'=>'Welcome  '.app()->user->getState('fullName').' ['.app()->user->getState('roles').']', 'url'=>'#', 'items'=>array(
                    array('label'=>'My Account', 'url'=>array('/User/view/'.app()->user->id)),
                    array('label'=>'Change Password', 'url'=>array('/User/Changepassword/'.app()->user->id)),
                    array('label'=>'Logout', 'url'=>array('/Site/Logout'), 'visible'=>!app()->user->isGuest)
                )),
            ),
        ),
    ),
)); ?>

<div class="container">

	<?php if(isset($this->breadcrumbs)):?>
		<?php $this->widget('bootstrap.widgets.TbBreadcrumbs', array(
			'links'=>$this->breadcrumbs,
		)); ?><!-- breadcrumbs -->
	<?php endif?>

	<?php echo $content; ?>

	<div class="clear"></div>

    <hr>
    <div id="footer">

        <div id="distance2">
            <div id="block-bottom" style="margin-top: 2em;">
                <div class="wrapper">
                    <div class="grid-block" id="toolbar">
                        <div class="float-left">

                            <div class="module  deepest">
                                <ul class="bottom_left">
                                    <li class="databases">
                                        <a title="" target="_blank" href="http://www.hcmutrans.edu.vn/" class="mootip">
                                            <strong style="float: left">Ho Chi Minh City University of Transport</strong>
                                        </a>
                                    </li>
                                    <li class="messages">
                                        <a title="" target="_blank" href="http://www.hcmutrans.edu.vn/khoa/cntt/Web/index.php" class="mootip">
                                            <strong style="float: left">IT science</strong>
                                        </a>
                                    </li>
                                    <li class="options">
                                        <a title="" target="_blank" href="http://www.facebook.com/groups/CN11LT.dhgtvt/" class="mootip">
                                            <strong style="float: left">CN11LT</strong>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="float-right">
                            <div class="module  deepest">
                                <ul class="bottom_right">
                                    <li class="users">
                                        <a title="" href="#" style="text-decoration: none" class="mootip">
                                            <strong>EMS</strong>
                                        </a>
                                    </li>
                                    <li class="right_info">
                                        Graduate Internship Project
                                    </li>
                                    <li class="right_info">
                                        Employee Management System
                                    </li>
                                    <li class="right_info">
                                        version: v1.0
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

	</div><!-- footer -->

</div><!-- page -->

</body>
</html>
