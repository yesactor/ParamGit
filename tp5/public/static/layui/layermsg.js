

layui.use(['element','layer','form','laypage'], function(){
  var element = layui.element, //导航的hover效果、二级菜单等功能，需要依赖element模块
      layer = layui.layer;
      form =layui.form;
      laypage=layui.laypage;
  //监听导航点击
  element.on('nav(nav)', function(elem){
    console.log(elem);
    layer.msg(elem.text(),{anim:0},{time:2000},function(){});
  });

  laypage.render({
    elem:'paginate',
    count:data,
      jump:function(obj){
       console.log(obj.curr);
       console.log(obj.limit);

      }
  });

/*
  layer.open({
  type: 2,
  content: 'test/iframe.html',
  success: function(layero, index){
    var body = layer.getChildFrame('body', index);
    var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
    console.log(body.html()) //得到iframe页的body内容

     }
   });
*/

});
