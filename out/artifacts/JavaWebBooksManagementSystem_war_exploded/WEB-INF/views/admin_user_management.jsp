<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.demo.main.utils.CommonUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.demo.main.vo.BorrowingVo" %>
<%@ page import="com.demo.main.entity.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <title>Users Management Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Microsoft YaHei', sans-serif;
            background-color: #f5f5f5;
            color: #333;
        }

        .container-fluid {
            width: 100%;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            padding-top: 60px;
        }

        /* 顶部导航栏样式 */
        .top-nav {
            background-color: #28a745;
            color: white;
            padding: 0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 101;
            height: 60px;
        }

        .top-nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            max-width: 1400px;
            margin: 0 auto;
        }

        .left-box p {
            font-size: 20px;
            font-weight: bold;
            margin: 0;
        }

        .right-box {
            display: flex;
            align-items: center;
        }

        .right-box p {
            margin: 0;
            font-size: 14px;
        }

        /* 侧边栏和主内容区布局 */
        .non-top-nav {
            display: flex;
            flex: 1;
            position: relative;
        }

        /* 侧边栏样式 */
        .sidebar {
            position: fixed;
            top: 60px;
            left: 0;
            bottom: 0;
            width: 200px;
            background-color: rgba(153, 255, 150, 0.498);
            box-shadow: 2px 0 4px rgba(0,0,0,0.1);
            padding: 20px 0;
            overflow-y: auto;
            z-index: 100;
        }

        .sidebar-ul {
            list-style: none;
        }

        .sidebar-ul li {
            padding: 0;
        }

        .sidebar-ul li a {
            display: block;
            padding: 12px 25px;
            color: #333;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .sidebar-ul li a:hover {
            background-color: #e8f0fe;
            color: #28a745;
        }

        /* 主内容区样式 */
        .main {
            flex: 1;
            padding: 20px;
            margin-left: 200px;
        }

        .main-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 25px;
        }

        /* 查询框样式 */
        .query-box {
            margin-bottom: 30px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 6px;
        }

        .query-form input[type="text"] {
            height: 38px;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 0 15px;
            font-size: 14px;
        }

        .query-form input[type="submit"] {
            background-color: #28a745;
            border: none;
            color: white;
            height: 38px;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .query-form input[type="submit"]:hover {
            background-color: #00320d;
        }

        /* 表格样式 */
        .table-box {
            overflow-x: auto;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            background-color: white;
        }

        .table th, .table td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
            font-size: 14px;
        }

        .table thead tr {
            background-color: #f8f9fa;
            color: #333;
            font-weight: bold;
        }

        .table tbody tr:hover {
            background-color: #f5f5f5;
        }

        .table tbody td {
            vertical-align: middle;
        }

        /* 按钮样式 */
        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
            margin-right: 12px;
        }

        .btn-primary {
            background-color: #28a745;
            color: white;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .btn-primary:hover {
            background-color: #00320d;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .btn-sm {
            padding: 4px 8px;
            font-size: 12px;
        }

        /* logout按钮样式 */
        .bn-pri {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .bn-pri:hover {
            background-color: #00320d;
        }

        .bn-ms {
            padding: 6px 15px;
            font-size: 14px;
        }
        /* 响应式设计 */
        @media (max-width: 768px) {
            .non-top-nav {
                flex-direction: column;
            }
            
            .sidebar {
                position: relative;
                top: 0;
                width: 100%;
                margin-bottom: 20px;
            }
            
            .main {
                margin-left: 0;
            }
            
            .container-fluid {
                padding-top: 0;
            }

            .top-nav {
                position: relative;
            }
            
            .query-form .form-group {
                flex-direction: column;
            }
            
            .query-form input[type="text"],
            .query-form input[type="submit"] {
                width: 100%;
                margin: 5px 0;
            }
            
            .table-box {
                overflow-x: auto;
            }
            
            .table {
                min-width: 600px;
            }
        }
    </style>
</head>
<body>
<%
    // public
    String username = (String) request.getSession().getAttribute("username");
    String identity = CommonUtil.getIdentity();
    List<String[]> permissions = (List<String[]>) request.getAttribute("permissions");
    // private
    List<User> users = (List<User>) request.getAttribute("users");
%>
<div class="container-fluid">
    <div class="top-nav">
        <div class="top-nav-container">
            <div class="left-box">
                <p>图书管理系统</p>
            </div>
            <div class="right-box">
                <p class="top-nav-username" style="margin-right: 10px">用户：<%=username%>
                </p>
                <a href="/login?method=logout">
                    <button class="bn-ms bn-pri">退出登录</button>
                </a>
            </div>
        </div>
    </div>
    <div class="non-top-nav">
        <div class="sidebar">
            <ul class="sidebar-ul">
                <c:forEach var="item" items="<%=permissions%>">
                    <li><a href="${item[1]}">${item[0]}</a></li>
                </c:forEach>
            </ul>
        </div>
        <div class="main">
            <div class="main-container">
                <div class="query-box">
                    <form action="/user" class="query-form clearfix">
                        <div class="form-group row" style="margin: 0">
                            <input type="hidden" name="method" value="condition">
                            <input type="text" name="username" class="form-control col-3" placeholder="用户名"/>
                            <input type="submit" value="查询" class="btn btn-primary col-1 offset-1">
                        </div>
                    </form>
                </div>
                <div class="table-box">
                    <table class="table table-striped table-bordered table-hover" style="margin: 0 auto">
                        <thead>
                        <tr>
                            
                            <td>用户名</td>
                            <td>密码</td>
                            <td>手机号</td>
                            <td>操作</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="user" items="<%=users%>">
                            <tr>
                                
                                <td>${user.username}</td>
                                <td>${user.password}</td>
                                <td>${user.phone}</td>
                                <td style="width: 149px">
                                    <a href="/user?method=delete&id=${user.id}">
                                        <button class="btn btn-danger btn-sm">删除</button>
                                    </a>
                                    <a href="/router?page=admin_user_update&id=${user.id}">
                                        <button class="btn btn-primary btn-sm">修改</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
