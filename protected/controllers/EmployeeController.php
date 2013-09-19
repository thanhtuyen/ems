<?php
//Yii::import('system.');

class EmployeeController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column2';

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
	    
	         $arr =array('index', 'update', 'view', 'admin');   /* give all access to admin */
	    } elseif( Yii::app()->user->getState('roles') =="manager") {
	      	
	      	 $arr =array('index', 'update', 'view', 'admin');   /* give all access to manager*/
	    } elseif( Yii::app()->user->getState('roles') =="leader") {
	      	
	        $arr =array('index', 'update', 'view', 'admin');   /* give all access to leader*/
	    } else {

	        $arr = array('view');    /*  no access to other user */
	    }
	  
        return array(array('allow',
                    'actions'=>$arr,
                    'users'=>array('@'),),
             array('deny',
                   'users'=>array('*'),),
            );
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
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Employee;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Employee']))
		{
			$model->attributes=$_POST['Employee'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}

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
		Yii::app()->clientScript->registerCssFile(Yii::app()->baseUrl.'/css/vacation.css');
		if($id === app()->user->id) {
			throw new CHttpException(404,'You are not authorized to update This profile info !');
		}
		$model=$this->loadModel($id);
		//print_r($model->cv);
		$departmentName = $model->department_id;
		
		//Yii::import('system.web.CUploadedFile');
		
		//echo $departmentName;die;
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);
		$model->setScenario('update');
		if(isset($_POST['Employee']))
		{

			$model->setAttributes(array('content_article'=>$_FILES['Employee']['name']['avatar'],
                                                       $_FILES['Employee']['name']['cv'],));

			$model->attributes = Clean($_POST['Employee']);
			$model->avatar = CUploadedFile::getInstance($model,'avatar');
			$model->cv = CUploadedFile::getInstance($model,'cv');
			
			
			$model->created_date = gettime();
			
			if(isset($_POST['Employee']['department_id'])) {
          			$model->setDepartment($_POST['Employee']['department_id']);
            }	

            if ($model->validate()) {
            	if($model->save())
				$this->redirect(array('view','id'=>$model->id));
            }	
			
		}

		$this->render('update',array(
			'model'=>$model, 'departmentName' => $departmentName
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
		// $dataProvider=new CActiveDataProvider('Employee');
		// $this->render('index',array(
		// 	'dataProvider'=>$dataProvider,
		// ));
		Yii::app()->request->redirect(app()->createUrl('/Employee/Admin'));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Employee('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Employee']))
			$model->attributes=$_GET['Employee'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Employee the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Employee::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Employee $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='employee-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
