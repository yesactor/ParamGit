{__NOLAYOUT__}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>Document</title>
<link rel="stylesheet"  href="__PUBLIC__/static/layui/css/layui.css" />
<script type="text/javascript" src="__PUBLIC__/static/layui/lay/modules/layer.js" />
<script type="text/javascript" src="__PUBLIC__/static/jquery/jquery-3.1.1.min.js" />
</head>
<body>
<?php if(isset($msg)) {?>

  <div class="success">
   <script>
    $(function(){
        layer.msg($msg, {icon: 1,time: 3500,shade:0.3,shadeClose:true}, function(){
              location.href=$jumpurl;
        });
    })
   </script>
   </div>
 <?php }else{ ?>
  <div class="error">
   <script>
      $(function(){
          layer.open({content:'<?php echo $msg ?>',closeBtn:0,shadeClose:true,title: false,shade:0.3,btnAlign: 'c',yes:function(index){
              layer.close(index);
              location.reload();
          }
        });
       })
   </script>
   </div>
<?php } ?>
</body>
</html>
