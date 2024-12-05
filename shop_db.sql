-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2024 at 03:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', 'f865b53623b121fd34ee5426c792e5c33af8c227');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(15, 6, 2, 'Maybelline  Peachy Nude lipstick', 1060, 1, 'Screenshot 2023-12-21 115618-Peachy Nude Lipstick.png'),
(22, 7, 2, 'Maybelline  Peachy Nude lipstick', 1060, 1, 'Screenshot 2023-12-21 115618-Peachy Nude Lipstick.png'),
(23, 7, 3, 'Huda foundation', 2250, 1, 'Screenshot 2023-12-21 130741-foundation.png');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(1, 0, 'anupa gaire', 'aanupa.gaire@gmail.com', '9841563258', 'hello'),
(2, 7, 'shristii', 'yakamishristi@gmail.com', '9840003017', 'Hello');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `timestamp`, `product_id`) VALUES
(361, 4, 'Updated Product: Huda foundation', '2024-02-27 08:08:28', 3),
(362, 5, 'Updated Product: Huda foundation', '2024-02-27 08:08:28', 3),
(363, 6, 'Updated Product: Huda foundation', '2024-02-27 08:08:28', 3),
(364, 7, 'Updated Product: Huda foundation', '2024-02-27 08:08:28', 3),
(365, 5, 'Updated Product: Maybelline Mascara', '2024-02-29 03:28:00', 1),
(366, 6, 'Updated Product: Maybelline Mascara', '2024-02-29 03:28:00', 1),
(367, 7, 'Updated Product: Maybelline Mascara', '2024-02-29 03:28:00', 1),
(368, 8, 'Updated Product: Maybelline Mascara', '2024-02-29 03:28:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(8, 6, 'rohisha', '9841230978', 'rohisha@gmail.com', 'cash on delivery', 'flat no. 105,  bhaktapur,  Nepal - 44600', 'Maybelline  Peachy Nude lipstick (1060 x 2) - MAC Lipstick (2000 x 1) - Huda Beauty Mascara (3800 x 1) - ', 7920, '2024-02-27', 'completed'),
(12, 8, 'anupa', '9841563210', 'anupa@gmail.com', 'cash on delivery', 'flat no. 106,  bhaktapur,  Nepal - 44600', 'Maybelline  Peachy Nude lipstick (1060 x 2) - ', 2120, '2024-02-27', 'pending'),
(13, 7, 'shristii', '9840003017', 'yakamishristi@gmail.com', 'cash on delivery', 'flat no. 777,  bhaktapur,  Nepal - 44600', 'Milani Eyeshadow Palette (1060 x 1) - Swiss Beauty Bold Matt Lip Liner (1000 x 1) - Wet n Wild MegaLast Liquid Catsuit Matte Lipstick  (599 x 1) - Maybelline Instant Age Rewind Eraser Concealer (920 x 1) - Kiss Beauty Eyeliner with Eyeliner Gel (Black and Brown) (420 x 1) - Revlon Liquid Foundation (1290 x 1) - ', 5289, '2024-02-27', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`, `quantity`, `category`) VALUES
(1, 'Maybelline Mascara', 'Volumizing, Lengthening, Defining, Curling, Multiplying, Buildable Formula, Very Black,', 1732, 'Maskara.png', 'Screenshot 2023-12-21 115307.png', 'Screenshot 2023-12-21 115439.png', 10, 'Foundation'),
(2, 'Maybelline  Peachy Nude lipstick', 'Maybelline Super Stay Vinyl Ink Longwear No-Budge Liquid Lipcolor Makeup, Highly Pigmented Color and Instant Shine, Peppy, Pink Lipstick, 0.14 fl oz, 1 Count', 1060, 'Screenshot 2023-12-21 115618-Peachy Nude Lipstick.png', 'Screenshot 2023-12-21 115836.png', 'Screenshot 2023-12-21 115716.png', 11, 'Lipstick'),
(3, 'Huda foundation', 'HUDA BEAUTY #FauxFilter Luminous Matte Foundation 200B Shortbread, Lightweight Formula, Full Coverage, Paraben Free, For All Skin Tones', 2250, 'Screenshot 2023-12-21 130741-foundation.png', 'Screenshot 2023-12-21 130819.png', 'Screenshot 2023-12-21 131305.png', 20, 'Foundation'),
(4, 'e.l.f. Primer', 'e.l.f. Poreless Putty Primer Flawless Finish, Ideal for All Skin Types, Universal Sheer, 0.74 oz\r\nGrips makeup for all-day wear & a flawless finish\r\nInfused with Squalane for optimal hydration\r\nSmooth, velvety texture glides over skin seamlessly\r\nPerfect for all skin types', 2250, 'Screenshot 2023-12-21 123008-primer.png', 'Screenshot 2023-12-21 123146.png', 'Screenshot 2023-12-21 123119.png', 0, 'Foundation'),
(5, 'e.l.f. Eyeshadow', 'e.l.f. Perfect 10 Eyeshadow Palette, Ten Ultra-pigmented Shimmer & Matte Shades, Vegan & Cruelty-free, Nude Rose Gold(Packaging May Vary)\r\n\r\n', 1225, 'Screenshot 2023-12-21 123212-eyeshadow.png', 'Screenshot 2023-12-21 123239.png', 'Screenshot 2023-12-21 123256.png', 20, 'Eyeshadow'),
(6, 'Maybelline Highlighter', 'Maybelline New York Master Chrome Metallic Highlighter, Molten Gold 6.7gm, Super Luminous Highlighting Powder', 1585, 'Screenshot 2023-12-21 130603-highlighter.png', 'Screenshot 2023-12-21 130628.png', 'Screenshot 2023-12-21 130646.png', 0, 'Foundation'),
(7, 'MAC Lipstick', 'MAC Lustreglass Sheer Shine Lipstick - Cockney Lipstick Women 0.1 oz,  long-wearing, lustrous finish', 2000, 'Screenshot 2024-01-15 161751.png', 'Screenshot 2024-01-15 161815.png', 'Screenshot 2024-01-15 161844.png', 14, 'Lipstick'),
(8, 'Milani Eyeshadow Palette', 'Milani Gilded Mini Eyeshadow Palette with 6 Matte & Shimmer Hues - The Wine Down, Cruelty-free and certified by PETA', 1060, 'Screenshot 2024-01-15 162530.png', 'Screenshot 2024-01-15 162648.png', 'Screenshot 2024-01-15 162733.png', 12, 'Eyeshadow'),
(9, 'Revlon Mascara', 'Revlon Mascara, Volumazing Eye Makeup, Non-Waterproof, No Clump, Smudge Proof, Flake Proof, 901 Blackest Black, 0.30 Fl Oz, Provides rich, fanned out look', 660, 'Screenshot 2023-12-21 125329-maskara.png', 'Screenshot 2023-12-21 125358.png', 'Screenshot 2023-12-21 125428.png', 22, 'Mascara'),
(10, 'Revlon Pencil Eyeliner', 'Revlon Pencil Eyeliner, Gifts for Women, Stocking Stuffers, ColorStay Eye Makeup with Built-in Sharpener, Waterproof, Smudge-proof, Longwearing with Ultra-Fine Tip, 201 Black, 0.01 oz', 600, 'Screenshot 2023-12-21 124810-eyeliner.png', 'Screenshot 2023-12-21 124843.png', 'Screenshot 2023-12-21 124905.png', 65, 'Eyeliner'),
(11, 'Huda Beauty Mascara', 'HUDA BEAUTY LEGIT LASHES Double-Ended Volumizing and Lengthening Mascara 2 x 0.28 oz/ 8.5 ml', 3800, 'Screenshot 2023-12-21 131557-maskara.png', 'Screenshot 2023-12-21 131620.png', 'Screenshot 2023-12-21 131638.png', 6, 'Mascara'),
(12, 'wet n wild foundation', 'wet n wild Photo Focus Dewy Liquid Foundation Makeup, Soft Beige', 1190, 'Screenshot 2024-01-15 165435.png', 'Screenshot 2024-01-15 165506.png', 'Screenshot 2024-01-15 165531.png', 20, 'Foundation'),
(13, 'Mirabella 4-Piece Makeup Set', 'Mirabella 4-Piece Makeup Set for Women & Girls, Illuminizing Holiday Gift Set - Make-Up Set Includes Lip Gloss, Glow Drops, Powder Highlight & Blender Sponge - Talc-Free & Paraben Free Cosmetic Set', 5175, 'Screenshot 2024-01-15 165813.png', 'Screenshot 2024-01-15 165910.png', 'Screenshot 2024-01-15 165847.png', 8, NULL),
(14, 'L.A. Girl Pro Correcting Primer', 'L.A. Girl Pro Prep Correcting Primer, Colorless, 1 Fluid Ounce', 390, 'Screenshot 2024-01-15 170306.png', 'Screenshot 2024-01-15 170343.png', 'Screenshot 2024-01-15 170406.png', 15, 'primer'),
(15, 'L.A. Girl Matte Lip Gloss', 'L.A. Girl Matte Flat Finish Pigment Gloss, Secret, 0.17 oz.,GLG842', 390, 'Screenshot 2024-01-15 170529.png', 'Screenshot 2024-01-15 170606.png', 'Screenshot 2024-01-15 170620.png', 25, 'Gloss'),
(16, 'L.A. Girl Ultimate Intense Eyeliner', 'L.A. Girl Ultimate Intense Stay Auto Eyeliner, Ultimate Black, 0.01 oz., Pencil, Long Lasting Formula, Highly Pigmented, Smooth Application', 510, 'Screenshot 2024-01-15 170827.png', 'Screenshot 2024-01-15 170851.png', 'Screenshot 2024-01-15 170913.png', 60, 'Eyeliner'),
(17, 'wet n wild MegaGlo Makeup Stick Conceal and Contour ', 'wet n wild MegaGlo Makeup Stick Conceal and Contour Brown Where&#39;s Walnut?,1.1 Ounce (Pack of 1),806', 264, 'Screenshot 2024-01-15 171123.png', 'Screenshot 2024-01-15 171159.png', 'Screenshot 2024-01-15 171220.png', 16, 'Contour'),
(18, 'Wet n Wild MegaLast Liquid Catsuit Matte Lipstick ', 'Wet n Wild MegaLast Liquid Catsuit Matte Lipstick - Give Me Mocha 6gm', 599, 'Screenshot 2024-01-15 172100.png', 'Screenshot 2024-01-15 172120.png', 'Screenshot 2024-01-15 172128.png', 13, 'Lipstick'),
(19, 'Hilary Rhoda Multicolor Matt 5 in 1 Lipstick', 'Hilary Rhoda Multicolor Matt 5 in 1 Lipstick, Smooth, Long lasting stay', 99, 'Screenshot 2024-01-15 171543.png', 'Screenshot 2024-01-15 171550.png', 'Screenshot 2024-01-15 171700.png', 15, 'Lipstick'),
(20, 'Lakme 9 to 5 Primer + Matte Perfect Cover Liquid Foundation', 'Lakme 9 to 5 Primer + Matte Perfect Cover Liquid Foundation, W240 Warm Beige, Natural Matte Finish', 840, 'Screenshot 2024-01-15 172627.png', 'Screenshot 2024-01-15 172639.png', 'Screenshot 2024-01-15 172655.png', 20, 'Foundation'),
(21, 'Lakme Compact ', 'Lakme Absolute White Intense Wet & Dry Compact - 9gm', 1400, 'Screenshot 2024-01-15 172917.png', 'Screenshot 2024-01-15 172952.png', 'Screenshot 2024-01-15 172940.png', 15, 'Compact'),
(22, 'Lakme Combo', 'Lakme 9 to 5 Personal Care Hamper, Compact powder, Foundation, Primer, Lipstick', 2958, 'Screenshot 2024-01-15 173136.png', 'Screenshot 2024-01-15 173136.png', 'Screenshot 2024-01-15 173136.png', 9, NULL),
(23, 'M.A.C Lost In Gloss Lip Gloss Trio', 'M.A.C Lost In Gloss Lipgloss Trio - Pink - 2 New Sparkling Shades of Full-Sized Lipglass (Melt My Heart, Gleam On) and Full-Sized Lipglass Clear.', 2495, 'Screenshot 2024-02-27 122839.png', 'Screenshot 2024-02-27 122907.png', 'Screenshot 2024-02-27 122951.png', 5, 'Gloss'),
(24, 'Revlon Lip Gloss', 'Revlon Lip Gloss, Super Lustrous The Gloss, Non-Sticky, High Shine Finish, 260 Rosy Future. This silky high shine lip gloss delivers lush color, major shine, and such great hydration, you might retire your lip balm. Shout-out to color, moisture, and multidimensional shine.', 530, 'Screenshot 2024-02-27 123436.png', 'Screenshot 2024-02-27 123501.png', 'Screenshot 2024-02-27 123533.png', 27, 'Gloss'),
(25, 'Mamaearth Matte Lipstick', 'mamaearth Moisture Matte Long Stay Lipstick 01 Carnation Nude -3ml', 720, 'Screenshot 2024-01-15 174240.png', 'Screenshot 2024-01-15 174240.png', 'Screenshot 2024-01-15 174245.png', 45, 'Lipstick'),
(26, 'Swiss Beauty Makeup Setting Spray', 'Swiss Beauty Long lasting Misty Finish Professional Makeup Fixer Spray for Face makeup Fixer Natural Aloevera With Vitamin E Primer - 50 ml', 299, 'Screenshot 2024-01-15 174558.png', 'Screenshot 2024-01-15 174607.png', 'Screenshot 2024-01-15 174558.png', 69, 'Makeup Spray'),
(27, 'Swiss Beauty Bold Matt Lip Liner', 'Swiss Beauty Bold Matt Lip Liner | Set of 12 | Long-lasting |Matte Finish | Non-drying, 15gm', 1000, 'Screenshot 2024-01-15 174747.png', 'Screenshot 2024-01-15 174755.png', 'Screenshot 2024-01-15 174806.png', 12, 'Lipliner'),
(28, 'SWISS BEAUTY Waterproof Base Matte Liquid Foundation ', 'SWISS BEAUTY High Coverage Waterproof Base Matte Liquid Foundation 60gm', 695, 'Screenshot 2024-01-15 175028.png', 'Screenshot 2024-01-15 175033.png', 'Screenshot 2024-01-15 175038.png', 43, 'Foundation'),
(31, 'NARS Radiant Creamy Concealer ', 'NARS Radiant Creamy Concealer - 6 ml', 3677, 'Screenshot 2024-01-15 175758.png', 'Screenshot 2024-01-15 175803.png', 'Screenshot 2024-01-15 175833.png', 77, 'Concelear'),
(32, 'Hilary Rhoda Pro-Preferred White Powder Cake & Compact Powder ', 'Hilary Rhoda Pro-Preferred White Powder Cake & Loose Powder 32g\r\n', 750, 'Screenshot 2024-01-15 175957.png', 'Screenshot 2024-01-15 180009.png', 'Screenshot 2024-01-15 180019.png', 14, 'Compact'),
(33, 'L.A. Girl PRO.HD- Compact Powder', 'L.A. Girl PRO.HD- Setting Powder 5g', 1400, 'Screenshot 2024-01-15 180153.png', 'Screenshot 2024-01-15 180158.png', 'Screenshot 2024-01-15 180207.png', 38, 'Compact'),
(34, 'Technic Pro Pigment Loose Eye shadow ', 'Technic Pro Pigment Loose Eye shadow Powder-Bronze Age Babe- 2gm Merry Mermaid- 2 Gm, Loose Eye Shadow powder, For All Types of Skin', 785, 'Screenshot 2024-01-15 180609.png', 'Screenshot 2024-01-15 180614.png', 'Screenshot 2024-01-15 180709.png', 11, 'Eyeshadow'),
(35, 'La Color Shape It Up -Contour ', 'La Color Shape It Up -Contour By Prettyclick,\r\nstriking packaging and formula, eye-catching metallic design, help achieve flushed and glowing skin', 474, 'Screenshot 2024-01-15 181000.png', 'Screenshot 2024-01-15 181000.png', 'Screenshot 2024-01-15 181006.png', 24, 'Contour'),
(36, 'Technic Sunset Strip Bronze & Highlighter Duo', 'Technic Sunset Strip Bronze & Highlight Duo, perfect tanning effect, perfect combination for an impeccable finish, Brings luminosity with the illuminator', 650, 'Screenshot 2024-01-15 180936.png', 'Screenshot 2024-01-15 180941.png', 'Screenshot 2024-01-15 180936.png', 4, 'Highlighter'),
(37, 'Technic The Heat Is On Eyeshadow Palette', 'Technic The Heat Is On Eyeshadow Palette, Super pigmented and easy to blend, matte and shimmer shades, Achieve a spectacular &#34;heat&#34; look', 1575, 'Screenshot 2024-01-15 180822.png', 'Screenshot 2024-01-15 180822.png', 'Screenshot 2024-01-15 180827.png', 18, 'Eyeshadow'),
(38, 'Hilary Rhoda All Day Long Makeup Setting Spray', 'Hilary Rhoda All Day Long Makeup Fixer Spray 105ml, Lightweight and non-sticky formula, Helps keep makeup last longer, Natural matte finish', 250, 'Screenshot 2024-01-15 181845.png', 'Screenshot 2024-01-15 181849.png', 'Screenshot 2024-01-15 181845.png', 31, 'Makeup Spray'),
(39, 'Kiss Beauty Makeup Setting Spray Mist For Long Lasting Hold Makeup Fixing Spray ', 'Kiss Beauty Makeup Setting Spray Mist For Long Lasting Hold Makeup Fixing Spray 150ml, Helps in settling down the makeup effectively, Provides an enhancing makeup, Helps increase the pigmentation of your eyeshadow', 295, 'Screenshot 2024-01-15 182029.png', 'Screenshot 2024-01-15 182035.png', 'Screenshot 2024-01-15 182029.png', 55, 'Makeup Spray'),
(40, 'Kiss Beauty Eyeliner with Eyeliner Gel (Black and Brown)', 'Kiss Beauty Eyeliner Eyebrow Powder with Eyeliner Gel (Black and Brown),  includes 1 black gel eyeliner, 1 brown gel eyeliner, 1 black eyebrow powder / cake eyeliner and 1 brown eyebrow powder / cake eyeliner, 12-hour long smudge proof formula for long lasting beauty and comfort', 420, 'Screenshot 2024-01-15 182518.png', 'Screenshot 2024-01-15 182523.png', 'Screenshot 2024-01-15 182534.png', 20, 'Eyeliner'),
(41, 'Loreal Paris Gel EyeLiner', 'Loreal Paris Gel EyeLiner 2.8gm, Can blend beautifully into the eye shadow\r\nCreate high eye definition, Lasts up to 24 hours, Smudge proof, Resists tears and sweat ', 1990, 'Screenshot 2024-01-15 182630.png', 'Screenshot 2024-01-15 182637.png', 'Screenshot 2024-01-15 182630.png', 33, 'Eyeliner'),
(42, 'L.A. Colors Color Neon Gel Eye Liner Swell 631', 'L.A. Colors Color Neon Gel Eye Liner Swell 631 By Prettyclick, Glide-on gel formula, Smudge-proof & long wearing, 12 in metallic, neon, and daily-wear shades, Easy to sharpen, Cruelty-free & paraben-free', 350, 'Screenshot 2024-01-15 182941.png', 'Screenshot 2024-01-15 182948.png', 'Screenshot 2024-01-15 182941.png', 67, 'Eyeliner'),
(43, 'e.l.f., Lip Gloss', 'e.l.f., Lip Lacquer, Moisturizing, Shiny, Non-Sticky, Long Lasting, Provides Maximum Color, Glides On, Bubbles, 0.08 Fl Oz', 239, 'Screenshot 2024-02-27 122214.png', 'Screenshot 2024-02-27 122241.png', 'Screenshot 2024-02-27 122303.png', 22, 'Gloss'),
(44, 'Maybelline Lifter Lip Gloss', 'Maybelline Lifter Gloss, Hydrating Lip Gloss with Hyaluronic Acid, Ice, Pink Neutral, 0.18 Ounce. Apply it for a hydrating, glossy shine and fuller look', 580, 'Screenshot 2024-02-27 121636.png', 'Screenshot 2024-02-27 121716.png', 'Screenshot 2024-02-27 121801.png', 30, 'Foundation'),
(45, 'I Love Extreme Crazy Volume Mascara', 'essence | I Love Extreme Crazy Volume Mascara (Pack of 1)- 12ml', 150, 'Screenshot 2024-01-15 183830.png', 'Screenshot 2024-01-15 183841.png', 'Screenshot 2024-01-15 183851.png', 63, 'Mascara'),
(46, 'Maybelline Instant Age Rewind Eraser Concealer', 'Maybelline Instant Age Rewind Eraser Dark Circles Treatment Multi-Use Concealer, 122, 1 Count, Anti-Aging, brighten the look of dull skin', 920, 'Screenshot 2023-12-21 115925-Concelear.png', 'Screenshot 2023-12-21 120122.png', 'Screenshot 2023-12-21 120045.png', 20, 'Concelear'),
(47, 'Maybelline Super Stay Ink Crayon Lip Liner', 'Maybelline Super Stay Ink Crayon Lipstick Makeup, Precision Tip Matte Lip Crayon with Built-in Sharpener, Longwear Up To 8Hrs, Lead The Way, Pink Beige, 1 Count', 900, 'Screenshot 2023-12-21 122702-CryanLipstick.png', 'Screenshot 2023-12-21 122756.png', 'Screenshot 2023-12-21 122815.png', 18, 'Lipliner'),
(48, 'Maybelline Fit Me Matte + Poreless Mattifying Face Primer', 'Maybelline Fit Me Matte + Poreless Mattifying Face Primer Makeup With Sunscreen, Broad Spectrum SPF 20, 16HR Wear, Shine Control, Clear, 1 Count', 920, 'Screenshot 2023-12-21 120950-Primerr.png', 'Screenshot 2023-12-21 121108.png', 'Screenshot 2023-12-21 121142.png', 22, 'Primer'),
(49, 'Maybelline Lifter Gloss, Hydrating Lip Gloss', 'Maybelline Lifter Gloss, Hydrating Lip Gloss with Hyaluronic Acid, High Shine for Plumper Looking Lips, Moon, Nude Pink, 0.18 Ounce', 795, 'Screenshot 2023-12-21 120530-LinGloss.png', 'Screenshot 2023-12-21 120556.png', 'Screenshot 2023-12-21 120624.png', 51, 'Gloss'),
(50, 'Maybelline New York Nudes 16 Pan Eyeshadow Palette', 'Maybelline New York Nudes 16 Pan Eyeshadow Palette Custom Designed Of Diverse Skin Tones, 0.634 Oz 0 01 THE NUDES OF NEW YORK,K3758400', 1195, 'Screenshot 2023-12-21 121515-EyeShadow.png', 'Screenshot 2023-12-21 121603.png', 'Screenshot 2023-12-21 121619.png', 10, 'Eyeshadow'),
(51, 'e.l.f. Halo Glow Contour Beauty Wand', 'e.l.f. Halo Glow Contour Beauty Wand, Liquid Contour Wand For A Naturally Sculpted Look, Buildable Formula, Vegan & Cruelty-free, Light/Medium', 755, 'Screenshot 2024-02-27 120950.png', 'Screenshot 2024-02-27 121017.png', 'Screenshot 2024-02-27 121041.png', 7, 'Contour'),
(52, 'e.l.f. Halo Glow Liquid Filter concealer', 'e.l.f. Halo Glow Liquid Filter, Complexion Booster For A Glowing, Soft-Focus Look, Infused With Hyaluronic Acid, Vegan & Cruelty-Free, 3 Light/Medium', 2380, 'Screenshot 2023-12-21 123337-LiquidFiter.png', 'Screenshot 2023-12-21 123401.png', 'Screenshot 2023-12-21 123436.png', 8, 'Concelear'),
(53, 'Maybelline contour stick', 'Maybelline New York Me Shine-Free + Balance Stick Foundation, Coconut, 0.32 oz.  Provides Tailor-Made Mattifying Coverage, Ultra-Lightweight Powders In The Anti-Shine Core Instantly Dissolve Excess Oil', 580, 'Screenshot 2024-02-27 120335.png', 'Screenshot 2024-02-27 120420.png', 'Screenshot 2024-02-27 120450.png', 21, 'Contour'),
(54, 'Milani Color Fetish Matte Lipstick', 'Milani Color Fetish Matte Lipstick, VEGAN, CRUELTY-FREE BEAUTY', 645, 'Screenshot 2024-01-15 185936.png', 'Screenshot 2024-01-15 185946.png', 'Screenshot 2024-01-15 185958.png', 26, 'Lipstick'),
(55, 'Milani Natural Finish Setting Spray 3-in-1 Setting Spray ', 'PRIME + CORRECT + SET, LONG-LASTING WEAR, VEGAN, CRUELTY-FREE BEAUTY', 580, 'Screenshot 2024-02-27 115828.png', 'Screenshot 2024-02-27 115926.png', 'Screenshot 2024-02-27 115958.png', 9, 'Makeup Spray'),
(56, 'Lakme 9 To 5 Eyeconic Liquid Liner - Intense Black Eye Liner', 'Unique flexi-tip brush, \r\nIntense black color, \r\nSmudgeproof for upto 24 hours, \r\nWaterproof and transfer-proof, \r\nOphthalmologically tested', 416, 'Screenshot 2024-02-27 114930.png', 'Screenshot 2024-02-27 115014.png', 'Screenshot 2024-02-27 115055.png', 25, 'Eyeliner'),
(57, 'REVLON Super Lustrous Glass Shine Lipstick', 'REVLON Super Lustrous Glass Shine Lipstick, Flawless Moisturizing Lip Color with Aloe, Hyaluronic Acid and Rose Quartz, Chocolate Luster (010), 0.15 oz', 795, 'Screenshot 2023-12-21 124243-lipstick.png', 'Screenshot 2023-12-21 124316.png', 'Screenshot 2023-12-21 124333.png', 30, 'Lipstick'),
(58, 'Revlon Liquid Foundation', 'Revlon Liquid Foundation, ColorStay Face Makeup for Normal & Dry Skin, SPF 20, Longwear Medium-Full Coverage with Natural Finish, Oil Free, 110 Ivory, 1 Fl Oz', 1290, 'Screenshot 2023-12-21 124039-foundation.png', 'Screenshot 2023-12-21 124117.png', 'Screenshot 2023-12-21 124147.png', 13, 'Foundation'),
(59, 'Revlon Eyeshadow Palette', 'Revlon Eyeshadow Palette, ColorStay Looks Book Eye Makeup, Highly Pigmented in Blendable Matte & Metallic Finishes, 930 Maverick, 0.21 Oz', 765, 'Screenshot 2023-12-21 124955-eyeshadow.png', 'Screenshot 2023-12-21 125032.png', 'Screenshot 2023-12-21 125150.png', 11, 'Eyeshadow'),
(60, 'L.A. Girl Pro Conceal HD Concealer', 'L.A. Girl Pro Conceal HD Concealer, Creamy Beige, 0.28 Ounce', 330, 'Screenshot 2024-02-27 123813.png', 'Screenshot 2024-02-27 123844.png', 'Screenshot 2024-02-27 123904.png', 55, 'Concelear'),
(61, 'wet n wild Lip Liner Perfect Pout Matte Retractable Gel Lip Liner ', 'wet n wild Lip Liner Perfect Pout Matte Retractable Gel Lip Liner Pencil, Red Bare To Comment. No tugging and no dragging. Delivers never-ending color.', 265, 'Screenshot 2024-02-27 124152.png', 'Screenshot 2024-02-27 124300.png', 'Screenshot 2024-02-27 124231.png', 46, 'lipliner'),
(62, 'Revlon  High Volume Mascara', 'Revlon Mascara, Volume & Length Eye Makeup, Non-Waterproof, No Clump, Smudge Proof, Flake Proof, 301 Blackest Black, 0.28 Fl Oz', 875, 'Screenshot 2024-02-27 125431.png', 'Screenshot 2024-02-27 125508.png', 'Screenshot 2024-02-27 125540.png', 22, 'Mascara'),
(63, 'Maybelline Fit Me Compact Powder', 'Maybelline Fit Me Matte + Poreless Pressed Face Powder Makeup & Setting Powder, Natural Ivory, 1 Count', 665, 'Screenshot 2023-12-21 121322-settingPowder.png', 'Screenshot 2023-12-21 121348.png', 'Screenshot 2023-12-21 121410.png', 32, 'Compact');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `birthday`, `phone`, `gender`) VALUES
(5, 'shristi', 'shristi@gmail.com', 'e77f25fe161501569dfe8c88f94169e8abe437bd', '2002-10-07', '9632587410', 'female'),
(6, 'rohisha', 'rohisha@gmail.com', 'b47a8ea7c6009d187b22298463b7482ca458117a', '2001-02-11', '9512365478', 'female'),
(7, 'Shristii', 'yakamishristi@gmail.com', '7fc030f526dce4fb63305b07be1a53835a16a5e9', '2002-10-22', '9840003017', 'female'),
(8, 'anupa', 'anupa@gmail.com', 'dd5fef9c1c1da1394d6d34b248c51be2ad740840', '2003-07-21', '9841563210', 'female');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `pid`, `name`, `price`, `image`) VALUES
(3, 6, 6, 'Maybelline Highlighter', 1585, 'Screenshot 2023-12-21 130603-highlighter.png'),
(4, 6, 4, 'e.l.f. Primer', 2250, 'Screenshot 2023-12-21 123008-primer.png'),
(5, 7, 6, 'Maybelline Highlighter', 1585, 'Screenshot 2023-12-21 130603-highlighter.png'),
(6, 6, 1, 'Maybelline Mascara', 1732, 'Maskara.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
