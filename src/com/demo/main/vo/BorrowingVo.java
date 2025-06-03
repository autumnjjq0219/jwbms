package com.demo.main.vo;

import com.demo.main.entity.Borrowing;

public class BorrowingVo extends Borrowing {
    public String username, bookName, typeCn;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getTypeCn() {
        return typeCn;
    }

    public void setTypeCn(String typeCn) {
        this.typeCn = typeCn;
    }

    @Override
    public String toString() {
        return "BorrowingVo{" +
                "username='" + username + '\'' +
                ", bookName='" + bookName + '\'' +
                ", typeCn='" + typeCn + '\'' +
                '}';
    }
}
