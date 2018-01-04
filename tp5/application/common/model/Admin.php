<?php
// 简单的原理重复记： namespace说明了该文件位于application\common\model 文件夹中
namespace app\common\model;
use think\Model;

//  导入think\Model类

/**
 * Admin
 */

// 我的类名对应的文件名，该类继承了Model类，Model我们在文件头中，提前使用use进行了导入。
class Admin extends Model {

	protected $auto = [];
	protected $insert = [
		'status' => 1,
		'ip',
		'create_time',
	];
	protected $update = ['status',
		'ip',
		'update_time'];
	protected $createTime = 'create_time';
	protected $updateTime = 'update_time';
	protected $type = [
		'create_time' => 'timestamp:Y/m/d',
		'update_time' => 'timestamp:Y/m/d',

	];

	protected function setIpAttr($ip) {
		return request()->ip();
	}
	protected function setNameAttr($value) {
		return strtolower($value);
	}
	protected function setStatusAttr($value) {
		$status = [-1 => '禁用', 0 => '错误', 1 => '正常', 2 => '检查'];
		return $status[$value];
	}

	/**
	 * 用户登录认证
	 * @param  string  $username 用户名
	 * @param  string  $password 用户密码
	 * @return integer 登录成功-用户ID，登录失败-返回0或-1
	 */
	public function login($username, $password) {

		/* 获取用户数据 */
		$admin = $this->where('username', '=', $username)->find();
		if ($admin) {
			if (md5($password) != $admin->password) {
				$data = ['static' => 0, 'msg' => '密码错误'];
				return json($data);
			} else {
				return $admin->id;
			}
		} else {
			$data = ['static' => -1, 'msg' => '用户不存在或被禁用'];
			return json($data);
		}
	}

	/**
	 * 获取用户信息
	 * @param  integer  $uid 用户主键
	 * @return array|integer 成功返回数组，失败-返回-1
	 */
	public function info($uid) {
		$admin = $this->where('id', $uid)->field('id,username,password,email,ip,status')->find();
		if ($admin && 1 == $admin->status) {
			// 返回用户数据
			return $admin->hidden('status')->toArray();
		} else {
			$data = ['static' => -1, 'msg' => '用户不存在或被禁用'];
			return json($data);
		}
	}

	/**
	 * 获取用户角色
	 * @return integer 返回角色信息或者返回-1
	 */
	public function role() {
		$uid = $this->getData('id');
		if ($uid) {
			$role = $this->getAdminRole($uid);
			if ($role) {
				return $role;
			} else {
				$this->error = '用户未授权';
				return 0;
			}
		} else {
			$this->error = '请先登录';
			return -1;
		}
	}

	protected function getAdminRole($uid) {
		return $this->table('role')->where('uid', $uid)->find();
	}
	/**
	 * 验证密码是否正确
	 * @param string $password  密码
	 * @return bool
	 */
	static public function checkPasswoed($password) {
		if ($this->getData('password') === $this::encryptPassword($password)) {
			return true;
		} else {
			return false;
		}
	}
	/**
	 * 密码加密算法
	 * @param    string                   $password 加密前密码
	 * @return   string                             加密后密码
	 * @author
	 * @DateTime 2016-10-21T09:26:18+0800
	 */
	static public function encryptPassword($password) {
		if (!is_string($password)) {
			throw new \RuntimeException("传入变量类型非字符串，错误码2", 2);
		}

		// 实际的过程中，我还还可以借助其它字符串算法，来实现不同的加密。
		return sha1(md5($password) . 'bibib');
	}
	/**
	 * 系统后台 会员登录后 将会员验证内容写入对应cookie中
	 * @param string $name 用户名
	 * @param int $id 用户ID
	 * @return bool 布尔类型的返回结果
	 */
	protected final function systemSetKey($username) {
		cookie(COOKIE_PRE . 'sys_key', encrypt(serialize($username), MD5_KEY), 3600);
	}
	/**
	 * 用户注销
	 * @return [type] [description]
	 */
	public function logOut() {
		session('adminId', null);
		return true;

	}

	/**
	 * 判断用户是否已登录
	 * @return boolean 已登录true
	 * @author  panjie <panjie@yunzhiclub.com>
	 */
	static public function isLogin() {
		$adminId = session('adminId');
		// isset()和is_null()是一对反义词
		if (isset($adminId)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 *  判断是否新增
	 */

}
