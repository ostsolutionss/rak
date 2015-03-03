<!-- @idiotique -->
<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  	<div class="page-header">
    	<div class="container-fluid">
      		<div class="pull-right">
        		<button type="submit" form="form-jssor_slider" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        		<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
           	</div>
      		<h1><?php echo $heading_title; ?></h1>
      		<ul class="breadcrumb">
        		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
        		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        		<?php } ?>
      		</ul>
    	</div>
  	</div><!-- end page-header-->
  	<div class="container-fluid">
    	<?php if ($error_warning) { ?>
    	<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      		<button type="button" class="close" data-dismiss="alert">&times;</button>
    	</div>
    	<?php } ?>
    	<div class="panel panel-default">
      		<div class="panel-heading">
        		<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      		</div>
      		<div class="panel-body">
        		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-jssor_slider" class="form-horizontal">
                	<div class="form-group">
                    	<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                    	<div class="col-sm-10">
                          	<select name="jssor_slider_status" id="input-status" class="form-control">
                                <?php if ($jssor_slider_status) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                          	</select>
                    	</div>
                	</div>
                	<ul class="nav nav-tabs">
                    	<li class="active"><a href="#tab-slideshow" data-toggle="tab"><?php echo $tab_slideshow; ?></a></li>
                    	<!--li><a href="#tab-caption" data-toggle="tab"><?php echo $tab_caption; ?></a></li>
                    	<li><a href="#tab-translation" data-toggle="tab"><?php echo $tab_translation; ?></a></li-->
                	</ul>
                	<div class="tab-content">
                        <div class="tab-pane active" id="tab-slideshow">
                        	<table id="module" class="table table-striped table-bordered table-hover">
                                <thead>
                                  <tr>
                                    <td class="text-right">#</td>
                                    <td class="text-left"><?php echo $entry_banner; ?></td>
                                    <td class="text-left"><?php echo $entry_dimension; ?></td>
                                    <td></td>
                                  </tr>
                                </thead>
                                <tbody>
                                  <?php $module_row = 1; ?>
                                  <?php foreach ($jssor_slider_modules as $jssor_slider_module) { ?>
                                  <tr id="module-row<?php echo $jssor_slider_module['key']; ?>">
                                    <td class="text-right"><?php echo $module_row; ?></td>
                                    <td class="text-left"><select name="jssor_slider_module[<?php echo $jssor_slider_module['key']; ?>][banner_id]" class="form-control">
                                        <?php foreach ($banners as $banner) { ?>
                                        <?php if ($banner['banner_id'] == $jssor_slider_module['banner_id']) { ?>
                                        <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                      </select></td>
                                    <td class="text-left"><input type="text" name="jssor_slider_module[<?php echo $jssor_slider_module['key']; ?>][width]" value="<?php echo $jssor_slider_module['width']; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control" />
                                      <input type="text" name="jssor_slider_module[<?php echo $jssor_slider_module['key']; ?>][height]" value="<?php echo $jssor_slider_module['height']; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                                      <?php if (isset($error_dimension[$jssor_slider_module['key']])) { ?>
                                      <div class="text-danger"><?php echo $error_dimension[$jssor_slider_module['key']]; ?></div>
                                      <?php } ?></td>
                                    <td class="text-left"><button type="button" onclick="$('#module-row<?php echo $jssor_slider_module['key']; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                                  </tr>
                                  <?php $module_row++; ?>
                                  <?php } ?>
                                </tbody>
                                <tfoot>
                                  <tr>
                                    <td colspan="3"></td>
                                    <td class="text-left"><button type="button" onclick="addModule();" data-toggle="tooltip" title="<?php echo $button_module_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                                  </tr>
                                </tfoot>
                              </table>
                        </div><!-- END TAB-SLIDESHOW -->
                        <!--div class="tab-pane" id="tab-caption">
                            <strong>Comming Soon!</strong>
                        </div>
                        <div class="tab-pane" id="tab-translation">
                            <strong>Comming Soon!</strong>
                        </div-->
                	</div>
        		</form>
      		</div>
    	</div>
  	</div>
    <script type="text/javascript"><!--
	function addModule() {	
		var token = Math.random().toString(36).substr(2);
	
		html  = '<tr id="module-row' + token + '">';
		html += '  <td class="text-right">' + ($('tbody tr').length + 1) + '</td>';
		html += '  <td class="text-left"><select name="jssor_slider_module[' + token + '][banner_id]" class="form-control">';
		<?php foreach ($banners as $banner) { ?>
		html += '    <option value="<?php echo $banner['banner_id']; ?>"><?php echo addslashes($banner['name']); ?></option>';
		<?php } ?>
		html += '  </select></td>';
		html += '  <td class="text-left"><input type="text" name="jssor_slider_module[' + token + '][width]" value="" placeholder="<?php echo $entry_width; ?>" class="form-control" /> <input type="text" name="jssor_slider_module[' + token + '][height]" value="" placeholder="<?php echo $entry_height; ?>" class="form-control" /></td>';
		html += '  <td class="text-left"><button type="button" onclick="$(\'#module-row' + token + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
		html += '</tr>';
		
		$('#module tbody').append(html);
	}
//--></script>
</div>
<?php echo $footer; ?>