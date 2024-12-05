<?php

include 'components/connect.php';

session_start();

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
} else {
    $user_id = '';
};

include 'components/wishlist_cart.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Quick View</title>
   
   <!-- font awesome cdn link -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<br><br><br><br><br>

<section class="quick-view">
   <h1 class="heading">Quick View</h1>

   <?php
   $pid = $_GET['pid'];
   $select_products = $conn->prepare("SELECT * FROM `products` WHERE id = ?");
   $select_products->execute([$pid]);
   if ($select_products->rowCount() > 0) {
       while ($fetch_product = $select_products->fetch(PDO::FETCH_ASSOC)) {
   ?>
   <form action="" method="post" class="box">
      <input type="hidden" name="pid" value="<?= $fetch_product['id']; ?>">
      <input type="hidden" name="name" value="<?= $fetch_product['name']; ?>">
      <input type="hidden" name="price" value="<?= $fetch_product['price']; ?>">
      <input type="hidden" name="image" value="<?= $fetch_product['image_01']; ?>">
      <div class="row">
         <div class="image-container">
            <div class="main-image">
               <img src="uploaded_img/<?= $fetch_product['image_01']; ?>" alt="">
            </div>
            <div class="sub-image">
               <img src="uploaded_img/<?= $fetch_product['image_01']; ?>" alt="">
               <img src="uploaded_img/<?= $fetch_product['image_02']; ?>" alt="">
               <img src="uploaded_img/<?= $fetch_product['image_03']; ?>" alt="">
            </div>
         </div>
         <div class="content">
            <div class="name"><?= $fetch_product['name']; ?></div>
            <div class="flex">
               <div class="price"><span>Rs.</span><?= $fetch_product['price']; ?><span>/-</span></div>
               <input type="number" name="qty" class="qty" min="0" max="5" onkeypress="if(this.value.length == 2) return false;" value="1">
            </div>

            <div class="status">
               <div class="avail">
               <?php
                  if ($fetch_product['quantity'] > 0 && $fetch_product['quantity'] <= 100) {
                      echo '<span style="color:green;">In Stock</span>';
                  } elseif ($fetch_product['quantity'] == 0) {
                      echo '<span style="color:red;">Out of Stock</span>';
                  }
               ?>
               </div>
               <?php
               if ($fetch_product['quantity'] > 0 && $fetch_product['quantity'] <= 100) {
                  echo '<span style="color:green;">' . $fetch_product['quantity'] . '</span>';
               } else {
                  echo '<span style="display: none;">0</span>';
               }
               ?>
            </div>

            <div class="details"><?= $fetch_product['details']; ?></div>
            <div class="flex-btn">
               <?php
               if ($fetch_product['quantity'] > 0 && $fetch_product['quantity'] <= 100) {
                   echo '<input type="submit" value="Add to Cart" class="btn" name="add_to_cart">';
               } else {
                   echo '<input type="submit" value="Add to Cart" class="btn" name="add_to_cart" style="background-color: #121212; cursor:not-allowed;" disabled>';
               }
               ?>
               <input type="submit" value="Add to Wishlist" class="btn" name="add_to_wishlist">
            </div>
         </div>
      </div>
   </form>
   <?php
       }
   } else {
       echo '<p class="empty">No products added yet!</p>';
   }
   ?>
</section>

<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>
