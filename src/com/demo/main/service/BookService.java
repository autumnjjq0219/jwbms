package com.demo.main.service;

import com.demo.main.dao.BookDao;
import com.demo.main.entity.Book;
import com.demo.main.entity.Borrowing;

import java.util.List;

public class BookService {
    public BookDao bookDao = new BookDao();

    public List<Book> selectAll() {
        return bookDao.selectAll();
    }

    public List<Book> selectCondition(Book book) {
        return bookDao.selectCondition(book);
    }

    public void update(Book book) {
        bookDao.update(book);
    }

    public Book selectOne(int id) {
        return bookDao.selectById(id);
    }

    public void bookBorrow(int id, boolean isBorrowed) {
        bookDao.updateBorrow(id, isBorrowed);
    }

    public void insertOne(Book book) {
        bookDao.insertOne(book);
    }

    public void deleteOne(int id) {
        bookDao.deleteOne(id);
    }
}
