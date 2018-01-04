<?php
namespace app\index\controller;
use app\common\model\Admin;
use think\Controller;
use think\Session;

class LoginController extends Controller {

	public function login() {
		return $this->fetch('/loging');
	}
	public function doLogin(Admin $admin, $username, $password) {
		$map = array('username' => $username, 'password' => $password);
		$admin = $admin->login($map);
		if ($admin) {
			Session::set('admin_id', $uid);
			$data = ['static' => 1];
			return json($data);
		} else {
			$data = ['static' => 2, 'msg' => '登陆失败'];
			return json($data);
		}
	}

	public function getAdminInfo($uid) {
		Admin::get();
		$info = $admin->info($uid);
		if ($info) {
			$this->assign('admin', $info);
			return $this->fetch();
		} else {
			return '用户不存在';
		}
	}

	protected function getAdminRole() {
		$uid = Session::get('admin_id');
		$admin = Admin::get($uid);
		return $admin->role();
	}
}
