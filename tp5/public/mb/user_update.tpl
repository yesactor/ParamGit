<div style="padding:10% 40% 10%;background-color:#eeeeee;">
    {php}$action= request()->action()=== 'add' ? 'save' : 'update';{/php}
    <form class="layui-form" role="form" action="{:url($action)}" method="post">
      <div class="layui-nav-item">
        <div class="layui-input-block">
          <label class="layui-form-label">用户名：</label>
           <input type="hidden" name="id" value="{$Admin->id}" />
            {eq name="Admin->username" value=""}
          <input type="text" class="layui-input" lay-verify="username" required name="username" value="{$Admin->username}" />{else /} {$Admin->username} {/eq}
        </div>
        <br />
        <div class="layui-input-block">
          <label class="layui-form-label">密码：</label>
          {eq name="Admin->password" value=""}
          <input type="password" class="layui-input" lay-verify="password"  required  name="password" value="{$Admin->password}"> {else /} {$Admin->password} {/eq}
        </div>
        <br />
        <div class="layui-input-block">

          <label class="layui-form-label">确认密码：</label>
          <input type="repassword" name="layui-input" lay-verify="repassword"  required placeholder="确认密码" name="repassword"  >
        </div>
        <br />
        <div class="layui-input-block">
          {eq name="Admin->email" value=""}
          <label class="layui-form-label">邮箱：</label>
          <input type="text" class="layui-input" name="email" lay-verify="email" required  value="{$Admin->email}">{else /} {$Admin->email} {/eq}
        </div>
        <br />
        <button type="submit" class="layui-btn" name="submit" lay-verify="submit" lay-submit><i class="layui-icon">&#xe609;&nbsp;保存</i></button>
      </div>
    </form>
  </div>
