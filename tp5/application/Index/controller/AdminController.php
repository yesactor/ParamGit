<?php
namespace app\Index\controller;
use app\common\model\Admin;
use think\Controller;
use think\Request;

class AdminController extends Controller {

	public function index() {
// 实例化
		$Admin = model('Admin');
		$list = Admin::all();
		$this->assign('list', $list);
//取回打包后的数据
		//将数据返回给用户
		return $this->fetch('/admin_list');
	}

/*
编辑
 */
	public function edit() {
// 获取传入ID
		$id = Request::instance()->param('id/d');
// 在Teacher表模型中获取当前记录
		if (null === $Admin = Admin::get($id)) {
// 由于在$this->error抛出了异常，所以也可以省略return(不推荐)
			$this->error('系统未找到ID为' . $id . '的记录');
		}
// 将数据传给V层
		$this->assign('Admin', $Admin);
// 获取封装好的V层内容
		$htmls = $this->fetch('/saveall');
// 将封装好的V层内容返回给用户
		return $htmls;
	}

	public function save() {
		$Admin = new Admin;
		if (!$this->saveAdmin($Admin)) {
			return $this->error('操作失败' . $Admin->getError());
		}
		return $this->success('保存成功！');
	}
	public function delete($id) {
		$id = Request::instance()->param('id/d');
		if (is_null($id) || 0 === $id) {
			return alertC('未获取到ID信息');
		}
		$Admin = Admin::get($id);
		if (is_null($Admin)) {
			return alertE('不存在' . $id . '的用户');
		}
		if (!$Admin->delete()) {
			return alertE('删除失败');
		}
		return alertC('成功删除');
	}
/**
 *   更新接收数据表
 */
	public function update() {
// $this->_before_insert();
		// 接收数据
		$id = Request::instance()->post('id/d');
// 从数据模型表里获取对应
		$Admin = Admin::get($id);
// 将数据存入Admin表
		if (!is_null($Admin)) {
			if (!$this->saveAdmin($Admin, true)) {
				return $this->error('更新失败');
			}
		} else {
			return $this->error('当前操作的记录不存在');
		}
//成功则跳转 index触发器
		return $this->success('更新成功');
	}
/**
 *  添加管理员路径渲染
 */
	public function add() {
		return view('/Admin_add');
		return alertC('加载成功！');
	}

	/**
	 * @param  添加和插入新的
	 * @return 验证后的消息
	 */
	public function insert() {

		$data = input('post.');
		// 数据验证
		$result = $this->validate($data, 'User');
		if (true !== $result) {
			return alertE('. $result .');
		}
		$admin = new Admin;
		// 数据保存
		$admin->allowField(true)->save($data);
		return alertC('用户[ ' . $admin->username . ':' . $admin->id . ' ]新增成功');

	}

/**
 *  对数据进行保存或更新
 *  @param Admin    &$Admin
 *  @return bool
 */
	private function saveAdmin(Admin &$Admin, $isUpdate = false) {
// 写入要更新的数据
		if (!$isUpdate) {
			$Admin->username = Request::instance()->post('username');
		}
		$Admin->password = Request::instance()->post('password');
		$Admin->repassword = Request::instance()->post('repassword');
		$Admin->email = Request::instance()->post('email');
// 更新或保存
		return $Admin->AdminValidate(true)->save();
	}
/**
 *
 * 分页控制器
 */
	public function paginate() {
		$paginate = 5;
		$Admin = new Admin;
		$admins = $Admin->paginate($paginate);
		var_dump($admins->cout());
		$admins = $Admin->select();
		var_dump($admins);
	}
	static public function showReturnCode($code = '', $data = [], $msg = '') {
		$return_data = [
			'code' => '500',
			'msg' => '未定义消息',
			'data' => $code == 1001 ? $data : [],
		];
		if (empty($code)) {
			return $return_data;
		}
		$return_data['code'] = $code;
		if (!empty($msg)) {
			$return_data['msg'] = $msg;
		} else if (isset(ReturnCode::$return_code[$code])) {
			$return_data['msg'] = ReturnCode::$return_code[$code];
		}
		return $return_data;
	}
	static public function showReturnCodeWithOutData($code = '', $msg = '') {
		return self::showReturnCode($code, [], $msg);
	}
/**
 * 数据库字段 网页字段转换
 */
	protected function buildParam($array = []) {
		$data = [];
		if (is_array($array) && !empty($array)) {
			foreach ($array as $item => $value) {
				$data[$item] = $this->request->param($value);
			}
		}
		return $data;
	}

}
