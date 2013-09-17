<?php

class VacationController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	//public $layout='//layouts/column2';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
			'postOnly + delete', // we only allow deletion via POST request
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		if( Yii::app()->user->getState('roles') =="admin") {
	    
	         $arr =array('index','create', 'update', 'view', 'admin', 'total');   /* give all access to admin */
	    } elseif( Yii::app()->user->getState('roles') =="manager") {
	      	
	      	 $arr =array('index','create', 'update', 'view', 'admin', 'total');   /* give all access to manager*/
	    } elseif( Yii::app()->user->getState('roles') =="leader") {
	      	
	        $arr =array('index','create', 'update', 'view', 'admin', 'total');   /* give all access to leader*/
	    } else {

	        $arr = array('view', 'changePassword', 'forgotPassword');    /*  no access to other user */
	    }

        return array(array('allow',
                    'actions'=>$arr,
                    'users'=>array('@'),),
             array('deny',
                   'users'=>array('*'),),
            );
		// return array(
		// 	array('allow',  // allow all users to perform 'index' and 'view' actions
		// 		'actions'=>array('index','view'),
		// 		'users'=>array('*'),
		// 	),
		// 	array('allow', // allow authenticated user to perform 'create' and 'update' actions
		// 		'actions'=>array('create','update'),
		// 		'users'=>array('@'),
		// 	),
		// 	array('allow', // allow admin user to perform 'admin' and 'delete' actions
		// 		'actions'=>array('admin','delete'),
		// 		'users'=>array('admin'),
		// 	),
		// 	array('deny',  // deny all users
		// 		'users'=>array('*'),
		// 	),
		// );
	}

	/*
  	*  init CSS and Javascript file
  	*/
    public function init(){
    	Yii::app()->clientScript->registerCssFile(Yii::app()->baseUrl.'/css/user.css');
    	Yii::app()->clientScript->registerCssFile(Yii::app()->baseUrl.'/css/employee.css');
         
        parent::init();
    }
	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{	
		$model = $this->loadModel($id);
		$startDate = get_date($model->start_date, null);
		// echo $model->start_date;
		// echo $startDate;die;
		$model->setAttribute('start_date', $startDate);
		$endDate = get_date($model->end_date, null);
		$model->setAttribute('end_date', $endDate);
		$type = $model->getReasonSearchArr();
		$model->setAttribute('type', $type[$model->type]);
		$modelUser = $this->loadModelUser($model->user_id);
		$this->render('view',array(
			'model'=>$model,'modelUser' => $modelUser
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Vacation;
		$user = User::model()->findByPk(Yii::app()->user->id);
		// Uncomment the following line if AJAX validation is needed
		 $this->performAjaxValidation($model);
		//print_r($_POST['Vacation']);die;

		if(isset($_POST['Vacation']))
		{

			$model->attributes = Clean($_POST['Vacation']);
			$model->setTimeVacation($_POST['Vacation']['time']);
			$model->created_date = gettime();
			$model->setStatus(1);
			$model->user_id = Yii::app()->user->id;
			// validate 
    		$model->validate();
    		echo "<pre>";
			print_r($model->start_date);
			if($model->save()) {
				echo "<pre>";
			print_r($model->start_date);die;
				$logs = new ActivityLog;
		        if(isset($logs)) {
			        
			            $logs->activity_date = time();
			            $logs->user_id = Yii::app()->user->id;
						$logs->action_id = Yii::app()->user->id;	// 	User ID
						$logs->action_group = 'user';				// 	User Group
						$logs->activity_type = 13;					//	Create 
						$logs->ip_logged = Yii::app()->request->userHostAddress;
			            $logs->save();
			           
		        }
			
		        $this->redirect(array('view','id'=>$model->id));
			}
				
		}
		$model->time = 'am';
		$this->render('create',array(
			'model'=>$model,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Vacation']))
		{
			$model->attributes=$_POST['Vacation'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('Vacation');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Vacation('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Vacation']))
			$model->attributes=$_GET['Vacation'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Vacation the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Vacation::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Vacation $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='vacation-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}

	public function actiontotal()
	{
		if(isset($_POST['Vacation']['type'])){
			$type = $_POST['Vacation']['type'];
		}
		if ($type == 0)   
			return array();
		
        $data = Vacation::model()->gettotalsarr($type);
        foreach ($data as $value => $name) {
            echo CHtml::tag('option',
                    array('value' => $value), CHtml::encode($name), true);
        }
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return User the loaded model
	 * @throws CHttpException
	 */
	public function loadModelUser($id)
	{
		$model=User::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}
}
