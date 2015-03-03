<!--<h3><?php //echo $heading_title; ?></h3>-->
 <div class="row sellers">
<div class="row">
        <div class="title-sec">
          <h1><?php echo $heading_title; ?></h1>
        </div>
      </div>
<div class="row">
  <?php foreach ($products as $product) { ?>
 <div class="col-sm-4">
     <div class="sellers-inner-block">
      <a href="<?php echo $product['href']; ?>">
          <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
      </a>
     
        <p><?php echo $product['name']; ?></p>
    
        <?php if ($product['price']) { ?>
         <h2>
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <?php echo $product['special']; ?></span>
          <?php } ?>
        </h2>
        <?php } ?>
     <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">ADD TO CART<?php //echo $button_cart; ?></button>
       
    </div>
  </div>
  <?php } ?>
</div>
</div>
