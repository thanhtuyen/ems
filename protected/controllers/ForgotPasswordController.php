<?php
/**
 * Created by JetBrains PhpStorm.
 * User: TuyenNT
 * Date: 9/23/13
 * Time: 4:39 PM
 * To change this template use File | Settings | File Templates.
 */
class ForgotPasswordController extends Controller {

    public function actionForgotPassword()
    {
        $this->layout="login";
        $form = new ForgotPassword;

        // Uncomment the following line if AJAX validation is needed
        //$this->performAjaxValidation($form);

        if(isset($_POST['ForgotPassword']))
        {
            $form->email = $_POST['ForgotPassword']['email'];
            // validate user input and set a sucessfull flassh message if valid
            if($form->validate())
            {

                $users = User::model()->findByAttributes(array('email'=>$form->email));
                if($users) {
                    //sending e-mail to user
                    $this::sendForgotPasswordEmail($form->getFullName(), $form->email, $form->token);
                    //Yii::app()->user->setFlash('success', $form->user_email . " has been actived to change pass." );
                    $form = new ForgotPassword;
                    $form->status = 'success';
                } else {

                    Yii::app()->user->setFlash('warn_status', "email not exits!" );
                }
            }
           // echo 3;die;
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

}