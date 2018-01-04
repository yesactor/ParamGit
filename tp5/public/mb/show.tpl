<div class="layui-fluid">
  <div class="layui-row">
    <div class="layui-col-md4">
{volist name='info' id="v"}
<table border="1" cellpadding="5" cellspacing="1" class="layui-table">
<tr>
  <td><b>{$key}</b></td>
  <td>{$v}</td>
</tr>
  <br />
</table>
{/volist}
 </div>
 <div class="layui-col-md5 layui-col-md-offset3">
  {volist name="indata" id="b"}
   <table border="1" cellpadding="5" cellspacing="1" class="layui-table">
  <tr>
    <td><b>{$key}</b></td>
    <td>{$b}</td>
  </tr>
  <br />
   </table>
   {/volist}
 </div>
</div>
</div>
