
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
{block name="title"}<title>[title]</title>{/block}
{css  href="__PUBLIC__/static/layui/css/layui.css" /}
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
{include file="menu" /}
{include file="left" /}
<div class="layui-body" style="padding: 15px;">
{__REPLACE__}
</div>
<iframe src="" id="iframe" name="demo" frameborder="0" scrolling="no"></iframe>
<div class="layui-footer"> © yesactor.com -</div>
</div>
{js href="__PUBLIC__/static/jquery/jquery-3.1.1.min.js" /}
{js  href="__PUBLIC__/static/layui/layui.all.js" /}
{load href="__PUBLIC__/static/layui/layermsg.js" /}
</body>
</html>
