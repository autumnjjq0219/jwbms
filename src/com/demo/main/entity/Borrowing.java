package com.demo.main.entity;

import java.sql.Timestamp;
import java.util.Date;

public class Borrowing {
    int id, userId, bookId;
    String type;
    Timestamp datetime;

    @Override
    public String toString() {
        return "Borrowing{" +
                "id=" + id +
                ", userId=" + userId +
                ", bookId=" + bookId +
                ", type='" + type + '\'' +
                ", datetime=" + datetime +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }
}
