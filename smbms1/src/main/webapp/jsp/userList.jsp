<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="<%=path%>/jsp/css/public.css"/>
    <link rel="stylesheet" href="<%=path%>/jsp/css/style.css"/>
<%--    <link rel="stylesheet" href="<%=path%>/jsp/js/bootstrap/css/bootstrap.min.css"/>--%>
    <link rel="stylesheet" href="<%=path%>/easyui/themes/icon.css"/>
    <link rel="stylesheet" href="<%=path%>/easyui/themes/default/easyui.css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_TW.js"></script>
    <script type="text/javascript">


        function updatecommit(index){
var selectedRow=$('#test').datagrid('getSelected');
$.ajax({
    url:'<%=path%>/updateUser',
    type:"post",
    data:{
        "id":selectedRow.id,
        "userName":$("[name=userName1]").val(),
        "gender":$("[name=gender1]").val(),
        "birthday":$("[name=birthday1]").val(),
        "userRole":$("[name=userType1]").val(),
        "address":$("[name=address1]").val(),
        "phone":$("[name=phone1]").val()},
    success:function(data){
        $("#test").html('');
        if(data){
            $.messager.alert('提示','修改成功');
            $( '#test').datagrid( 'reload');

        }
    }

});
        }













function del(index) {
    $.messager.confirm('确认','确认删除?',function (row) {
        if(row){
            var selectedRow=$('#test').datagrid('getSelected');
            $.ajax({
                url:'<%=path%>/delUser?id='+selectedRow.id,
                success:function(data){
                    if(data){
                        $.messager.alert('提示','删除成功','question')
                    }
                }
            });
            $('#test').datagrid('deleteRow',index);
        }
    })
}


    function load(){
        $('#test').datagrid({
            title:'用户列表',
            iconCls:'icon-save',
            width:800,
            height:450,
            nowrap: true,
            striped: true,
            url:'${pageContext.request.contextPath}/userList?userName='+$("[name=uname]").val(),
            sortName: 'code',
            userNumber:2,
            sortOrder: 'desc',
            idField:'code',
            frozenColumns:[[
                {field:'ck',checkbox:true},
                {title:'用户编号',field:'code',width:80,sortable:true}
            ]],
            columns:[[
                {field:'userName',title:'用户姓名',width:120},
                {field:'address',title:'用户地址',width:120,rowspan:2,sortable:true},
                {field:'phone',title:'用户电话',width:150,rowspan:2},
                {field:'col4',title:'操作',width:150,rowspan:2,
                    formatter:function(value,rec,index){
                        var a="<a href='${pageContext.request.contextPath}/UserServlet?action=viewUser&id=${user.id}'><img src='${pageContext.request.contextPath}/jsp/img/read.png' alt='查看' title='查看'/></a>";
                        var c='<a href="#" onclick="del(\''+ index +'\')">'+"<img src='${pageContext.request.contextPath}/jsp/img/schu.png' alt='删除' title='删除' />"+'</a>';
                        var b='<a href="#" onclick="update(\''+ index +'\')">'+"<img src='${pageContext.request.contextPath}/jsp/img/xiugai.png' alt='修改' title='修改'/></a>";
                        return a+b+c;

                    }}

            ]],
            pagination:true,
            rownumbers:true,
            pageSize:2,
            pageList:[2,3,5,10],
            singleSelect:false,
            toolbar:[{
                text:'添加用户',
                iconCls:'icon-add',
                handler:function(){
                    open1();
                }
            },{
                text:'Cut',
                iconCls:'icon-cut',
                disabled:true,
                handler:function(){
                    alert('cut')
                }
            },'-',{
                text:'Save',
                iconCls:'icon-save',
                handler:function(){
                    alert('save')
                }
            }]
        });


    }

    //模糊查询
    var btnSelect=function() {
        load();
    };
    $(function () {
        load();

    });
function open1() {
    $('#addUser').dialog();

}
function update() {
    $('#updateUser').dialog();

}

    function closeqq() {
        $('#addUser').dialog('close');
    }
        function update2() {
            $('#updateUser').dialog('close');
        }

    </script>
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>超市账单管理系统</h1>
        <div class="publicHeaderR">
            <p><span>下午好！</span><span style="color: #fff21b"> Admin</span> , 欢迎你！</p>
            <a href="login.html">退出</a>
        </div>
    </header>
<!--时间-->
    <section class="publi,,cTime">
        <span id="time">2015年1月1日 11:11  星期一</span>
        <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
    </section>
<!--主体内容-->
    <section class="publicMian ">
        <div class="left">
            <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
            <nav>
                <ul class="list">
                    <li><a href="billList.html">账单管理</a></li>
                    <li><a href="providerList.html">供应商管理</a></li>
                    <li  id="active"><a href="<%=path%>/jsp/userList.jsp">用户管理</a></li>
                    <li><a href="password.html">密码修改</a></li>
                    <li><a href="login.html">退出系统</a></li>
                </ul>
            </nav>
        </div>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>用户管理页面</span>
            </div>
            <div class="search">
                <span>用户名：</span>
                <input type="text" name="uname" placeholder="请输入用户名"/>
                <input type="button" onclick="btnSelect()" value="查询"/>
                <a href="userAdd.html">添加用户</a>
            </div>
            <!--用户-->
            <table id="test">

            </table>
            <div  class="pagination" id="pagination" ></div>
        </div>
    </section>







<div class="tianzhaozhezhao">
<div  id="updateUser" style="width:700px;padding:30px 60px;font-size: 17px;">
    <form action="javascript:updatecommit()" method="post">
        <!--div的class 为error是验证错误，ok是验证成功-->
        <div>
            <label for="userName">用户名称：</label>
            <input type="text" name="userName1" />
            <span >*</span>
        </div>

        <div>
            <label >用户性别：</label>

            <select name="gender1">
                <option value="1">男</option>
                <option value="0" selected>女</option>
            </select>
        </div>
        <div>
            <label for="data">出生日期：</label>
            <input type="text" name="birthday1"  placeholder="${birthday}"/>
            <span >*</span>
        </div>
        <div>
            <label for="userphone">用户电话：</label>
            <input type="text" name="phone1" placeholder="phone"/>
            <span >*</span>
        </div>
        <div>
            <label for="userAddress">用户地址：</label>
            <input type="text" name="address1" placeholder="${address}"/>
        </div>
        <div>
            <label >用户类别：</label>
            <input type="radio" name="userType1" value="1"/>管理员
            <input type="radio" name="userType1" value="2" checked/>经理
            <input type="radio" name="userType1" value="3" />普通用户

        </div>
        <div class="providerAddBtn">
            <!--<a href="#">保存</a>-->
            <!--<a href="userList.html">返回</a>   onclick="upde()"-->
            <input type="submit" value="保存"/>
            <input type="button" value="返回" onclick="update2()"/>
        </div>
    </form>
</div>


</div>














<div class="tianzhaozhezhao">
<div  id="addUser" style="width:700px;padding:30px 60px;font-size: 17px;">
    <form id="form2" method="post" action="<%=path%>/second">
        <div>
            <label for="userId">用户编码：</label>
            <input type="text"  name="userCode" id="userId"/>
            <span id="userIdMsg"></span>
        </div>
        <div>
            <label for="userName">用户名称：</label>
            <input type="text" class="easyui-textbox" name="userName" id="userName"/>
            <span >*请输入用户名称</span>
        </div>
        <div>
            <label for="userpassword">用户密码：</label>
            <input type="text" class="easyui-textbox" name="userPassword" id="userpassword"/>
            <span>*密码长度必须大于6位小于20位</span>

        </div>
        <div>
            <label for="userRemi">确认密码：</label>
            <input type="text" class="easyui-textbox"  id="userRemi"/>
            <span>*请输入确认密码</span>
        </div>
        <div>
            <label >用户性别：</label>
            <select name="gender">
                <option value="1">男</option>
                <option value="0">女</option>
            </select>
            <span></span>
        </div>
        <div>
            <label for="data">出生日期：</label>
            <input type="text" name="birthday" id="data"/>
            <span >*</span>
        </div>
        <div>
            <label for="userphone">用户电话：</label>
            <input type="text" class="easyui-textbox" name="phone" id="userphone"/>
            <span >*</span>
        </div>
        <div>
            <label for="userAddress">用户地址：</label>
            <input type="text" class="easyui-textbox" name="address" id="userAddress"/>
        </div>
        <div>
            <label >用户类别：</label>
            <input type="radio" name="userRole" value="0"/>管理员
            <input type="radio" name="userRole" value="1"/>经理
            <input type="radio" name="userRole" value="2"/>普通用户
        </div>
        <input type="submit" value="保存" />
        <input type="button" value="返回" onclick="closeqq()" />
    </form>
</div>
</div>
<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

    <footer class="footer">
        版权归北大青鸟
    </footer>



</body>
</html>