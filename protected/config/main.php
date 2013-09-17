<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');
Yii::setPathOfAlias('bootstrap', dirname(__FILE__).'/../extensions/bootstrap');
// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'',

	// preloading 'log' component
	'preload'=>array('log', 'bootstrap', 'mail'),
	//  Aplly Theme
    'theme'=>'bootstrap',

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
        'application.components.*',
        'application.extensions.*',
        'ext.bootstrap.*',
        'ext.yii-mail.*',
        
	),
    //'language' => 'vi',
    'defaultController' => 'dashboard',
	'modules'=>array(
		// uncomment the following to enable the Gii tool

		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'123',
			// If removed, Gii defaults to localhost only. Edit carefully to taste.
			'ipFilters'=>array('127.0.0.1','::1'),
		),

	),

	// application components
	'components'=>array(
		'user'=>array(
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
            'loginUrl'    =>    array('site/login')
		),
		// uncomment the following to enable URLs in path-format

		'urlManager'=>array(
			'urlFormat'=>'path',
			'rules'=>array(
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),

		),

       'bootstrap'=>array(
        'class'=>'bootstrap.components.Bootstrap',
        ), 
		/*'db'=>array(
			'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/testdrive.db',
		),*/
		// uncomment the following to use a MySQL database

		'db'=>array(
			'connectionString' => 'mysql:host=localhost;dbname=hrm1',
			'emulatePrepare' => true,
			'username' => 'root',
			'password' => '',
			'charset' => 'utf8',
		),

//        'authManager'=>array(
//            'class'=>'CDbAuthManager',
//            'connectionID'=>'db',
//        ),

        'errorHandler'=>array(
            // use 'site/error' action to display errors
            'errorAction'=>'site/error',
        ),
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),

		'mail' => array(
            'class' => 'ext.yii-mail.YiiMail',
            'transportType' => 'smtp', // change to 'php' when running in real domain.
            'viewPath' => 'application.views.mail',
            'logging' => true,
            'dryRun' => false,
            'transportOptions' => array(
                'host' => 'smtp.gmail.com',
                'username' => 'noreply.ems.project@gmail.com',
                'password' => 'pw-intern-2013',
                'port' => '465',
                'encryption' => 'ssl',
            )
        ),
	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'adm.ems.project@gmail.com',
        'adminName' => 'EMS System',
        'noreplyEmail' => 'noreply.ems.project@gmail.com',
        'noreplyName' => 'Noreply',
        'dateFormat' => 'MMM dd, yyyy [hh:mm]',
        'shortDateFormat' => 'MMM dd, yyyy',
        'pageSize' => '20',
	),
);