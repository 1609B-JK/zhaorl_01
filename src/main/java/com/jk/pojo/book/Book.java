package com.jk.pojo.book;

import common.util.Page;

/**
 * Created by Administrator on 2017/5/16.
 */
public class Book extends Page{

    private int bookID;

    private String bookName;

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }


}
