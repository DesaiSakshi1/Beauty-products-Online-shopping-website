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
   <title>Rivaaz Éclat</title>

   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="stylesheet" href="css/home.css?v=1.1">


   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css?v=1.1">
   <link rel="stylesheet" href="css/styles.css?v=1.1">
   <link rel="stylesheet" href="css/swiper-bundle.min.css" />

</head>

<body>

   <?php include 'components/user_header.php'; ?>

   <div class="home-bg">
      <section class="main swiper mySwiper">
         <div class="wrapper swiper-wrapper">
            <div class="slides swiper-slide" style="background-image: url('images/baner/banner1.jpg');">
               <div class="image-data">
                  <h2>
                     Reveal The <br>
                     Beauty of Skin
                  </h2>
                  <p style="font-size: 16px; color: black;">
                     Made using clean, non-toxic ingredients, our products are designed for everyone.
                  </p>
                  <a href="shop.php" class="button"><b>Shop Now</b></a>
               </div>
            </div>
            <div class="slides swiper-slide">
               <img src="images\baner\hero-banner-1.jpg" alt="" class="image" />

            </div>

         </div>

         <div class="swiper-button-next nav-btn"></div>
         <div class="swiper-button-prev nav-btn"></div>
         <div class="swiper-pagination"></div>
      </section>

      <!-- Swiper JS -->
      <script src="js/swiper-bundle.min.js"></script>


      <!-- Initialize Swiper -->
      <script>
         var swiper = new Swiper(".mySwiper", {
            slidesPerView: 1,
            loop: true,
            pagination: {
               el: ".swiper-pagination",
               clickable: true,
            },
            navigation: {
               nextEl: ".swiper-button-next",
               prevEl: ".swiper-button-prev",
            },
         });
      </script>


   </div>
   <br>
   <br>
   <section class="category-grid">
   <h1 class="heading">Shop by Category</h1>
   <div class="slider">
      <!-- Category 1 -->
      <a href="category.php?category=cleanser" class="grid-item">
         <img src="images/eye cream/cencer.jpeg" alt="Cleanser">
         <div class="overlay">
            <h3>CLEANSER</h3>
         </div>
      </a>
      <!-- Category 2 -->
      <a href="category.php?category=exfoliator" class="grid-item">
         <img src="images/cateicon/exfoliator.jpeg" alt="Exfoliator">
         <div class="overlay">
            <h3>EXFOLIATOR</h3>
         </div>
      </a>
      <!-- Category 3 -->
      <a href="category.php?category=moisturizer" class="grid-item">
         <img src="images/eye cream/moisturizer.jpeg" alt="Moisturizer">
         <div class="overlay">
            <h3>MOISTURIZER</h3>
         </div>
      </a>
      <!-- Category 4 -->
      <a href="category.php?category=serum" class="grid-item">
         <img src="images/eye cream/serumonly.jpeg" alt="Serum">
         <div class="overlay">
            <h3>SERUM</h3>
         </div>
      </a>
      <!-- Category 5 -->
      <a href="category.php?category=face oil" class="grid-item">
         <img src="images/eye cream/PRANA face oil.jpeg" alt="Serum">
         <div class="overlay">
            <h3>face oil</h3>
         </div>
      </a>
      <!-- Category 6 -->
      <a href="category.php?category=sunscreen" class="grid-item">
         <img src="images/eye cream/sunscreem.jpeg" alt="Serum">
         <div class="overlay">
            <h3>SUNSCREEN</h3>
         </div>
      </a>
      <!-- Category 7 -->
      <a href="category.php?category=exfoliator" class="grid-item">
         <img src="images/eye cream/Exfoliante.jpeg" alt="Serum">
         <div class="overlay">
            <h3>EXFOLIATOR</h3>
         </div>
      </a>
      <!-- More categories as needed -->
   </div>

   <div class="slider-nav">
      <button class="prev">&#10094;</button>
      <button class="next">&#10095;</button>
   </div>
</section>

<script>
   const prevButton = document.querySelector('.prev');
   const nextButton = document.querySelector('.next');
   const slider = document.querySelector('.slider');

   prevButton.addEventListener('click', () => {
       slider.scrollBy({ left: -200, behavior: 'smooth' });
   });

   nextButton.addEventListener('click', () => {
       slider.scrollBy({ left: 200, behavior: 'smooth' });
   });
</script>


   <section class="home-products">

      <h1 class="heading">products</h1>

      <div class="swiper products-slider">

         <div class="swiper-wrapper">

            <?php
     $select_products = $conn->prepare("SELECT * FROM `products` LIMIT 6"); 
     $select_products->execute();
     if($select_products->rowCount() > 0){
      while($fetch_product = $select_products->fetch(PDO::FETCH_ASSOC)){
   ?>
            <form action="" method="post" class="swiper-slide slide">
               <input type="hidden" name="pid" value="<?= $fetch_product['id']; ?>">
               <input type="hidden" name="name" value="<?= $fetch_product['name']; ?>">
               <input type="hidden" name="price" value="<?= $fetch_product['price']; ?>">
               <input type="hidden" name="image" value="<?= $fetch_product['image_01']; ?>">
               <?php
      if ($fetch_product['quantity'] <= 0) {
         echo'<button class="fas fa-heart" type="submit" name="add_to_wishlist"></button>';
      }
      ?>
               <a href="quick_view.php?pid=<?= $fetch_product['id']; ?>" class="fas fa-eye"></a>
               <img src="uploaded_img/<?= $fetch_product['image_01']; ?>" alt="">
               <div class="name">
                  <?= $fetch_product['name']; ?>
               </div>
               <?php
                  if ($fetch_product['quantity'] > 0 && $fetch_product['quantity'] <= 100) {
                        echo '<span style="color:green;">Instock</span>';
                  } elseif ($fetch_product['quantity'] == 0) {
                        echo '<span style="color:red;">Out of Stock</span>';
                  }
                  ?>
               <div class="flex">
                  <div class="price"><span>Rs. </span>
                     <?= $fetch_product['price']; ?><span>/-</span>
                  </div>
                  <input type="number" name="qty" class="qty" min="1" max="99"
                     onkeypress="if(this.value.length == 2) return false;" value="1">
               </div>
               <?php
      if ($fetch_product['quantity'] > 0 && $fetch_product['quantity'] <= 100) {
                        echo '<input type="submit" value="add to cart" class="btn" name="add_to_cart" >';
                  }
         else{
            echo '<input type="submit" value="add to cart" class="btn" name="add_to_cart"  style="background-color: #121212; cursor:not-allowed;" disabled  >';
         }
                  ?>
            </form>
            <?php
      }
   }else{
      echo '<p class="empty">no products added yet!</p>';
   }
   ?>

         </div>

         <div class="swiper-pagination"></div>

      </div>

   </section>

   <?php include 'components/footer.php'; ?>

   <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

   <script src="js/script.js"></script>

   <script>


      var swiper = new Swiper(".home-slider", {
         loop: true,
         spaceBetween: 20,
         pagination: {
            el: ".swiper-pagination",
            clickable: true,
         },
      });

      var swiper = new Swiper(".category-slider", {
         loop: true,
         spaceBetween: 20,
         pagination: {
            el: ".swiper-pagination",
            clickable: true,
         },
         breakpoints: {
            0: {
               slidesPerView: 2,
            },
            650: {
               slidesPerView: 3,
            },
            768: {
               slidesPerView: 4,
            },
            1024: {
               slidesPerView: 5,
            },
         },
      });

      var swiper = new Swiper(".products-slider", {
         loop: true,
         spaceBetween: 20,
         pagination: {
            el: ".swiper-pagination",
            clickable: true,
         },
         breakpoints: {
            550: {
               slidesPerView: 2,
            },
            768: {
               slidesPerView: 2,
            },
            1024: {
               slidesPerView: 3,
            },
         },
      });


   </script>

</body>

</html>