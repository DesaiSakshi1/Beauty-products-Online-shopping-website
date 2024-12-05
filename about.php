<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>About Us</title>
  <style>
    /* Overall page styling */
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f8f8f8;
      color: #333;
      margin: 0;
      padding: 0;
    }

    /* Main container */
    .center {
      margin: 50px auto;
      text-align: center;
    }
    .center hr {
      position: relative;
      border: none;
      height: 3px;
      background: #5c5c5c;
      width: 50%;
      margin: 20px auto;
    }

    /* Heading styles */
    .center .large {
      font-size: 70px;
      font-weight: bold;
      font-family: 'Times New Roman', serif;
    }
    .center .medium {
      font-size: 36px;
      font-weight: 500;
      color: #555;
    }
    .center .small {
      font-size: 20px;
      color: #777;
    }

    .heading {
      font-size: 32px;
      font-weight: 600;
      color: #444;
      margin-bottom: 20px;
    }

    /* Team member section */
    .row {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
      gap: 30px;
      margin: 40px 0;
    }
    .name {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      padding: 20px;
      text-align: center;
      transition: transform 0.3s ease;
    }
    .name:hover {
      transform: translateY(-10px);
    }
    .name img {
      width: 100%;
      max-width: 250px;
      border-radius: 10px;
      margin-bottom: 15px;
    }
    .name h2 {
      font-size: 22px;
      font-weight: 600;
      color: #444;
    }

    /* About section */
    .about {
      padding: 60px 20px;
      background-color: #fff;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
      border-radius: 10px;
      margin: 30px auto;
      max-width: 1200px;
    }
    .about .row {
      display: flex;
      justify-content: center; /* Centers the image and content horizontally */
      align-items: center;
      gap: 30px; /* Adds spacing between the image and content */
      flex-wrap: wrap;
    }
    .about .image img {
      max-width: 100%; /* Ensures responsiveness */
      width: 400px; /* Sets a reasonable width */
      border-radius: 15px;
    }
    .about .content {
      max-width: 600px;
    }
    .about .content h3 {
      font-size: 28px;
      font-weight: bold;
      color: #222;
    }
    .about .content p {
      font-size: 18px;
      line-height: 1.6;
      color: #666;
      margin-bottom: 20px;
    }
    .about .content .btn {
      background-color: #5c5c5c;
      color: #fff;
      padding: 12px 24px;
      border-radius: 30px;
      text-decoration: none;
      transition: background-color 0.3s;
    }
    .about .content .btn:hover {
      background-color: #444;
    }
  </style>
</head>
<body>

  <div class="center">
    <strong class="large">Rivaaz Éclat</strong><br>
    <strong class="medium">COSMETICS SHOPPING CENTER</strong><br>
    <strong class="small">Beauty and Beauty Products</strong><br>
    <hr>
  </div>

  <!-- Team Section -->
  <div class="center heading">
     <strong>Meet Our Team</strong>
  </div>
  <div class="row">
      <div class="name">
          <img src="images/770304.jpg" alt="Anupa Gaire">
          <h2>Anupa Gaire</h2>
      </div>
      <div class="name">
          <img src="images/770332.jpg" alt="Rohisha Shrestha">
          <h2>Rohisha Shrestha</h2>
      </div>
      <div class="name">
          <img src="images/770334.jpg" alt="Rosha Prajapati">
          <h2>Rosha Prajapati</h2>
      </div>
  </div>

  <!-- About Section -->
  <section class="about">
    <div class="row">
      <div class="image">
        <img src="images/aboutuspage.jpg" alt="About Us">
      </div>
      <div class="content">
        <h3>Our Mission</h3>
        <p>Our mission is to provide our customers with a seamless and convenient shopping experience for beauty and beauty products, while saving them time in the process. We aim to achieve this mission by offering a user-friendly website that allows customers to easily browse and purchase cosmetic products, as well as providing efficient and reliable delivery options.</p>
        <a href="contact.php" class="btn">Contact Us</a>
      </div>
    </div>
  </section>

</body>
</html>
