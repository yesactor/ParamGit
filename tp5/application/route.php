<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------


use think\Route;

//Route::bind('\app\index\controller\Admin','class');

   Route::alias('admin','\app\index\controller\AdminController');
   Route::alias('login','\app\index\controller\LoginController');
return[

  '__pattern__' =>[
        'name' => '\w+',
        'id'   => '\d+',
   ],

   'login/index' =>['index/login/index',['method'=>'POST']],
   'login/login' =>['index/login/login',['method'=>'POST']],
   'admin/index' =>['index/admin/index',['method'=>'POST'|'GET']],



];
