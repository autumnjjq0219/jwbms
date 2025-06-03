<%@ page import="com.demo.main.utils.Result" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <title>Register Page</title>
    <style>
        .login-container {
            height: 100%;
            background-size: auto 100% !important;
            background: #dbfff0 ;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .bg-image {
            margin-right: 530px;
            width: 70%;  /* 您想要的宽度 */
            height: 100%; /* 您想要的高度 */
        }

        .login-box {
            margin-top: -50px;
            margin-left: -500px;
            background-color: rgba(255, 255, 255, 0.58);
            width: 400px;
            height: 450px;
            box-sizing: border-box;
            padding: 30px;
            position: relative;
            border: 5px solid #00320d;
        }

        .login-box-identity{
            display: flex;
            padding: 0;
            margin-top: 40px;
            height: 30px;
        }

        .login-box-identity li {
            cursor: pointer;
            display: flex;
            align-items: center;
        }

        .login-box-identity li > * {
            height: 100%;
        }

        .login-box-identity li p {
            margin-left: 4px;
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
            bottom: 30px;
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
<%--<%--%>
<%--    Result<String> result = (Result) request.getAttribute("data");--%>
<%--    System.out.println(result);--%>
<%--%>--%>
<%--<script lang="javascript">--%>
<%--    const e = <%=result == null ? false : result.getCode()%>--%>
<%--    if (e !== false && e !== 200) {--%>
<%--        alert("登录失败")--%>
<%--    }--%>
<%--</script>--%>
<div class="container-fluid login-container">
    <img src="/resources/img/bg.jpg" class="bg-image" alt="background">
    <div class="login-box">
        <h1 class="login-box-title">图书管理系统</h1>
        <form action="/login" method="get" class="clearfix overflow-hidden">
            <input type="hidden" name="method" value="register">
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
                <div class="form-group row">
                    <label class="col-3">手机号</label>
                    <input type="text" class="form-control col-8" name="phone">
                </div>
                <br>
                <button type="submit" class="btn btn-primary" style="margin-top: 20px">注册</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
