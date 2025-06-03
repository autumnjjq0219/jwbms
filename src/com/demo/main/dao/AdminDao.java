package com.demo.main.dao;

import com.demo.main.entity.Admin;
import com.demo.main.utils.JdbcUtil;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao {
    public Admin selectByUsername(String username) {
        String sql = "select * from `admin` where username = ?";

        ResultSet resultSet = JdbcUtil.query(sql, username);

        try {
            if (!resultSet.next()) {
                return null;
            }
            Admin admin = new Admin();
            admin.setId(resultSet.getInt(1));
            admin.setUsername(resultSet.getString(2));
            admin.setPassword(resultSet.getString(3));
            admin.setPhone(resultSet.getString(4));
            admin.setAddress(resultSet.getString(5));
            return admin;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
