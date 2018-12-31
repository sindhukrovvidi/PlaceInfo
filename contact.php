<?php
require '/usr/share/php/libphp-phpmailer/PHPMailerAutoload.php';
include("config.php");
$cname = $_POST['cname'];
$cemail = $_POST['cemail'];
$cmsg = $_POST['cmessage'];

$emaillen = strlen( $cemail );
$i=$emaillen;
$char = substr( $cemail, $emaillen-10, 10 );
if(strcmp($char,'@gmail.com')!=0&&strcmp($char,'@yahoo.com')!=0)
{
  echo "Invalid mail";
}
$mail = new PHPMailer;
$mail->setFrom($cemail);
$mail->addAddress('booktickz@gmail.com');
$mail->Subject = 'Query from a Customer: Name - '.$cname.'';
$mail->Body = 'The Message from the Customer is as Follows : '.$cmsg.' ';
$mail->isHTML(false);
if(!$mail->send()) 
{
	echo '<script type="text/javascript">';
  	echo 'alert("Email is not sent");';
  	echo 'location.href="/ncp/index.html"';
  	echo '</script>';
	echo 'Email error: ' . $mail->ErrorInfo;
}
else
{
	echo '<script type="text/javascript">';
  	echo 'alert("Thankyou. Sent");';
  	echo 'location.href="/ncp/index.html"';
  	echo '</script>';
}

?>
