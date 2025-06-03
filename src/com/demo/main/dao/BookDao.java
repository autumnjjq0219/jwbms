package com.demo.main.dao;

import com.demo.main.entity.Book;
import com.demo.main.utils.JdbcUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDao {
    public List<Book> selectAll() {
        String sql = "select * from book";
        return resultSetToBookList(JdbcUtil.query(sql));
    }

    public List<Book> selectCondition(Book book) {
        String sql;
        ResultSet resultSet;

        if (book.getAuthor() != null && book.getName() != null) {
            sql = "select * from book where `author` like '%" + book.getAuthor() + "%' and `name` like '%" + book.getName() + "%'";
        }
        else if (book.getAuthor() != null) {
            sql = "select * from book where `author` like '%" + book.getAuthor() + "%'";
        }
        else if (book.getName() != null) {
            sql = "select * from book where `name` like '%" + book.getName() + "%'";
        }
        else {
            return selectAll();
        }
        resultSet = JdbcUtil.query(sql);
        return resultSetToBookList(resultSet);
    }

    private List<Book> resultSetToBookList(ResultSet resultSet) {
        try {
            List<Book> books = new ArrayList<>();

            while (resultSet.next()) {
                Book book = new Book();
                book.setId(resultSet.getInt(1));
                book.setName(resultSet.getString(2));
                book.setAuthor(resultSet.getString(3));
                book.setPublisher(resultSet.getString(4));
                book.setIsbn(resultSet.getString(5));
                book.setInfo(resultSet.getString(6));
                book.setPricing(resultSet.getDouble(7));
                book.setIsBorrowed(resultSet.getBoolean(8));
                books.add(book);
            }
            return books;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void update(Book book) {
        String sql = "update `book` set `name`= ?, author = ?, publisher = ?, isbn = ?, info = ?, pricing = ?, is_borrowed = ? where id = ?";
        System.out.println(book.getIsBorrowed());
        System.out.println(book.getId());
        JdbcUtil.execute(sql, book.getName(), book.getAuthor(), book.getPublisher(), book.getIsbn(), book.getInfo(), book.getPricing(), book.getIsBorrowed(), book.getId());
    }

    public void updateBorrow(int id, boolean isBorrowed) {
        String sql = "update `book` set is_borrowed=? WHERE id=?";
        JdbcUtil.execute(sql, isBorrowed, id);
    }

    public Book selectById(int id) {
        String sql = "select * from book where id = ?";
        ResultSet resultSet = JdbcUtil.query(sql, id);
        return resultSetToBookList(resultSet).get(0);
    }

    public void insertOne(Book book) {
        String sql = "INSERT INTO `book` (`name`, `author`, `publisher`, `isbn`, `info`, `pricing`, `is_borrowed`) VALUES (?, ?, ?, ?, ?, ?, ?)";
        JdbcUtil.insert(sql, true, book.getName(), book.getAuthor(), book.getPublisher(), book.getIsbn(), book.getInfo(), book.getPricing(), book.getIsBorrowed());
    }

    public void deleteOne(int id) {
        String sql = "delete from `book` where id = ?";
        JdbcUtil.execute(sql, id);
    }
}
