<?php
include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

if(isset($_POST['send'])){
   $name = $_POST['name'];
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);
   $number = $_POST['number'];
   $number = filter_var($number, FILTER_SANITIZE_STRING);
   $msg = $_POST['msg'];
   $msg = filter_var($msg, FILTER_SANITIZE_STRING);

   $select_message = $conn->prepare("SELECT * FROM `messages` WHERE name = ? AND email = ? AND number = ? AND message = ?");
   $select_message->execute([$name, $email, $number, $msg]);

   if($select_message->rowCount() > 0){
      $message[] = 'Already sent a message!';
   } else {
      $insert_message = $conn->prepare("INSERT INTO `messages`(user_id, name, email, number, message) VALUES(?,?,?,?,?)");
      $insert_message->execute([$user_id, $name, $email, $number, $msg]);

      $message[] = 'Message sent successfully!';
   }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Contact Us</title>
   
   <!-- Font Awesome CDN link -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- Custom CSS file link -->
   <link rel="stylesheet" href="css/style.css">
   <style>
      /* Previous CSS Styles */
      /* Same as previous code... */
      * {
         margin: 0;
         padding: 0;
         box-sizing: border-box;
      }
      
      body {
         font-family: 'Arial', sans-serif;
         background-color: #f4f4f4;
         color: #333;
         line-height: 1.6;
      }

      h3 {
         font-size: 32px;
         font-weight: 600;
         color: #444;
         text-align: center;
         margin-bottom: 40px;
      }

      /* Contact Section */
      .contact {
         display: flex;
         justify-content: center;
         align-items: center;
         gap: 30px;
         padding: 60px 30px;
         background-color: #fff;
         border-radius: 10px;
         box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
         margin: 30px auto;
         width: 90%;
         max-width: 1200px;
      }

      .contact form {
         width: 45%;
         display: flex;
         flex-direction: column;
         gap: 20px;
      }

      .contact .box {
         width: 100%;
         padding: 14px;
         border-radius: 8px;
         border: 1px solid #ddd;
         font-size: 16px;
         transition: 0.3s;
      }

      .contact .box:focus {
         border-color: #FFB6C1;
         outline: none;
      }

      .contact .btn {
         padding: 14px;
         background-color: #FFB6C1;
         color: #fff;
         font-size: 18px;
         border: none;
         border-radius: 8px;
         cursor: pointer;
         transition: background-color 0.3s ease;
      }

      .contact .btn:hover {
         background-color: #FF69B4;
      }

      .contact .image-container {
         width: 45%;
         display: flex;
         justify-content: center;
         align-items: center;
      }

      .contact img {
         width: 100%;
         height: auto;
         border-radius: 10px;
         box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
         object-fit: cover;
      }


      /* Mobile Responsiveness */
      @media (max-width: 768px) {
         .contact {
            flex-direction: column;
            padding: 30px;
         }

         .contact form {
            width: 100%;
         }

         .contact .image-container {
            width: 100%;
            margin-top: 30px;
         }

         .contact img {
            width: 100%;
         }
      }
   </style>

   <!-- JavaScript for Form Validation -->
   <script>
      function validateForm() {
         // Name Validation: Only letters and spaces allowed
         var name = document.forms["contactForm"]["name"].value;
         var namePattern = /^[a-zA-Z\s]+$/; // Only alphabetic characters and spaces
         if (name == "") {
            alert("Name must be filled out.");
            return false;
         }
         if (!namePattern.test(name)) {
            alert("Name must only contain letters and spaces.");
            return false;
         }

         // Email Validation
         var email = document.forms["contactForm"]["email"].value;
         var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
         if (email == "" || !emailPattern.test(email)) {
            alert("Please enter a valid email address.");
            return false;
         }

         // Phone Number Validation
         var number = document.forms["contactForm"]["number"].value;
         var numberPattern = /^[0-9]{10}$/; // Validate 10 digit number
         if (number == "" || !numberPattern.test(number)) {
            alert("Please enter a valid 10-digit phone number.");
            return false;
         }

         // Message Validation
         var msg = document.forms["contactForm"]["msg"].value;
         if (msg == "") {
            alert("Message cannot be empty.");
            return false;
         }

         return true; // If all validations pass
      }
   </script>
</head>
<body>

<?php include 'components/user_header.php'; ?>
<div class="space"></div>

<section class="contact">
   <form name="contactForm" action="" method="post" onsubmit="return validateForm()">
      <h3>Get in Touch</h3>

      <input type="text" name="name" placeholder="Enter your name" required maxlength="50" class="box">
      <input type="email" name="email" placeholder="Enter your email" required maxlength="50" class="box">
      <input type="number" name="number" min="0" max="9999999999" placeholder="Enter your number" required onkeypress="if(this.value.length == 10) return false;" class="box">
      <textarea name="msg" class="box" placeholder="Enter your message" cols="30" rows="6"></textarea>
      <input type="submit" value="Send Message" name="send" class="btn">
   </form>

   <!-- Image Section -->
   <div class="image-container">
   <img src="images/eye cream/contatus.jpeg" alt="Skincare Contact Image">

   </div>
</section>

<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>
