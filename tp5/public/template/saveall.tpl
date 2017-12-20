
{block name="saveall"}
 <div style="padding:10% 40% 10%;background-color:#dddddd;">
     {php}$action= request()->action()=== 'add' ? 'save' : 'update';{/php}
    <form class="layui-form" role="form" action="{:url($action)}" method="post">
      <div class="layui-nav-item">

        <div class="layui-input-block">
          <label class="layui-form-label">用户名：</label>
            {eq name="Admin->username" value=""}
          <input type="text" class="layui-input" lay-verify="username" required  placeholder="用户名" name="username" value="{$Admin->username}" /> {else /} {$Admin->username} {/eq}
        </div>
        <br />
        <div class="layui-input-block">
          <label class="layui-form-label">密码：</label>
          {eq name="Admin->password" value=""}
          <input type="password" class="layui-input" lay-verify="password"  required placeholder="登陆密码" name="password" value="{$Admin->password}"> {else /} {$Admin->password} {/eq}
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
          <input type="text" class="layui-input" name="email" lay-verify="email" required placeholder="@" value="{$Admin->email}">{else /} {$Admin->email} {/eq}
        </div>
        <br />
        <button type="submit" class="layui-btn" name="submit" lay-verify="submit" lay-submit><i class="layui-icon">&#xe609;&nbsp;保存</i></button>
      </div>
    </form>
  </div>
{/block}
<br />
{block name="list"}
{block}
