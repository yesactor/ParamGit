{__NOLAYOUT__}
<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="utf-8">
{css  href="__PUBLIC__/static/layui/css/layui.css" /}

  <title>
    管理员登陆
  </title>
</head>

<body style="background-color:#AEDCC1;">
  <div style="padding: 20% 37% 10%;text-align: center;">
    <div style="background-color: #5E5A5A;padding:10px 20px 10px;">
    <span><h2><b style="color:#FFFFFF;">后台系统登陆</b></h2></span>
    <br />
    <form class="layui-form layui-form-pane" method="post" action="{:url('login/login')}" false>
      <div class="layui-form-item">
        <label class="layui-form-label"><i class="layui-icon" style="font-size: 20px; ">&#xe68e;</i></label>
        <div class="layui-input-block">
          <input class="layui-input" lay-verify="username" placeholder="用户名" type="text" autocomplete="off" id="username" lay-verType name="username" onfocus="this.style.borderColor='#fc99838'" onblur="this.style.borderColor='#dcdcdc'">
        </div>
      </div>
      <br />
      <div class="layui-form-item">
        <label class="layui-form-label"><i class="layui-icon" style="font-size: 20px; ">&#xe617;</i></label>
        <div class="layui-input-block">
          <input class="layui-input" lay-verify="password" placeholder="登陆密码" type="password" name="password" lay-verType id="password" onfocus="this.style.borderColor='#fc99838'" onblur="this.style.borderColor='#dcdcdc'">
        </div>
      </div>

        <div class="layui-input-block" style="float:right;width:80px;"  pane>
        <input type="checkbox" name="like['remember']" title="记住"  checked>
        </div>
        <br />
         <br />
      <div class="layui-form-item">
        <button class="layui-btn" id="submit" style="width:150px;" lay-submit lay-filter="submit">登 陆</button>
      </div>
    </form>
     </div>
  </div>

{js href="__PUBLIC__/static/jquery/jquery-3.1.1.min.js" /}
{js  href="__PUBLIC__/static/layui/layui.all.js" /}
  <script type="text/javascript">
  layui.use(['form','layer'],function() {
    var layer = layui.layer,
      form = layui.form;
    form.verify({
      username: function(value) { //value：表单的值、item：表单的DOM对象
        if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
           return  '用户名不能有特殊字符';
        }
        if (/(^\_)|(\__)|(\_+$)/.test(value)) {
         return '用户名首尾不能出现下划线\'_\'';
        }
        if (/^\d+\d+\d$/.test(value)) {
          return '用户名不能全为数字';
        }
      },
      password: [
        /^[\S]{6,12}$/,
       '密码必须6到12位，且不能出现空格'
      ]
    });

    form.on("submit(submit)", function(data) {
      console.log(data.field);
           layer.load(1);
      var    actionUrl=$('form').attr('action');
      $.ajax({
        type: 'POST',
        url: actionUrl,
        datatype:'json',
        data:data.field,
        success: function(data) {
          layer.closeAll('loading');
        if (data.code === 1) {
            layer.msg(data.msg,{shade:0.3,time:3000},function(){
            location.href='{:url('admin/index')}';
          });

        }else{
           layer.msg(data.msg,{shade:0.3,time:0,closeBtn: 0,shadeClose:true}, function() {})
        }
      }
    });
      return false;
  })
  });
  </script>
</body>

</html>
