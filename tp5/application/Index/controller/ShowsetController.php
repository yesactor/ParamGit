<?php
namespace app\Index\controller;
use think\Controller;

class ShowsetController extends Controller {

	public function index() {
		$info = array(
			'PHP操作系统：' => PHP_OS,
			'PHP脚本解释引擎：' => PHP_SAPI,
			'PHP版本：' => PHP_VERSION,
			'允许上传文件最大值：' => get_cfg_var("file_uploads") ? get_cfg_var("upload_max_filesize") : $error,
			'PHP脚本超时时间：' => ini_get('max_execution_time') . '秒',

		);
		$indata = array(
			'服务器操作系统：' => $_SERVER["SERVER_SOFTWARE"],
			'服务器(IP/端口)：' => $_SERVER['SERVER_NAME'] . ' (' . $_SERVER['SERVER_ADDR'] . ':' . $_SERVER['SERVER_PORT'] . ')',

			'GD图形处理扩展库版本：' => @gd_info()['GD Version'],
			'服务器时间：' => date("Y年n月j日 H:i:s"),
			'北京时间：' => gmdate("Y年n月j日 H:i:s", time() + 8 * 3600),
			'剩余空间：' => round((disk_free_space(".") / (1024 * 1024)), 2) . 'M',
		);
		$this->assign('info', $info);
		$this->assign('indata', $indata);
		$tpls = $this->fetch('/show');
		return $tpls;
	}

}
