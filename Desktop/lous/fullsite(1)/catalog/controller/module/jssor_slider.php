<?php
/*
@idiotique
jssorslider.v.1.0.1
- Random Caption Translation
*/
class ControllerModuleJssorSlider extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		$this->document->addStyle('catalog/view/javascript/jquery/jssorslider/jssor.css');
		$this->document->addScript('catalog/view/javascript/jquery/jssorslider/jssor.js');
		$this->document->addScript('catalog/view/javascript/jquery/jssorslider/jssor.slider.js');
		$this->document->addScript('catalog/view/javascript/jquery/jssorslider/jssorsetting.js');

		$data['width'] = $setting['width'];
		$data['height'] = $setting['height'];

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

		$data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/jssor_slider.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/jssor_slider.tpl', $data);
		} else {
			return $this->load->view('default/template/module/jssor_slider.tpl', $data);
		}
	}
}