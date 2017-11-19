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
    <link rel="stylesheet" href="<%=path%>/jsp/js/bootstrap/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/jQuery1.11.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/js/jquery.pagination.js"></script>
    <script type="text/javascript">
        function jsGetAge(strBirthday)
        {
            var returnAge;
            var strBirthdayArr=strBirthday.split("-");
            var birthYear = strBirthdayArr[0];

            var birthMonth = strBirthdayArr[1];
            var birthDay = strBirthdayArr[2];

            var d = new Date();
            var nowYear = d.getFullYear();
            var nowMonth = d.getMonth() + 1;
            var nowDay = d.getDate();

            if(nowYear == birthYear)
            {

                returnAge = 0;//同年 则为0岁
            }
            else
            {

                var ageDiff = nowYear - birthYear ; //年之差
                if(ageDiff > 0)
                {
                    if(nowMonth == birthMonth)
                    {

                        var dayDiff = nowDay - birthDay;//日之差
                        if(dayDiff < 0)
                        {
                            returnAge = ageDiff - 1;
                        }
                        else
                        {
                            returnAge = ageDiff ;
                        }
                    }
                    else
                    {
                        var monthDiff = nowMonth - birthMonth;//月之差
                        if(monthDiff < 0)
                        {
                            returnAge = ageDiff - 1;
                        }
                        else
                        {
                            returnAge = ageDiff ;
                        }
                    }
                }
                else
                {
                    returnAge = -1;//返回-1 表示出生日期输入错误 晚于今天
                }
            }
            return returnAge;//返回周岁年龄
        }
        //jquery让渡 $
        jQuery.noConflict();
          var btnSelect;
        jQuery(function ($) {
            load(0);
      function load(pageIndex) {

    $.ajax({
        url:"${pageContext.request.contextPath}/userList",
        type:"post",
        data:{"pageindex":pageIndex,"pagesize":2,"userName":$("[name=uname]").val()},
        success:function (data) {
            //清空数据
            $("#list-content").html('');
            //追加数据
            $.each(data.list,function (i,dom) {
                //一个dom就是一个用户对象
                $("#list-content").append("<tr><td>"+dom.userCode+"</td><td>"+dom.userName+"</td><td>"+(dom.gender==1?"男":"女")+"</td><td>"+jsGetAge(dom.birthday)+"</td><td>"+dom.phone+"</td><td>"+dom.userRole+"</td><td><a href='userView.html'><img src='img/read.png' alt='查看' title='查看'/></a><a href='userUpdate.html'><img src='img/xiugai.png' alt='修改' title='修改'/></a><a href='#' class='removeUser'><img src='img/schu.png' alt='删除' title='删除'/></a></td></tr>")
            })
            //渲染分页  总记录数  当前页码  每页数据量
            $('#pagination').pagination(data.totalRecords,{
                current_page:data.pageIndex,
                items_per_page:data.pageSize,
                num_display_entries:3,
                load_first_page:true,
                prev_text:'上一页',
                next_text:'下一页',
                callback:load
            });
        }
    });
    btnSelect=function () {
        load(0);
    }
}

        });



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
    <section class="publicTime">
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
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%">用户编码</th>
                    <th width="20%">用户名称</th>
                    <th width="10%">性别</th>
                    <th width="10%">年龄</th>
                    <th width="10%">电话</th>
                    <th width="10%">用户类型</th>
                    <th width="30%">操作</th>
                </tr>
         <%--       <c:forEach items="${userList}" var="item">
                    <tr>
                        <td>${item.userCode}</td>
                        <td>${item.userName}</td>
                        <td>女</td>
                        <td>20</td>
                        <td>15918230478</td>
                        <td>经理</td>
                        <td>
                          &lt;%&ndash;  <a href="userView.html"><img src="img/read.png" alt="查看" title="查看"/></a>
                            <a href="userUpdate.html"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
                            <a href="#" class="removeUser"><img src="img/schu.png" alt="删除" title="删除"/></a>&ndash;%&gt;
                        </td>
                    </tr>
                </c:forEach>--%>

       <tbody id="list-content"></tbody>

            </table>
            <div  class="pagination" id="pagination" ></div>
        </div>
    </section>

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

<script src="<%=path%>/jsp/js/jquery.js"></script>
<script src="<%=path%>/jsp/js/js.js"></script>
<script src="<%=path%>/jsp/js/time.js"></script>

</body>
</html>