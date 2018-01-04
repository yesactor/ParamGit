{__NOLAYOUT__}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>跳转提示：</title>
<link rel="stylesheet"  href="__PUBLIC__/static/layui/css/layui.css" />
<script type="text/javascript" src="__PUBLIC__/static/layui/lay/modules/layer.js" />
<script type="text/javascript" src="__PUBLIC__/static/layui/lay/modules/jquery.js" />
</head>
<body>
<?php
switch($code){
?>
<?php
case 1:
?>
<i class="layui-icon">&#xe605;</i>
<div class="success" >
  <script type="text/javascript">
 $(function(){
 layer.open({
      content:'<?php echo $msg ?>',
      closeBtn:0,shadeClose:true,title: false,shade:0.3,
      time:$time,
      success:function(index){
        layer.close(index);
        self.location.href=$url;
       }
    });
 })
</script>
</div>
 <?php
  break;
  ?>
 <?php
  case 0:
  ?>
 <i class="layui-icon">&#x1007;</i>
 <div class="error">
 <script type="text/javascript">
  $(function(){
 layer.open({
      content:'<?php echo $msg ?>',
      closeBtn:0,shadeClose:true,title: false,shade:0.3,
      btnAlign: 'c',
      yes:function(index){
        layer.close(index);
        location.reload();
       }
    });
 })
  </script>
 </div>
<?php
 break;
 ?>
<?php
 }
 ?>

</body>
</html>
