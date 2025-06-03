package com.demo.main.controller;

import com.demo.main.service.AdminService;
import com.demo.main.service.UserService;
import com.demo.main.utils.CommonUtil;
import com.demo.main.utils.Identity;
import com.demo.main.utils.Result;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    // 重定向
    // response.sendRedirect(request.getContextPath() + "/");

    AdminService adminService = new AdminService();
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        switch (method) {
            // 登录页面
            case "login-page":
                request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
                break;
            case "register-page":
                request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
                break;
            case "register":
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String phone = request.getParameter("phone");

                request.setAttribute("data", userService.register(username, password, phone));

                request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
                break;
            case "logout":
                CommonUtil.setIdentity(null);
                request.getSession().setAttribute("username", null);
                request.getSession().setAttribute("user_id", null);
                request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
                break;
        }
    }

    /**
     * 登录
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String identity = request.getParameter("identity");

        if (identity.equals("admin")) {
            if (duplicated(request, response, adminService.verifyLogin(username, password))) {
                return;
            }
            CommonUtil.setIdentity(Identity.admin);
            request.getSession().setAttribute("username", username);
            CommonUtil.setUserId(adminService.selectByUsername(username).getId());
            request.getRequestDispatcher("/router?page=admin_user_management").forward(request, response);
            return;
        }
        if (duplicated(request, response, userService.verifyLogin(username, password))) {
            return;
        }
        CommonUtil.setIdentity(Identity.user);
        request.getSession().setAttribute("username", username);
        CommonUtil.setUserId(userService.selectByUsername(username).getId());
        request.getRequestDispatcher("/router?page=book").forward(request, response);
    }

    private boolean duplicated(HttpServletRequest request, HttpServletResponse response, Result<String> stringResult2) throws ServletException, IOException {
        request.setAttribute("data", stringResult2);
        if (stringResult2.getCode() != 200) {
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            return true;
        }
        CommonUtil.setIsLogin(true);
        return false;
    }
}
