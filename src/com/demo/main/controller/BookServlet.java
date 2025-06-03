package com.demo.main.controller;

import com.demo.main.entity.Book;
import com.demo.main.entity.Borrowing;
import com.demo.main.service.BookService;
import com.demo.main.service.BorrowingService;
import com.demo.main.utils.CommonUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet("/book")
public class BookServlet extends HttpServlet {

    BookService bookService = new BookService();
    BorrowingService borrowingService = new BorrowingService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String method = request.getParameter("method");

        switch (method) {
            case "condition":
                String author = request.getParameter("author");
                String name = request.getParameter("name");

                Book book = new Book();
                book.setAuthor(author);
                book.setName(name);

                request.setAttribute("books", bookService.selectCondition(book));
                request.getRequestDispatcher("/router?page=book").forward(request, response);
                break;

            case "borrow":
                int id = Integer.parseInt(request.getParameter("id"));
                // 借阅
                if (bookService.selectOne(id).getIsBorrowed()) {
                    throw new RuntimeException("借阅失败");
                }
                bookService.bookBorrow(id, true);
                // 插入借阅记录
                Borrowing borrowing = new Borrowing();
                borrowing.setUserId(CommonUtil.getUserId());
                borrowing.setBookId(id);
                borrowing.setType("borrowing");
                borrowing.setDatetime(new Timestamp(new Date().getTime()));
                borrowingService.insertOne(borrowing);
                // 跳转
                request.getRequestDispatcher("/router?page=book").forward(request, response);
                break;
            case "return":
                int returnId = Integer.parseInt(request.getParameter("id"));
                // 借阅
                if (!bookService.selectOne(returnId).getIsBorrowed()) {
                    throw new RuntimeException("归还失败");
                }
                bookService.bookBorrow(returnId, false);
                // 插入借阅记录
                borrowing = new Borrowing();
                borrowing.setUserId(CommonUtil.getUserId());
                borrowing.setBookId(returnId);
                borrowing.setType("returning");
                borrowing.setDatetime(new Timestamp(new Date().getTime()));
                borrowingService.insertOne(borrowing);
                // 跳转
                request.getRequestDispatcher("/router?page=book").forward(request, response);
                break;
            case "add":
                book = new Book();
                book.setName(request.getParameter("name"));
                book.setAuthor(request.getParameter("author"));
                book.setPublisher(request.getParameter("publisher"));
                book.setIsbn(request.getParameter("isbn"));
                book.setInfo(request.getParameter("info"));
                book.setPricing(Double.parseDouble(request.getParameter("pricing")));
                book.setIsBorrowed(request.getParameter("is_borrowed").equals("是"));

                bookService.insertOne(book);

                request.getRequestDispatcher("/router?page=admin_book_management").forward(request, response);
                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                bookService.deleteOne(id);
                request.getRequestDispatcher("/router?page=admin_book_management").forward(request, response);
                break;
            case "update":
                book = new Book();
                book.setId(Integer.parseInt(request.getParameter("id")));
                book.setName(request.getParameter("name"));
                book.setAuthor(request.getParameter("author"));
                book.setPublisher(request.getParameter("publisher"));
                book.setIsbn(request.getParameter("isbn"));
                book.setInfo(request.getParameter("info"));
                book.setPricing(Double.parseDouble(request.getParameter("pricing")));
                book.setIsBorrowed(request.getParameter("is_borrowed").equals("是"));

                bookService.update(book);

                request.getRequestDispatcher("/router?page=admin_book_management").forward(request, response);
                break;
        }
    }
}
