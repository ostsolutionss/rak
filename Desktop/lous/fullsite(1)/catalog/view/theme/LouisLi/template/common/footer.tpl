<footer>
  <div class="footer-upper">
    <div class="container">
      <div class="row">
             <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h1><?php echo $text_information; ?></h1>
        <ul class="f-links">
         <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
    <div class="col-sm-3">
      <h1><?php echo $text_service; ?></h1>
        <ul class="f-links">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
      <h1><?php echo $text_extra; ?></h1>
        <ul class="f-links">
         <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>   
      <div class="col-sm-3">
      <h1><?php echo $text_account; ?></h1>
        <ul class="f-links">
        <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
      </div>
    </div>
  </div>
  <div class="footer-lower">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <p>Copyright &copy; 2015 open cart. All rights reserved.<?php //echo $powered; ?></p>
        </div>
        <div class="col-sm-6">
          <ul class="social">
            <li><a href="#"><img src="catalog/view/theme/LouisLi/images/facebook.png" alt=""></a></li>
            <li><a href="#"><img src="catalog/view/theme/LouisLi/images/twitter.png" alt=""></a></li>
            <li><a href="#"><img src="catalog/view/theme/LouisLi/images/linked-in.png" alt=""></a></li>
            <li><a href="#"><img src="catalog/view/theme/LouisLi/images/rss.png" alt=""></a></li>
          </ul>
        </div>
      </div>
    </div>  
  </div>
</footer>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 

<!-- Include all compiled plugins (below), or include individual files as needed --> 


<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>