<%@ page import="com.demo.main.utils.Result" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <title>Login Page</title>
    <style>
        .login-container {
            height: 100%;

            background-size: auto 100% !important;
            background: #dbfff0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .bg-image {
            margin-right: 400px;
            width: 100%;  /* 您想要的宽度 */
            height: 100%; /* 您想要的高度 */
        }
        .login-box {
            margin-top: -50px;
            margin-left: -380px;
            background-color: rgba(255, 255, 255, 0.58);
            width: 400px;
            height: 450px;
            box-sizing: border-box;
            padding: 30px;
            position: relative;
            border: 5px solid #00320d;
        }

        .login-box-identity {
            display: flex;
            padding: 0;
            margin-top: 40px;
            height: 30px;
        }

        .login-box-identity li {
            height: 28px;
            display: flex;
            align-items: center;
            line-height: 26px;
        }

        .login-box-identity li > * {
            display: block;
            height: 100%;
            align-items: center;
            margin: 0;
        }

        .login-box-identity li > label {
            margin-left: 8px;
        }

        .login-box-identity li:hover {
            color: var(#173a17);
        }

        .login-box-title {
            text-align: center;
        }

        .login-box-form {
            margin-top: 40px;
        }

        .login-box-register {
            position: absolute;
            bottom: 40px;
        }

        .login-box-register a {
            color: var(#00320d);
        }
        button{
            color: #fff;
            font-size: 25px;
            background-color: #28a745;
            height: 40px;
            width: 80px;
        }
    </style>
</head>
<body>
<%
    Result<String> result = (Result) request.getAttribute("data");
%>
<script lang="javascript">
    const e =
    <%=result == null ? false : result.getCode()%>
    if (e) {
        alert("<%=(result == null) ? "" : result.getData()%>")
    }
</script>
<div class="container-fluid login-container">
    <!-- 在JSP文件中 -->
    <div class="login-container">
        <img src="/resources/img/bg.jpg" class="bg-image" alt="background">
        <!-- 其他登录内容 -->
    </div>
    <div class="login-box">
        <h1 class="login-box-title">图书管理系统</h1>
        <form action="/login" method="post" class="clearfix">
            <ul class="login-box-identity">
                <li style="margin-right: 18px">
                    <input type="radio" name="identity" checked value="user"
                           id="identity-user">
                    <label for="identity-user">学生</label>
                </li>
                <li>
                    <input type="radio" name="identity" value="admin"
                           id="identity-admin">
                    <label for="identity-admin">管理员</label>
                </li>
            </ul>
            <div class="login-box-form">
                <div class="form-group row">
                    <label class="col-3">用户名</label>
                    <input type="text" class="form-control col-8" name="username">
                </div>
                <br>
                <div class="form-group row">
                    <label class="col-3">密码</label>
                    <input type="password" class="form-control col-8" name="password">
                </div>
                <br>
                <button type="submit" class="btn btn-primary" style="margin-top: 20px">登录</button>
            </div>
        </form>
        <div class="login-box-register">
            <a href="/login?method=register-page" ><font color="#306c00">用户注册</font></a>
        </div>
    </div>
</div>
</body>
</html>
