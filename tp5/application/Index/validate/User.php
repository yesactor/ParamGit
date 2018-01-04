<?php
namespace app\index\validate;

use think\Validate;

class User extends Validate {
	// 验证规则

	protected $rules = [
		['name', 'alphaDash|length:5,20', '请输入正确的用户名(为字母和数字，下划线_及破折号-)|长度在5-20之间'],
		['password', 'require|length:5,20|alphaDash|confirm', '密码不能为空|长度在5-20之间|请输入正确的密码(为字母和数字，下划线_及破折号-)|'],
		['repassword', 'confirm:password', '两次输入的密码必须相同'],
		['email', 'email', '邮箱格式错误'],

	];

	// 自定义验证规则
	protected function checkName($value, $rule, $data) {
		return $rule == $value ? true : '名称错误';
	}

}
