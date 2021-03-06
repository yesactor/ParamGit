<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>视频资源库列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel='stylesheet' type='text/css' href='__PUBLIC__/css/admin-style.css' />
<script src="__PUBLIC__/jquery/1.11.3/jquery.min.js"></script>
<script src="__PUBLIC__/js/admin.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$bibicms.show.table();
	$('.cj-bind').on('click',function(e){
		setbind(e, 1, $(this).attr('data-key') ,$(this).attr('data-val'));
	});
	$('#search').on('click',function(){
		$('#myform').attr('action','?g=admin&m=cj&a=apis&action=show');
		$('#myform').submit();
	});
	$('#vod-day').on('click',function(){
		$("input[name='ids[]']").each(function(){
			this.checked = false;
		});
		$('#myform').attr('action','?g=admin&m=cj&a=apis&action=days&h=24');
		$('#myform').submit();
	});
	$('#vod-list').on('click',function(){
		$("input[name='ids[]']").each(function(){
			this.checked = false;
		});
		$('#myform').attr('action','?g=admin&m=cj&a=apis&action=all&cid={$cid}');
		$('#myform').submit();
	});
	$('#vod-all').on('click',function(){
		$("input[name='ids[]']").each(function(){
			this.checked = false;
		});
		$('#myform').attr('action','?g=admin&m=cj&a=apis&action=all');
		$('#myform').submit();
	});
});
</script>
</head>
<body class="body bb-cj">
<include file="./Public/system/plus_bg.html" />
<!--绑定分类表单框-->
<div id="setbind" style="position:absolute;display:none;background:#efefef;padding:20px;z-index:9;"></div>
<form action="?g=admin&m=cj&a=apis&action=post" method="post" name="formapi" id="formapi" target="_blank">
<input name="cjid" type="hidden" value="{$cjid}" />
<input name="cjtype" type="hidden" value="1" />
<input name="xmlurl" type="hidden" value="{$xmlurl}" />
<input name="xmltype" type="hidden" value="{$xmltype}" />
<table border="0" cellpadding="0" cellspacing="0" class="table">
<thead>
<tr>
<th colspan="2" class="r">
	<span style="float:left">个性采集 <notempty name="cid" value="0"><a href="?s=Admin-Cj-Apis-cjid-{$cjid}-cjtype-1-action-show-xmlurl-{$xmlurl}"><font color="red">全部资源</font></a>
</notempty></span>
  <span style="float:right"><a href="?s=Admin-Cj-Show-type-1">返回资源库列表</a></span>
</th>
</tr>
</thead>
<tr>
<td class="tl">
分类ID：
</td>
<td class="pd l"><input type="text" name="cid" id="cid" class="w100 ct" maxlength="8" value="{$cid}"> 不限制，请留空</td>
</tr>
<tr>
<td class="tl">
更新时间：
</td>
<td class="pd l"><input type="text" name="h" id="h" class="w100 ct" maxlength="8" value="24"> 单位：小时，不限制时间留空</td>
</tr>
<tr>
<td class="tl">
指定播放器：
</td>
<td class="pd l"><input type="text" name="play" id="play" class="w100 ct" maxlength="20" value="{$play}"> 如：youku，不限制，请留空</td>
</tr>
<tr>
<td class="tl">
每页采集数量：
</td>
<td class="pd l"><input type="text" name="limit" id="limit" class="w100 ct" maxlength="3" value="{$limit|default=50}"> 最大100</td>
</tr>
<tr>
<td class="tl">
重采资料字段：
</td>
<td class="pd l"><input type="text" name="field" id="field" class="w100 ct" maxlength="50"> 如：vod_pic,vod_scenario,vod_area（填写后将只直接更新对应的字段，不新增也不修改其它字段）</td>
</tr>
<a name="bind"></a>
<tr>
<td class="tl">
资源站分类转换：
</td>
<td class="pd l td-bind">
<volist name="cj_list" id="bibi">
<li>
<a href="?g=admin&m=cj&a=apis&cjid={$cjid}&cjtype=1&action=show&xmlurl={$xmlurl}&cid={$bibi.list_id}&wd={$wd}">{$bibi.list_name}（{$bibi.list_id}）</a><a class="cj-bind" href="javascript:;" data-key="{$bibi.bind_key}" data-val="{$bibi.list_id}" id="bind_{$bibi.bind_key}"><if condition="bb_bind_id($bibi['bind_key']) gt 0"><font color="green">已转换</font><else /><font color="red">未转换</font></if></a>
</li>
</volist>
</td>
</tr>
<tr>
<td class="tl">
相关操作：
</td>
<td class="pd l">
<input type="submit" value="开始采集" class="submit">
<notempty name="cid" value="0">
<input type="button" value="采集本类" class="submit" id="vod-list">
</notempty>
<input type="button" value="采集当天" class="submit" id="vod-day">
<input type="button" value="采集所有" class="submit" id="vod-all">
</td>
</tr>
</table>
</form>
<!-- -->
<form action="?g=admin&m=cj&a=apis&action=ids" method="post" name="myform" id="myform">{__NOTOKEN__}
<input name="cjid" type="hidden" value="{$cjid}" />
<input name="cjtype" type="hidden" value="1" />
<input name="xmlurl" type="hidden" value="{$xmlurl}" />
<input name="xmltype" type="hidden" value="{$xmltype}" />
<table border="0" cellpadding="0" cellspacing="0" class="table">
<thead>
<tr>
<th class="r">视频搜索</th>
</tr>
</thead>
<tr>
<td class="l pd ct">
	<input type="text" name="wd" id="wd" maxlength="20" value="{$wd|urldecode}" onClick="this.select();" class="w400 pd">
  <input type="button" name="search" id="search" value="搜索" class="submit">
</td>
</tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" class="table">
<thead>
<tr class="ct">
  <th class="l" >片名、状态 </th>
  <th class="l" width="100">入库分类</th>
  <th class="l" width="250">来源</th>
  <th class="r ct" width="180">更新时间</th>
</tr>
</thead>
<tbody>
<volist name="cj_data" id="bibi">
  <tr>
    <td class="l pd"><input name='ids[]' type='checkbox' value='{$bibi.vod_id}' class="noborder">『{$bibi.list_name}』{$bibi.vod_name}{$bibi.vod_title} <neq name="bibi['vod_continu']" value="0"><sup>{$bibi.vod_continu}</sup></neq> <a href="?s=Admin-Vod-Show-wd-{$bibi.vod_name|msubstr=0,4|urlencode}" target="_blank" style="color:#bb0000">查</a> </td>
    <td class="l ct">
    	<if condition="bb_bind_id($cjid.'_'.$bibi['vod_cid']) gt 0"><font color="green">已转换</font><else /><font color="red">未转换</font></if>
    </td>
    <td class="l ct">{$bibi.vod_play|str_replace='$$$',' ',###}</td>
    <td class="r ct">{$bibi.vod_addtime}</td>
  </tr>
</volist>
</tbody>
 <tr>
    <td colspan="4" class="r pages">{$page_list}</td>
  </tr>
<tfoot>
<tr>
  <td colspan="3" class="r">
  <input type="button" value="全选" class="submit" onClick="checkall('all');">
  <input type="button" value="反选" class="submit" onClick="checkall();">
  <input type="submit" value="采集选中" class="submit">
  </td>
</tr>
</tfoot>
</table>
</form>
<include file="./Public/system/footer.html" />
</body>
</html>
