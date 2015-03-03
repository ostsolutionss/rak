<?php
/*
@idiotique
jssorslider.v.1.0.1
- Random Caption Translation
*/
class ControllerModuleJssorSlider extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/jssor_slider');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('jssor_slider', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		
		$data['entry_banner'] = $this->language->get('entry_banner');
		$data['entry_dimension'] = $this->language->get('entry_dimension');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_image'] = $this->language->get('entry_image');
		
		$data['help_dimension'] = $this->language->get('help_dimension');
		
		$data['tab_module'] = $this->language->get('tab_module');
		$data['tab_slideshow'] = $this->language->get('tab_slideshow');
		$data['tab_caption'] = $this->language->get('tab_caption');
		$data['tab_translation'] = $this->language->get('tab_translation');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_module_add'] = $this->language->get('button_module_add');
		$data['button_remove'] = $this->language->get('button_remove');
		
		
		

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['dimension'])) {
			$data['error_dimension'] = $this->error['dimension'];
		} else {
			$data['error_dimension'] = array();
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/jssor_slider', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/jssor_slider', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['jssor_slider_status'])) {
			$data['jssor_slider_status'] = $this->request->post['jssor_slider_status'];
		} else {
			$data['jssor_slider_status'] = $this->config->get('jssor_slider_status');
		}
		
		if (isset($this->request->post['jssor_slider_module'])) {
			$modules = $this->request->post['jssor_slider_module'];
		} elseif ($this->config->has('jssor_slider_module')) {
			$modules = $this->config->get('jssor_slider_module');
		} else {
			$modules = array();
		}
		
		$data['jssor_slider_modules'] = array();
		
		foreach ($modules as $key => $module) {
			$data['jssor_slider_modules'][] = array(
				'key'       => $key,
				'banner_id' => $module['banner_id'],
				'width'     => $module['width'],
				'height'    => $module['height']
			);
		}
		
		$this->load->model('design/banner');

		$data['banners']		= $this->model_design_banner->getBanners();
		$this->load->model('localisation/language');

		$data['languages']	  = $this->model_localisation_language->getLanguages();
		$data['header'] 		 = $this->load->controller('common/header');
		$data['column_left'] 	= $this->load->controller('common/column_left');
		$data['footer'] 		 = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/jssor_slider.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/jssor_slider')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (isset($this->request->post['jssor_slider_module'])) {
			foreach ($this->request->post['jssor_slider_module'] as $key => $value) {
				if (!$value['width'] || !$value['height']) {
					$this->error['dimension'][$key] = $this->language->get('error_dimension');
				}
			}
		}

		return !$this->error;
	}
}