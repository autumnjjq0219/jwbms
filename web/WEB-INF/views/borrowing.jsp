<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.demo.main.utils.CommonUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.demo.main.entity.Book" %>
<%@ page import="com.demo.main.vo.BorrowingVo" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <title>Borrowings Page</title>
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

        .borrowings-page {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 25px;
        }

        /* 表格样式 */
        .books-table {
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

        /* 状态标签样式 */
        .status-tag {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-borrow {
            background-color: #e8f5e9;
            color: #28a745;
        }

        .status-return {
            background-color: #fff3e0;
            color: #f57c00;
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
            
            .books-table {
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
    List<BorrowingVo> borrowings = (List<BorrowingVo>) request.getAttribute("borrowings");
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
                    <button class="btn-sm btn-primary">退出登录</button>
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
            <div class="borrowings-page">
                <div class="books-table">
                    <table class="table table-striped table-bordered table-hover" style="margin: 0 auto">
                        <thead>
                        <tr>
                            
                            <td>用户名</td>
                            <td>图书名称</td>
                            <td>类别</td>
                            <td>时间</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="borrowing" items="<%=borrowings%>">
                            <tr>
                                
                                <td>${borrowing.username}</td>
                                <td>${borrowing.bookName}</td>
                                <td>${borrowing.typeCn}</td>
                                <td>${borrowing.datetime}</td>
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
