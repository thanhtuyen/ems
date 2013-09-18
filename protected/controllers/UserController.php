<?php

class UserController extends Controller
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
	    
	         $arr =array('index','create', 'update', 'view', 'admin', 'changePassword', 'forgotPassword', 'deactive');   /* give all access to admin */
	    } elseif( Yii::app()->user->getState('roles') =="manager") {
	      	
	      	 $arr =array('index','create', 'update', 'view', 'admin', 'changePassword', 'forgotPassword');   /* give all access to manager*/
	    } elseif( Yii::app()->user->getState('roles') =="leader") {
	      	
	        $arr =array('index','create', 'update', 'view', 'admin', 'changePassword', 'forgotPassword');   /* give all access to leader*/
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
        //     array('allow',  // allow all users to perform 'index' and 'view' actions
        //         'actions'=>array('Changepassword'),
        //         'roles'=>array('user'),
        //     ),
        //     array('allow',  // allow all users to perform 'index' and 'view' actions
        //         'actions'=>array('index','view','update'),
        //         'roles'=>array('admin', 'manager', 'leader'),
        //     ),
        //     array('allow', // allow authenticated user to perform 'create' and 'update' actions
        //         'actions'=>array('create'),
        //         'roles'=>array('manager'),
        //     ),
        //     array('allow', // allow admin user to perform 'admin' and 'delete' actions
        //         'actions'=>array('admin'),
        //         'roles'=>array('leader'),
        //     ),
        //     array('deny',  // deny all users
        //         'roles'=>array(),
        //     ),
        // );
	}

	/*
  	*  init CSS and Javascript file
  	*/
    public function init(){
    	Yii::app()->clientScript->registerCssFile(Yii::app()->baseUrl.'/css/user.css');
         
        parent::init();
    }


	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$model = $this->loadModel($id);
		$dob = get_date($model->dob, null);
	    $lastVisit = get_date($model->lastvisit, null);
	    $createdDate = get_date($model->created_date, null);
	    if($model->updated_date) {
	    	$updatedDate = get_date($model->updated_date, null);
	    }
	    $updatedDate = null;
	    
	    $model->setAttribute('dob', $dob);
	    $model->setAttribute('lastvisit', $lastVisit);
	    $model->setAttribute('created_date', $createdDate);
	    $model->setAttribute('updated_date', $updatedDate);
		$this->render('view',array(
			'model'=>$model,
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new User;
		$employeemodel=new Employee('create');
		$roles = $model->getRoleOptions();
		$employeemodel->getDepartmentOption();
		$pass = $model->autoGeneralPass();
		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model, $employeemodel);

		if(isset($_POST['User']))
		{
			$model->attributes = Clean($_POST['User']);
        	$model->email = textlower($_POST['User']['email']);
			$model->password = encrypt($pass);
			$model->dob = $model->setUserDob($_POST['User']['dob']);
			$model->activkey = encrypt(microtime().$model->password);
			$model->created_date = gettime();
			// validate BOTH $model and $employeemodel

    		$model->validate();
        	$employeemodel->validate();

        	// End validate
			
			if($model->save()) {

				$logs = new ActivityLog;
		        if(isset($logs)) {
			        
			            $logs->activity_date = time();
			            $logs->user_id = Yii::app()->user->id;
						$logs->action_id = Yii::app()->user->id;	// 	User ID
						$logs->action_group = 'user';				// 	User Group
						$logs->activity_type = 5;					//	Create 
						$logs->ip_logged = Yii::app()->request->userHostAddress;
			            $logs->save();
			           
		        }
				$employeemodel->attributes = Clean($_POST['Employee']);
				$employeemodel->id = $model->id;
				$employeemodel->created_date =  gettime();
          		if(isset($_POST['Employee']['department_id'])) {
          			$employeemodel->setDepartment($_POST['Employee']['department_id']);
            	}		
				if($employeemodel->save()) {
					 $activation_url = $this->createAbsoluteUrl('/activation/Index',array("activkey" => $model->activkey, "email" => $model->email));
		            MailTransport::sendMail(
		              app()->params['noreplyEmail'],
		              $model->email,
		              'Welcome to EMS',
		              CController::renderPartial('emailwelcome',array('activation_url'=>$activation_url,'email'=>$model->email,'password'=>$pass),true,false)
		            );
		            
            		app()->user->setFlash('success', 'You create a new user successful !');
					$this->redirect(array('view','id'=>$model->id));
				}
			}
				
		}

		$this->render('create',array(
			'model'=>$model, 'employeemodel' => $employeemodel, 'roles' => $roles));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);
		$roles = $model->getRoleOptions();
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['User']))
		{
			$model->attributes = Clean($_POST['User']);
        	$model->email = textlower($_POST['User']['email']);
			$model->dob = $model->setUserDob($_POST['User']['dob']);
			$model->updated_date = gettime();
			if($model->save()) {
				//write log system
				$logs = new ActivityLog;
				if(isset($logs))
				{
					$logs->activity_date = time();
					$logs->user_id = Yii::app()->user->id;
					$logs->action_id = Yii::app()->user->id;	// 	User ID
					$logs->action_group = 'user';				// 	User Group
					$logs->activity_type = 6;					//	update User
					$logs->ip_logged = Yii::app()->request->userHostAddress;
					$logs->save();
				}  

				$this->redirect(array('view','id'=>$model->id));
			}
				
		}

		$this->render('update',array(
			'model'=>$model, 'roles' => $roles
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
		// $dataProvider=new CActiveDataProvider('User');
		// $this->render('index',array(
		// 	'dataProvider'=>$dataProvider,
		// ));
		Yii::app()->request->redirect(app()->createUrl('/User/Admin'));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new User('search');
		$roles = $model->getRoleOptions();
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['User']))
			$model->attributes=$_GET['User'];

		$this->render('admin',array(
			'model'=>$model, 'roles' => $roles
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return User the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=User::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param User $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='user-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}

	public function actionChangePassword($id)
	{
		if($id != app()->user->id) {
			throw new CHttpException(404,'You are not authorized to update This profile info !');
		}
		$model=$this->loadModel($id);
		$password = $model->password;
		// Uncomment the following line if AJAX validation is needed
		//$this->performAjaxValidation($model);
        /*print_r($_POST['User']);echo '</br>';
        print_r($password);echo '</br>';
        print_r($_POST['User']['user_old_password']);echo '</br>';
        exit;*/
		if(isset($_POST['User']))
		{
			
			if($model->encrypt($_POST['User']['old_password'])!=$password)
			{
				Yii::app()->user->setFlash('wrongPassword', "Your old password is invalid." ); 
			}
			else
			{
				$model->setScenario('changePassword');
				$model->password = $_POST['User']['password'];
				
				if($model->save()) {
				
					$logs = new ActivityLog;
					if(isset($logs))
					{
						$logs->activity_date = time();
						$logs->user_id = Yii::app()->user->id;
						$logs->action_id = $id;						// 	User ID
						$logs->action_group = 'user';				// 	User Group
						$logs->activity_type = 11;					// 	Change Password
						$logs->ip_logged = Yii::app()->request->userHostAddress;	
						$logs->save();
					}
					
					//send change password email to user
					Yii::app()->user->setFlash('changedPassword', "Your password is changed." ); 
					//$this->sendResetPasswordEmail($model->getFullName(), $model->user_email, $_POST['User']['user_password']);
					// if(Yii::app()->user->checkAccess('admin')||Yii::app()->user->checkAccess('manager'))
					$this->redirect(array('view','id'=>$model->id));		
				}
				/*else {
					print_r($model->getErrors());exit;
				}*/
			}
			
		}
				
		$this->render('changePassword',array(
			'model'=>$model,
		));
	}

	public function actionForgotPassword()
	{
		//$this->layout = '//layouts/resetPassword';
		$form = new User;
		
		// Uncomment the following line if AJAX validation is needed
		//$this->performAjaxValidation($form);
		
		if(isset($_POST['User']))
		{
			$form->email = $_POST['User']['email'];
			// validate user input and set a sucessfull flassh message if valid   
			if($form->validate())  
			{
				//sending e-mail to user
				$this->sendForgotPasswordEmail($form->getFullName(), $form->email, $form->token);
				//Yii::app()->user->setFlash('success', $form->user_email . " has been actived to change pass." ); 
				$form = new User;
				$form->status = 'success';				
			}
		}			
		$this->render('forgotPassword',array(
			'model'=>$form
		));
		
	}

	private function sendForgotPasswordEmail($fullName, $mailto, $token) {
		try {
			$to = $mailto;
			$url = Yii::app()->createAbsoluteUrl('user/resetPassword/?token='.$token);
			$subject = 'Reset your password';
			$body = 'Dear '.$fullName.',<br><br>';			
			$body .= 'Please click on this link: <a href="'.$url.'">'.$url.'</a> to reset your password.<br><br>';
			$body .= 'Please note that this link is only active for 6 hours after receipt. After this time limit has expired the link will not work and you will need to resubmit the password change request.';
			$body .= '<br><br>Best Regards,<br>';
			$body .= 'Validant vSource Team'; 
			MailTransport::sendMail(null, $to, $subject, $body, 'text/html');
		} catch (Exception $e) {
			    //echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
	}	

	public function actionDeactive($id)
	{
		if($id === app()->user->id) {
			throw new CHttpException(404,'You are not authorized to update This profile info !');
		}
		$model=$this->loadModel($id);
		$model->setScenario('deactive');
		// if($model->getUserRole($id)=='admin')
		// {			
		// 	Yii::app()->user->setFlash('warn_status', "You are requesting to deactive admin that you are not authorized!" ); 
		// 	if(!Yii::app()->user->checkAccess('manageUser'))
		// 		Yii::app()->request->redirect(Yii::app()->createUrl('/')); 
		// 	else
		// 		Yii::app()->request->redirect(Yii::app()->createUrl('/user/admin')); 
		// }
		
		if($model->status==0)
	    {
			Yii::app()->user->setFlash('warn_status', "You are requesting to deactive user that is deactive already!" ); 
			if(!Yii::app()->user->checkAccess('manageUser'))
				Yii::app()->request->redirect(Yii::app()->createUrl('/')); 
			else
				Yii::app()->request->redirect(Yii::app()->createUrl('/user/admin')); 
		}
		
		// if(!Yii::app()->user->checkAccess('admin'))
		// {
		// 	if($model->user_role == 'admin' || ($model->user_role == 'manager' && $id != Yii::app()->user->id))
		// 	{
		// 		Yii::app()->user->setFlash('warn_status', "You are requesting to deactive another manager/admin that you are not authorized!" ); 
		// 		if(!Yii::app()->user->checkAccess('manageUser'))
		// 			Yii::app()->request->redirect(Yii::app()->createUrl('/')); 
		// 		else
		// 			Yii::app()->request->redirect(Yii::app()->createUrl('/user/admin')); 
	 //        } 
		// }
				
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);
        //print_r($_POST);exit;
		if(isset($_POST['Deactive']))
		{	
			
			//$model->attributes=$_POST['User'];
			//$model->setStatus($_POST['User']['user_active']);	//	option - need change some code in _deactive
			$model->status = 0;	//	deactive
			if($model->save())
			{
			
				$logs = new ActivityLog;
				if(isset($logs))
				{
					$logs->activity_date = time();
					$logs->user_id = Yii::app()->user->id;
					$logs->action_id = $id;						// 	User ID
					$logs->action_group = 'user';				// 	User Group
					$logs->activity_type = 7;					// 	Deactive User
					$logs->ip_logged = Yii::app()->request->userHostAddress;					//	Log in
					$logs->save();
				} 
				
				$this->redirect(array('view','id'=>$model->id));
			}
		}

		$this->render('deactive',array(
			'model'=>$model,  		
		));
	}
}
