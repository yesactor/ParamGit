{block name="adminlist"}
     <table class="layui-table  layui-bg-gray" >
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
          <td>{$Admin.status}</td>
          <td>{$Admin.create_time}</td>
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
{/block}

{block name="Admin_add"}
<div  class="layui-inline">
<button class="layui-btn layui-btn-radius layui-btn-normal" id="btn"><i class="layui-icon">&#xe654;&nbsp;添加</i></button>
<a href="?s=admin-add" id="myHerf" title="新添加管理员" class="layui-hide" ></a>
</div>
{/block}


