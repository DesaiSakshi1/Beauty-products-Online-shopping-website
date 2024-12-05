<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
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
   <title>Shop</title>
   
   <!-- Font Awesome CDN link -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- Custom CSS file link -->
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/shop.css">

</head>
<body>
   
<?php include 'components/user_header.php'; ?>
<div class="space"></div>

<section class="products">
   <h1 class="heading">Our Skincare Products</h1>

   <div class="box-container">
   
   <?php
     $select_products = $conn->prepare("SELECT * FROM products"); 
     $select_products->execute();
     if($select_products->rowCount() > 0){
      while($fetch_product = $select_products->fetch(PDO::FETCH_ASSOC)){
   ?>
   <form action="" method="post" class="box">
      <input type="hidden" name="pid" value="<?= $fetch_product['id']; ?>">
      <input type="hidden" name="name" value="<?= $fetch_product['name']; ?>">
      <input type="hidden" name="price" value="<?= $fetch_product['price']; ?>">
      <input type="hidden" name="image" value="<?= $fetch_product['image_01']; ?>">
      
      <!-- Add to Wishlist button if out of stock -->
      <?php
      if ($fetch_product['quantity'] <= 0) {
         echo'<button class="fas fa-heart" type="submit" name="add_to_wishlist"></button>';
      }
      ?>
      
      <!-- Quick View Button -->
      <a href="quick_view.php?pid=<?= $fetch_product['id']; ?>" class="fas fa-eye"></a>
      
      <!-- Product Image -->
      <img src="uploaded_img/<?= $fetch_product['image_01']; ?>" alt="">
      
      <!-- Product Name -->
      <div class="name"><?= $fetch_product['name']; ?></div>
      
      <!-- Stock Status -->
      <div class="stock-status <?= $fetch_product['quantity'] > 0 ? 'in-stock' : 'out-of-stock' ?>">
         <?= $fetch_product['quantity'] > 0 ? 'In Stock' : 'Out of Stock' ?>
      </div>

      <!-- Product Price and Quantity -->
      <div class="flex">
         <div class="price"><span>Rs.</span><?= $fetch_product['price']; ?><span>/-</span></div>
         <input type="number" name="qty" class="qty" min="1" max="5" onkeypress="if(this.value.length == 2) return false;" value="1">
      </div>
      
      <!-- Add to Cart Button -->
      <?php
      if ($fetch_product['quantity'] > 0) {
         echo '<input type="submit" value="Add to Cart" class="btn" name="add_to_cart" >';
      } else {
         echo '<input type="submit" value="Out of Stock" class="btn" name="add_to_cart" style="background-color: #ddd;" disabled>';
      }
      ?>
   </form>
   <?php
      }
   } else {
      echo '<p class="empty">No products found!</p>';
   }
   ?>

   </div>

</section>

<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>
