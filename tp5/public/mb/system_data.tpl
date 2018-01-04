
<div class="layui-fluid">
<div class="layui-row">
  <div class="layui-col-md4">
  <table border="0" cellpadding="5" cellspacing="1" class="layui-table">
  <tbody>
  <tr>
    <td>服务器 (IP/端口)：</td>
    <td>{?php echo $_SERVER['SERVER_NAME'].' ('.$_SERVER['SERVER_ADDR'].':'.$_SERVER['SERVER_PORT'].')'; ?}</td>
  </tr>
  <tr>
    <td>服务器操作系统：</td>
    <td>{?php echo $_SERVER['SERVER_SOFTWARE']; ?}</td>
  </tr>
  <tr>
    <td>PHP版本：</td>
    <td>{?php echo PHP_VERSION;?}&nbsp;&nbsp;<span>>5.10</span></td>
  </tr>
  <tr>
    <td>PHP脚本解释引擎：</td>
    <td>{?php echo PHP_SAPI;?}</td>
  </tr>
  <tr>
    <td>PHP脚本超时时间：</td>
    <td>{?php echo ini_get('max_execution_time');?} 秒 &nbsp;&nbsp;<span>可修改index.php第3行控制参数</span></td>
  </tr>
  <tr>
    <td>允许上传文件最大值：</td>
    <td>{?php echo get_cfg_var("file_uploads") ? get_cfg_var("upload_max_filesize") : $error;?}</td>
  </tr>
</tbody>
</table>
</div>
  <div class="layui-col-md5 layui-col-md-offset3">
    <table border="0" cellpadding="5" cellspacing="1" class="layui-table">
  <tbody>
  <tr>
    <td>Mysql数据库支持：</td>
    <td>{?php echo function_exists(@mysql_close) ? mysql_get_client_info() : $error;?}&nbsp;&nbsp;<span>不支持或小于4.20版本则无法使用本系统</span></td>
  </tr>
  <tr>
    <td>allow_url_fopen支持：</td>
    <td>{?php echo ini_get("allow_url_fopen") ? $pass : $error;?} &nbsp;&nbsp;<span>不符合要求将导致采集、远程资料本地化等功能无法应用</span></td>
  </tr>
  <tr>
    <td>file_get_contents支持：</td>
    <td>{?php echo function_exists(@file_get_contents) ? $pass : $error;?} &nbsp;&nbsp;<span>不符合要求将导致采集、远程资料本地化等功能无法应用</span></td>
  </tr>
  <tr>
    <td>GD图形处理扩展库版本：</td>
    <td>{?php $gd = @gd_info(); echo $gd['GD Version'] ? $gd['GD Version'] : $error;?}&nbsp;&nbsp;<span>不支持或小于2.0.34版本将不能给图片添加水印</span></td>
  </tr>
</tbody>
</table>
  </div>

</div>
</div>
