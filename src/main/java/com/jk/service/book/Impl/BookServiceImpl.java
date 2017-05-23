package com.jk.service.book.Impl;

import com.jk.dao.book.BookDao;
import com.jk.pojo.book.Book;
import com.jk.service.book.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/5/16.
 */
@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;

    //查询总条数
    public int selectCount(Book book) {
        return bookDao.selectCount(book);
    }
    //删除
    public void deleteBookByID(Book book) {
        bookDao.deleteBookByID(book);
    }
    //回显
    public Book updatePage(Book book) {
        return bookDao.updatePage(book);
    }
    //修改
    public void updateBook(Book book) {
        bookDao.updateBook(book);
    }
    //查询
    public List<Book> queryBookList(Book book) {
        return bookDao.queryBookList(book);
    }
   //新增
    public void insertBook(Book book) {
        bookDao.insertBook(book);
    }
}
