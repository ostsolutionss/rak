<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/LouisLi/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
<!------------------------NEW CSS --------------------------------------------------------->

<!-- Bootstrap -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,400italic,700italic,600italic,300' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,300,500,600,700,800' rel='stylesheet' type='text/css'>
<link href="catalog/view/theme/LouisLi/stylesheet/bootstrap.css" rel="stylesheet">
<link href="catalog/view/theme/LouisLi/stylesheet/style.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!------------------------ NEW CSS -------------------------------------------------------->
</head>
<body>
    
     <header>
   <div class="top-header">
     <div class="container">
       <div class="row">
         <div class="col-md-6">
           <ul class="language-login">
             <li>
               
                 <?php echo $language; ?>
               
             </li>
             <li>
                 <?php if (!$logged) { ?>
               <p><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>  OR  <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></p>
                  <?php }?>
             </li>
          
            
           </ul>
         </div>
         <div class="col-md-6">
           <ul class="top-links">
             <li>
               <a href="http://localhost/LouisLi/index.php?route=account/account">
                 <img src="catalog/view/theme/LouisLi/images/user-icon.png" alt="">
                 <p><?php echo $text_account; ?></p>
               </a>  
             </li>
             <li>
               <a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>">
                 <img src="catalog/view/theme/LouisLi/images/wishlist-icon.png" alt="">
                 <p><?php echo $text_wishlist; ?></p>
               </a>  
             </li>
             <li>
               <a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>">
                 <img src="catalog/view/theme/LouisLi/images/checkput-icon.png" alt="">
                 <p><?php echo $text_checkout; ?></p>
               </a>  
             </li>
           </ul>
         </div>
       </div>
     </div>
   </div>
   <div class="inner-header">
     <div class="container">
       <div class="row">
         <div class="col-md-6 logo">
           <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
         </div>
         <div class="col-md-6">
           <div class="cart-sec">
            <?php echo $cart; ?>
           </div>
         </div>
       </div>
     </div>
   </div>
 </header>
  <div class="navigation">
   <div class="container">
     <div class="row">
       <div class="col-lg-12">
         <form class="navbar-form navbar-left search-device" role="search">
                  <div class="form-group">
                 <?php echo $search; ?>
                  </div>
         </form>
           <?php if ($categories) { ?>
         <nav class="navbar navbar-default">
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
              </div>

              <!-- Collect the nav links, forms, and other content for toggling -->
              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                  <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
                </ul>
                <form class="navbar-form navbar-left search-desktop" role="search">
                  <div class="form-group">
                   <?php echo $search; ?>
                  </div>
                </form>
              </div><!-- /.navbar-collapse -->
          </nav>
           <?php } ?>
       </div>
     </div>
   </div>
</div>