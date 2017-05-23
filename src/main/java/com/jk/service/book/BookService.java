package com.jk.service.book;

import com.jk.pojo.book.Book;

import java.util.List;

/**
 * Created by Administrator on 2017/5/16.
 */
public interface BookService {


    List<Book> queryBookList(Book book);

    void insertBook(Book book);

    int selectCount(Book book);

    void deleteBookByID(Book book);

    Book updatePage(Book book);

    void updateBook(Book book);
}
