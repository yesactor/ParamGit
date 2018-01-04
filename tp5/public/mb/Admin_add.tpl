{__NOLAYOUT__}
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>添加新管理员</title>
  <link rel="stylesheet" href="__PUBLIC__/static/layui/css/layui.css" media="all">
</head>
<body class="layui-bg-green">
  <form style="padding: 10%;" class="layui-form" role="form" action>
    <div class="layui-form-item">
      <label class="layui-form-label">用户名：</label>
      <div class="layui-input-inline">
      <input type="text" class="layui-input" lay-verify="username" required placeholder="用户名" name="username" />
    </div>
    </div>
    <br />
    <div class="layui-form-item">
      <label class="layui-form-label">密码：</label>
      <div class="layui-input-inline">
      <input type="password" class="layui-input" lay-verify="password" required placeholder="登陆密码" name="password" />
    </div>
    </div>
    <br />
    <div class="layui-form-item">
      <label class="layui-form-label">确认密码：</label>
      <div class="layui-input-inline">
      <input type="password" class="layui-input" lay-verify="repassword" required placeholder="确认密码" name="repassword" />
    </div>
    </div>
    <br />
    <div class="layui-form-item">
      <label class="layui-form-label">邮箱：</label>
      <div class="layui-input-inline">
        <input type="text" class="layui-input" name="email" lay-verify="email" required placeholder="@">
      </div>
    </div>
    <br/>
    <div style="text-align:center;">
    <a  type="submit" href="{:url('Admin/insert')}"  class="layui-btn layui-btn-lg layui-btn-primary" lay-submit> <i class="layui-icon"  style="font-size: 30px; color: #1E9FFF;">&#x1005;</i></a>

   </div>
</form>
</body>
</html>


