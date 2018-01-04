 {block name="saveall"}
<div class="layui-container" style="text-align: center;background-color:#dddddd;">
  {php} $action= request()->action()=== 'edit' ? 'save' : 'update'; {/php}
  <form class="layui-form" role="form" action="{:url($action)}" method="post">
    <div class="layui-nav-item">
      <div class="layui-input-block">
        <label class="layui-form-label">用户名：</label>
        <input type="text" class="layui-input" lay-verify="username" required placeholder="用户名" name="username" value="" />{eq name="Admin->username" value=""}{else /} {$Admin->username} {/eq}
      </div>
      <br />
      <div class="layui-input-block">
        <label class="layui-form-label">密码：</label>
        <input type="password" class="layui-input" lay-verify="password" required placeholder="登陆密码" name="password" value="{$Admin->password}"> {eq name="Admin->password" value=""} {else /} {$Admin->password} {/eq}
      </div>
      <br />
      <div class="layui-input-block">
        <label class="layui-form-label">确认密码：</label>
        <input type="repassword" name="layui-input" lay-verify="repassword" required placeholder="确认密码" name="repassword">
      </div>
      <br />
      <div class="layui-input-block">
        <label class="layui-form-label">邮箱：</label>
        <input type="text" class="layui-input" name="email" lay-verify="email" required placeholder="@" value="{$Admin->email}"> {eq name="Admin->email" value=""}{else /} {$Admin->email} {/eq}
      </div>



      <button  type="submit"  class="layui-btn layui-btn-lg layui-btn-primary" lay-submit> <i class="layui-icon"  style="font-size: 30px; color: #1E9FFF;">&#xe609;&nbsp;保存</i></button>
      <br />
      <a href="{?php  self.loaction.go(-1); ?}" class="layui-btn layui-btn-lg layui-btn-primary" ></a>
    </div>
  </form>
</div>
{/block}
<br />

