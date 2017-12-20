<?php
namespace app\index\validate;

use think\Validate;

class AdminValidate extends Validate
{
    // 验证规则


    protected $rule = [
        'username'  =>  'require|chAlphaNum|min:5',
        'password'  =>  'require|confirm|between:5,10',
        'repassword'=>  'require|confirm:password',
        'email'     =>  'email',

    ];

    protected $message = [
        'username'  =>  '用户名是必须的|只能是字母和数字|长度最小5个字段',
        'password'   => '密码是必须的|字段在5-10个字段之间',
        'repassword' => '确认密码是必须的|两次输入的密码必须相同',
        'email' =>  '邮箱格式错误',

    ];

    // 自定义验证规则
    protected function checkedLike($state)
    {
        return  like.elem.checked ?  $true : $false ;
    }






}
