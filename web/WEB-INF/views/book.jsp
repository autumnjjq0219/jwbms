<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.demo.main.utils.CommonUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.demo.main.entity.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <title>Books Page</title>
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

        .book-page {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 25px;
        }

        /* 查询表单样式 */
        .query-form {
            margin-bottom: 30px;
        }

        .query-form input[type="text"] {
            height: 38px;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 0 15px;
        }

        .query-form input[type="submit"] {
            background-color: #28a745;
            border: none;
            color: white;
            height: 38px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .query-form input[type="submit"]:hover {
            background-color: #00320d;
        }

        /* 表格样式 */
        .books-table {
            overflow-x: auto;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .table th, .table td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .table thead tr {
            background-color: #f8f9fa;
            color: #333;
        }

        .table tbody tr:hover {
            background-color: #f5f5f5;
        }

        /* 按钮样式 */
        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        /* 借阅状态样式 */
        .status-tag {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-borrowed {
            background-color: #ffebee;
            color: #dc3545;
        }

        .status-available {
            background-color: #e8f5e9;
            color: #28a745;
        }

        .btn-primary {
            background-color: #28a745;
            color: white;
        }

        .btn-success {
            background-color: #ffaf24;
            color: white;
        }

        .btn-primary:hover {
            background-color: #00320d;
        }

        .btn-success:hover {
            background-color: #ed7b1d;
        }

        .btn-sm {
            padding: 4px 8px;
            margin-left:10px;
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
    List<Book> books = (List<Book>) request.getAttribute("books");
%>
<div class="container-fluid">
    <div class="top-nav">
        <div class="top-nav-container">
            <div class="left-box">
                <p>图书管理系统</p>
            </div>
            <div class="right-box">
                <p class="top-nav-username" style="margin-right: 10px">用户：<%=username%></p>
                <a href="/login?method=logout">
                    <button class="bn-ms bn-pri">退出登录</button>
                </a>
            </div>
        </div>
    </div>
    <div class="non-top-nav">
        <div class="sidebar">
            <ul class="sidebar-ul">
<%--                <li><a href="/login?method=login-page">图书搜索</a></li>--%>
<%--                <li><a href="#">图书搜索</a></li>--%>
<%--                <li><a href="#">图书搜索</a></li>--%>
                <c:forEach var="item" items="<%=permissions%>">
                    <li><a href="${item[1]}">${item[0]}</a></li>
                </c:forEach>
            </ul>
        </div>
        <div class="main">
            <div class="book-page">
                <div class="query-form">
                    <form action="/book" method="post" class="clearfix"
                          style="width: 90%; margin: 0 auto 30px; /*position: fixed*/">
                        <div class="form-group row" style="margin: 0">
                            <input type="hidden" name="method" value="condition">
                            <input type="text" name="name" class="form-control col-3 offset-1" placeholder="书名"/>
                            <input type="text" name="author" class="form-control col-3" placeholder="作者"/>
                            
                            <input type="submit" value="搜索" class="btn btn-primary col-1 offset-4">
                        </div>
                    </form>
                </div>
                <div class="books-table">
                    <table class="table table-striped table-bordered table-hover" style="margin: 0 auto">
                        <thead>
                            <tr>
                                <td>图书ID</td>
                                <td>图书名称</td>
                                <td>图书作者</td>
                                <td>出版社</td>
                                <td>ISBN</td>
                                <td>图书描述</td>
                                <td>定价</td>
                                <td>借阅状态</td>
                                <td>操作</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="book" items="<%=books%>">
                                <tr>
                                    <td>${book.id}</td>
                                    <td>${book.name}</td>
                                    <td>${book.author}</td>
                                    <td>${book.publisher}</td>
                                    <td>${book.isbn}</td>
                                    <td>${book.info}</td>
                                    <td>${book.pricing}</td>
                                    <td>
                                        <span class="status-tag ${book.isBorrowed ? 'status-borrowed' : 'status-available'}">
                                            ${book.isBorrowed ? '已借阅' : '未借阅'}
                                        </span>
                                    </td>
                                    <td style="width: 149px">
                                        <a href="/book?method=borrow&id=${book.id}">
                                            <button class="btn btn-primary btn-sm">借阅</button>
                                        </a>
                                        <a href="/book?method=return&id=${book.id}">
                                            <button class="btn btn-success btn-sm">归还</button>
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
