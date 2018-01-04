<select name="cid" id="cid">
<volist name="list" id="bibi">
<option value="{$bibi.list_id}" <eq name="bibi.list_id" value="$list_id_bind">selected</eq>>{$bibi.list_name}</option>
</volist>
<option value="">取消绑定</option>
</select>
<input class="submit" type="button" value="提 交" onClick="submitbind('{$bind_key}', $('#cid').val());">
<input class="submit" type="button" value="取 消" onClick="hidebind();">
