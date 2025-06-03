package com.demo.main.utils;

import java.security.Timestamp;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CommonUtil {
    private static boolean isLogin = false;
    private static String identity = null;
    private static int userId;

    public static boolean getIsLogin() {
        return isLogin;
    }

    public static void setIsLogin(boolean isLogin) {
        CommonUtil.isLogin = isLogin;
    }

    public static String getIdentity() {
        return identity;
    }

    public static void setIdentity(String identity) {
        CommonUtil.identity = identity;
    }

    public static int getUserId() {
        return userId;
    }

    public static void setUserId(int userId) {
        CommonUtil.userId = userId;
    }

    // 权限
    public static final Map<String, List<String[]>> permissions = new HashMap<>();

    static {
        // 用户
        List<String[]> userPermissions = new ArrayList<>();
        userPermissions.add(new String[]{"图书借阅", "/router?page=book"});
        userPermissions.add(new String[]{"借阅记录", "/router?page=borrowing"});
        userPermissions.add(new String[]{"个人信息", "/router?page=user_profile"});

        // 管理员
        List<String[]> adminPermissions = new ArrayList<>();
        adminPermissions.add(new String[]{"用户管理", "/router?page=admin_user_management"});
        adminPermissions.add(new String[]{"添加用户", "/router?page=admin_add_user"});
        adminPermissions.add(new String[]{"图书管理", "/router?page=admin_book_management"});
        adminPermissions.add(new String[]{"添加图书", "/router?page=admin_add_book"});
        adminPermissions.add(new String[]{"借阅记录", "/router?page=borrowing"});
        adminPermissions.add(new String[]{"个人信息", "/router?page=user_profile"});

        permissions.put(Identity.user, userPermissions);
        permissions.put(Identity.admin, adminPermissions);
    }

    public String getTime(Timestamp time) {
        return DateFormat.getDateTimeInstance().format(time);
    }
}
