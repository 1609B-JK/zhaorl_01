package com.jk.dao.book;

import com.jk.pojo.book.Book;

import java.util.List;

/**
 * Created by Administrator on 2017/5/16.
 */
public interface BookDao {

    List<Book> queryBookList(Book book);

    int selectCount(Book book);

    void insertBook(Book book);

    void deleteBookByID(Book book);

    Book updatePage(Book book);

    void updateBook(Book book);
}
