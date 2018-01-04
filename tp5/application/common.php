<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
/**
 * 封装一个成功、失败的弹窗
 *
 */
function alertC($msg = '', $url = '', $wait = 3) {
	$str = '<script type="text/javascript" src="__PUBLIC__/static/layui/lay/modules/layer.js"></script><script type="text/javascript" src="__PUBLIC__/static/layui/lay/modules/jquery.js"></script>';
	$str .= "<script>
     $(function(){
     layer.msg(" . $msg . ",{time:(" . $wait . "*1000),shade:0.3,shadeClose:ture},function(){self.location.href= " . $url . "});})
        </script>";
	return $str;
}

function alertE($msg = '') {
	$str = '<script type="text/javascript" src="__PUBLIC__/static/layui/lay/modules/layer.js"></script><script type="text/javascript" src="__PUBLIC__/static/layui/lay/modules/jquery.js"></script>';
	$str .= "<script>
     $(function(){
       layer.open({content:" . $msg . ",icon:2,closeBtn:0,shadeClose:true,title: false,shade:0.3,btnAlign:'c',yes:function(index){
              layer.close(index);
              window.history.go(-1);
          }
        });
     })
        </script>";
	return $str;

}
