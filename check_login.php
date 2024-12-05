<?php
session_start();
$con=mysqli_connect('localhost','root','','shop_db');
$name=mysqli_real_escape_string($con,$_POST['name']);
$id=mysqli_real_escape_string($con,$_POST['id']);

$res=mysqli_query($con,"select * from user where fb_id='$id'");
$_SESSION['FB_ID']=$id;
$_SESSION['FB_NAME']=$name;
if(mysqli_num_rows($res)>0){
	
}else{
	mysqli_query($con,"insert into user(name,fb_id) values('$name','$id')");
}
?>