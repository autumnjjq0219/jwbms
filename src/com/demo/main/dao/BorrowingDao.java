package com.demo.main.dao;

import com.demo.main.entity.Borrowing;
import com.demo.main.utils.JdbcUtil;
import com.demo.main.vo.BorrowingVo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BorrowingDao {
    public void insertOne(Borrowing borrowing) {
        String sql = "INSERT INTO `borrowing` (user_id, book_id, type, datetime) VALUES (?, ?, ?, ?)";
        JdbcUtil.insert(sql, true, borrowing.getUserId(), borrowing.getBookId(), borrowing.getType(), borrowing.getDatetime());
    }

    public List<Borrowing> selectAll() {
        String sql = "select * from borrowing";
        ResultSet resultSet = JdbcUtil.query(sql);
        try {
            List<Borrowing> borrowings = new ArrayList<>();
            while (resultSet.next()) {
                Borrowing borrowing = new Borrowing();
                borrowing.setId(resultSet.getInt(1));
                borrowing.setUserId(resultSet.getInt(2));
                borrowing.setUserId(resultSet.getInt(3));
                borrowing.setType(resultSet.getString(4));
                borrowing.setDatetime(resultSet.getTimestamp(5));
                borrowings.add(borrowing);
            }
            return borrowings;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<BorrowingVo> selectVoAll() {
        String sql = "select borrowing.id, username, `name` book_name, type, `datetime` from borrowing, `user`, book where borrowing.book_id = book.id and borrowing.user_id = `user`.id;";
        ResultSet resultSet = JdbcUtil.query(sql);
        return getBorrowingVo(resultSet);
    }

    public List<BorrowingVo> selectVoByUserId(int id) {
        String sql = "select borrowing.id, username, `name` book_name, type, `datetime` from borrowing, `user`, book where borrowing.book_id = book.id and borrowing.user_id = `user`.id and user_id = ?";
        ResultSet resultSet = JdbcUtil.query(sql, id);
        return getBorrowingVo(resultSet);
    }

    private List<BorrowingVo> getBorrowingVo(ResultSet resultSet) {
        try {
            List<BorrowingVo> borrowings = new ArrayList<>();
            while (resultSet.next()) {
                BorrowingVo borrowing = new BorrowingVo();
                borrowing.setId(resultSet.getInt(1));
                borrowing.setUsername(resultSet.getString(2));
                borrowing.setBookName(resultSet.getString(3));
                borrowing.setTypeCn(resultSet.getString(4).equals("borrowing") ? "借" : "还");
                borrowing.setDatetime(resultSet.getTimestamp(5));
                borrowings.add(borrowing);
            }
            return borrowings;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
