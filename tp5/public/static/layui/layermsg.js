layui.use(['element', 'layer', 'form', 'laypage', 'jquery'], function() {
  var element = layui.element, //导航的hover效果、二级菜单等功能，需要依赖element模块
    layer = layui.layer;
  form = layui.form;
  laypage = layui.laypage;
  $ = layui.jquery;

  //监听导航点击
  element.on('nav(filter)', function(elem) {
    console.log(elem);
    layer.msg(elem.text(), { anim: 0,time:4000 }, function() {

    });
  });

  $(function() {
    var href = document.getElementById('myHerf').href;
    var btn = document.getElementById('btn');
    btn.onclick = function() {
     var index=layer.load();
      layer.open({
        type: 2,
        title:false,
        area: ['450px','450px'],
        fixed: true,
        maxmin: false,
        content: [href, 'no'],
        success:function(){
        layer.closeAll('loading');
        layer.iframeAuto(index);
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index);
      }
      });
    }
  })

  /*
 $(function(){
    var content = document.getElementById('myModal');
    var btn = document.getElementById("myBtn");
    var span=document.querySelector('.close');
     btn.onclick=function(){
       content.style.dispaly="block";
      }
     span.onclick=function(){
       content.style.dispaly="none";
     }
    window.onclick=function(event){
      if (event.target==content) {
          content.style.dispaly="none";
      }
    }
      });*/










});
