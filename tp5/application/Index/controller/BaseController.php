<?php
namespace app\Index\controller;
use think\Controller;

class BaseController extends Controller {
	public function _initialize() {
		$uid = session('uid');
		if ($uid == null) {
			$this->rediect('Login/index', '请先登录后操作');
		}
	}
}
