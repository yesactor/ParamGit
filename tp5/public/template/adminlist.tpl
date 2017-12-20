{block name="adminlist"}
      <br/>
     <table class="layui-table" style="background-color:#dddddd;">
        <tr>
          <th>ID</th>
          <th>用户名</th>
          <th>密码</th>
          <th>邮箱地址</th>
          <th>管理员登陆IP</th>
          <th>创建Unix时间戳</th>
        </tr>
        {volist name="list" id="Admin"}
        <tr>

          <td>{$Admin.id}</td>
          <td>{$Admin.username}</td>
          <td>{$Admin.password}</td>
          <td>{$Admin.email}</td>
          <td>{$Admin.ip}</td>
          <td>{$Admin.logintime}</td>
          <td>
            <a class="layui-btn" href="{:url('edit?id=' . $Admin->getData('id'))}"><i class="layui-icon">&#xe642;&nbsp;编辑</i></a>
            &nbsp;
            <br />

            <br />
            <a class="layui-btn" href="{:url('delete?id=' . $Admin->getData('id'))}"><i class="layui-icon">&#xe640;&nbsp;删除</i></a>
          </td>
        </tr>
        {/volist}
      </table>
          <br />
          <div id="paginate"></div>


{/block}

