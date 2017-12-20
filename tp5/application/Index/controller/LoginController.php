<?php
namespace app\index\controller;
use think\Request;              // 请求
use think\Controller;
use app\common\model\Admin;
use think\Validate;


class LoginController extends AdminController
{
    // 用户登录表单
    public function index()
    {

        // 显示登录表单
             return view('/loging');

    }

    // 处理用户提交的登录数据
    public function login ()
    {
                header("Access-Control-Allow-Origin: *");
                if ($this->request->isAjax()) {

                                          }
    }

    // 注销
    public function logOut()
    {
        if (Admin::logOut()) {
            return $this->success('成功注销登陆！', url('Logout'));
        } else {
            return $this->error('注销登陆失败！', url());
        }
    }









}
