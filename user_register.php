

<?php

include 'components/connect.php';

session_start();
$message = []; // Initialize an empty array to store validation messages


if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

if(isset($_POST['submit'])){


   $name = $_POST['name'];
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);
   $phone = $_POST['phone'];
   $phone = filter_var($phone, FILTER_SANITIZE_STRING);
   // Validate and sanitize the phone number
   $phone_pattern = '/^\+?[0-9]{1,}$/'; // Adjust the pattern based on your requirements
   if (!preg_match($phone_pattern, $phone)) {
      $message[] = 'Invalid phone number!';
   }
  
      $gender = $_POST['gender'];
      $gender = filter_var($gender, FILTER_SANITIZE_STRING);
   
      // Validate the gender (optional)
      $allowed_genders = ['male', 'female', 'other'];
      if (!in_array($gender, $allowed_genders)) {
         $message[] = 'Invalid gender!';
      }
   

   $birthday = $_POST['birthday'];
   $birthday = filter_var($birthday, FILTER_SANITIZE_STRING);
    //Validate and sanitize the date format (optional)
     $birthday = date('Y-m-d', strtotime($_POST['birthday']));


    $birthday = $_POST['birthday'];
    $validated_date = DateTime::createFromFormat('Y-m-d', $birthday);
    
    if (!$validated_date || $validated_date->format('Y-m-d') !== $birthday) {
       $message[] = 'Invalid birthday format!';
    
     } else {
        // Check if the user is at least 13 years old
        $today = new DateTime();
        $age = $today->diff($validated_date)->y;
  
        if ($age < 13) {
           $message[] = 'You must be at least 13 years old to register!';
        } else {
           $pass = sha1($_POST['pass']);
           $pass = filter_var($pass, FILTER_SANITIZE_STRING);
           $cpass = sha1($_POST['cpass']);
           $cpass = filter_var($cpass, FILTER_SANITIZE_STRING);


   $select_user = $conn->prepare("SELECT * FROM `users` WHERE email = ?");
   $select_user->execute([$email,]);
   $row = $select_user->fetch(PDO::FETCH_ASSOC);


   if($select_user->rowCount() > 0){
      $message[] = 'Email already exists!';
   }else{
      if($pass != $cpass){
         $message[] = 'Confirm password not matched!';
      }else{
        $insert_user = $conn->prepare("INSERT INTO `users`(name, email, password, birthday, phone, gender) VALUES(?,?,?,?,?,?)");
        $insert_user->execute([$name, $email, $cpass, $birthday, $phone, $gender]);
       
         
         $message[] = 'registered successfully, login now please!';         
         
        
         
      }
   }
        }
    }
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">

 

   <style>
      /* Import Google font - Poppins */
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");

.container {
  position: relative;
   max-width: 700px;
  width: 100%; 

  border-radius: 8px;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}
.container header {
  font-size: 3rem;
  color: #333;
  font-weight: 500;
  text-align: center;
}
.container .form {
  margin-top: 30px;
}
.form .input-box {
  width: 100%;
  margin-top: 20px;
}
.input-box label {
  color: #333;
  font-size :2rem;
}
.form :where(.input-box input, .select-box) {
  position: relative;
  height: 50px;
  width: 100%;
  outline: none;
  font-size: 2rem;
  color: #707070;
  margin-top: 8px;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding: 0 15px;
}
.input-box input:focus {
  box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
}
.form .column {
  display: flex;
  column-gap: 15px;
}
.form .gender-box {
  margin-top: 20px;
}
.gender-box h3 {
  color: #333;
  font-size: 2rem;
  font-weight: 400;
  margin-bottom: 8px;
}
.form :where(.gender-option, .gender) {
  display: flex;
  align-items: center;
  column-gap: 50px;
  flex-wrap: wrap;
}
.form .gender {
  column-gap: 5px;
}
.gender input {
  accent-color: rgb(130, 106, 251);
}
.form :where(.gender input, .gender label) {
  cursor: pointer;
}
.gender label {
  color: #707070;
  font-size:2rem;
}
.form button {
  height: 55px;
  width: 100%;
  color: #fff;
  font-size: 1rem;
  font-weight: 400;
  margin-top: 30px;
  border: none;
  cursor: pointer;
  transition: all 0.2s ease;
  background: rgb(130, 106, 251);
}
.form button:hover {
  background: rgb(88, 56, 250);
}
/*Responsive*/
@media screen and (max-width: 500px) {
  .form .column {
    flex-wrap: wrap;
  }
  .form :where(.gender-option, .gender) {
    row-gap: 15px;
  }
}
      </style>
   <title>Register</title>
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
 

<?php include 'components/user_header.php'; ?>

<br><br><br><br><br>
    <section class="container">
      <header>Registration Form</header>
      <form action="" method="post" class="form">
        <div class="input-box">
          <label>User Name</label>
          <input type="text" name="name" required placeholder="enter your username" maxlength="20"  class="box">
        </div>

        <div class="input-box">
          <label>Email Address</label>
          <input type="email" name="email" required placeholder="enter your email" maxlength="50"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
          <!-- <input type="text" placeholder="Enter email address" required /> -->
        </div>

        <div class="column">
          <div class="input-box">
            <label>Phone Number</label>
      <input type="tel" name="phone" required pattern="^\+?[0-9]{1,}$" placeholder="enter your phone number" class="box">

          </div>
          <div class="input-box">
            <label>Date Of Birth</label>
            <input type="date" name="birthday" required pattern="\d{4}-\d{2}-\d{2}" placeholder="enter your birthday" class="box">
          </div>
        </div>
<label>
        <div class="gender-box">
          <h3>Gender</h3>
          <div class="gender-option">
            <div class="gender">
            <input type="radio" name="gender" value="male" required> 
            
              <label for="check-male">male</label>
            </div>
            <div class="gender">
            <input type="radio" name="gender" value="female" required> 
              <label for="check-female">Female</label>
            </div>
            <div class="gender">
            <input type="radio" name="gender" value="other" required>
              <label for="check-other">Other</label>
            </div>
          </div>
        </div>
        <div class="column">
          <div class="input-box">
            <label>Password</label>
            <input type="password" name="pass" required placeholder="enter your password" maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
          </div>
          <div class="input-box">
            <label>Confirm Password</label>
            <input type="password" name="cpass" required placeholder="confirm your password" maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
          </div>
        </div>

        <input type="submit" value="register now" class="btn" name="submit">


	
   </form> 

</section>

<?php include 'components/footer.php'; ?>
<div class="space" ></div>

<script src="js/script.js"></script>

 <!-- for google signin -->

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"></script>
  
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</body>
</html>