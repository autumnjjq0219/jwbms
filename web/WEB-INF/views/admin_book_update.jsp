<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.demo.main.utils.CommonUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.demo.main.vo.BorrowingVo" %>
<%@ page import="com.demo.main.entity.User" %>
<%@ page import="com.demo.main.entity.Book" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <title>Update Book Page</title>
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

        /* 表单样式 */
        .form-box {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            height: 38px;
            padding: 8px 12px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #28a745;
            box-shadow: 0 0 0 3px rgba(40, 167, 69, 0.2);
            outline: none;
        }

        textarea.form-control {
            height: auto;
            min-height: 100px;
            resize: vertical;
            padding: 12px;
        }

        /* 单选框组样式 */
        .radio-group {
            display: flex;
            gap: 30px;
            margin-top: 10px;
        }

        .radio-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .radio-item input[type="radio"] {
            width: 18px;
            height: 18px;
            margin: 0;
            cursor: pointer;
        }

        .radio-item p {
            margin: 0;
            font-size: 14px;
            color: #555;
        }

        /* 按钮样式 */
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: #28a745;
            color: white;
            width: 100%;
            margin-top: 10px;
        }

        .btn-primary:hover {
            background-color: #00320d;
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
            
            .form-box {
                padding: 15px;
            }
            
            .form-control {
                width: 100%;
            }
            
            .radio-group {
                flex-direction: column;
                gap: 15px;
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
    Book book = (Book) request.getAttribute("book");
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
                <c:forEach var="item" items="<%=permissions%>">
                    <li><a href="${item[1]}">${item[0]}</a></li>
                </c:forEach>
            </ul>
        </div>
        <div class="main">
            <div class="main-container">
                <div class="form-box">
                    <h2 style="margin-bottom: 30px; color: #333; text-align: center;">修改图书信息</h2>
                    <form action="/book" class="clearfix" method="post">
                        <div class="form-group">
                            <input type="hidden" name="method" value="update">
                            <input type="hidden" name="id" value="<%=book.getId()%>">
                            <label for="input-username">图书名称</label>
                            <input type="text"
                                   name="name"
                                   class="form-control"
                                   placeholder="请输入图书名称"
                                   id="input-username"
                                   value="<%=book.getName()%>"/>
                        </div>
                        <div class="form-group">
                            <label for="input-password">作者</label>
                            <input type="text"
                                   name="author"
                                   class="form-control"
                                   placeholder="请输入作者姓名"
                                   id="input-password"
                                   value="<%=book.getAuthor()%>"/>
                        </div>
                        <div class="form-group">
                            <label for="input-phone">出版社</label>
                            <input type="text"
                                   name="publisher"
                                   class="form-control"
                                   placeholder="请输入出版社名称"
                                   id="input-phone"
                                   value="<%=book.getPublisher()%>"/>
                        </div>
                        <div class="form-group">
                            <label for="input-d1">ISBN</label>
                            <input type="text"
                                   name="isbn"
                                   class="form-control"
                                   placeholder="请输入ISBN编号"
                                   id="input-d1"
                                   value="<%=book.getIsbn()%>"/>
                        </div>
                        <div class="form-group">
                            <label for="input-d2">图书描述</label>
                            <textarea class="form-control" 
                                    id="input-d2" 
                                    rows="3" 
                                    placeholder="请输入图书描述" 
                                    name="info"><%=book.getInfo()%></textarea>
                        </div>
                        <div class="form-group">
                            <label for="input-d3">定价</label>
                            <input type="text"
                                   name="pricing"
                                   class="form-control"
                                   placeholder="请输入图书定价"
                                   id="input-d3"
                                   value="<%=book.getPricing()%>"/>
                        </div>
                        <div class="form-group">
                            <label>借阅状态</label>
                            <div class="radio-group">
                                <div class="radio-item">
                                    <input type="radio"
                                           name="is_borrowed"
                                           value="是"
                                           id="borrowed-yes"
                                           <%=book.getIsBorrowed() ? "checked" : ""%>/>
                                    <label for="borrowed-yes">已借出</label>
                                </div>
                                <div class="radio-item">
                                    <input type="radio"
                                           name="is_borrowed"
                                           value="否"
                                           id="borrowed-no"
                                           <%=!book.getIsBorrowed() ? "checked" : ""%>/>
                                    <label for="borrowed-no">可借阅</label>
                                </div>
                            </div>
                        </div>
                        <input type="submit" value="保存修改" class="btn btn-primary">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
