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

Route::resource('blog', 'index/Blog');
Route::rule(['login', 'login/:[data]:[id]'], '\app\index\controller\Login');
Route::rule(['admin', 'admin/:[data]:[id]'], '\app\index\controller\Admin');
Route::rule(['cj', 'cj/:[data]:[id]'], '\app\index\controller\Cj');
Route::rule(['showset', 'showset/:[data]:[id]'], '\app\index\controller\Showset');
Route::pattern([
	'name' => '\w+',
	'id' => '\d+',
]);

return [

	'__alias__' => [
		'login' => 'index/Login',
		'admin' => 'index/Admin',
		'cj' => 'index/Cj',
		'showset' => 'index/Showset',
	],
	'__rest__' => [
		'blog' => 'index/Blog',
	],

	/*首页*/
	'' => 'index/Showset/index',

];
