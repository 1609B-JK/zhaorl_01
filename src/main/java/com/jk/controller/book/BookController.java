package com.jk.controller.book;

import com.google.gson.Gson;
import com.jk.pojo.book.Book;
import com.jk.service.book.BookService;
import common.util.JsonOutUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/16.
 */
@Controller
public class BookController {

    @Autowired
    private BookService bookService;

    //跳转到查询页面
    @RequestMapping("queryPage")
    public  String queryPage(){
        return "book/bookList";
    }
    //查询
    @RequestMapping("queryBookList")
    public void queryBookList(Book book,HttpServletResponse response,int page,int rows){
        int totalCount = bookService.selectCount(book);
        book.setTotalCount(totalCount);
        if(page ==0){
            page =1;
        }
        if(rows ==0){
            rows=3;
        }
        book.setPageIndex(page);
        book.setPageSize(rows);
        book.countInfo();
        List<Book> listBook = bookService.queryBookList(book);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("total", totalCount);
        map.put("rows", listBook);
        String json  = new Gson().toJson(map);
        JsonOutUtil.jsonOut(json, response);
    }

    @RequestMapping("toAddBookPage")
    public String toAddBookPage() {
        return "book/bookAddPage";
    }
    //新增
    @RequestMapping("insertBook")
    public void insertBook(Book book,HttpServletResponse response){
        bookService.insertBook(book);
        JsonOutUtil.jsonOut("{}",response);
    }
   //删除
    @RequestMapping("deleteBookByID")
    public void deleteBookByID(Book book,HttpServletResponse response){
        bookService.deleteBookByID(book);
        JsonOutUtil.jsonOut("{}",response);
    }
   //回显
    @RequestMapping("updatePage")
    public  String updatePage(Book book,Model model){
        Book bo = bookService.updatePage(book);
        model.addAttribute("book", bo);
        return "book/bookUpdatePage";
    }
   //修改
    @RequestMapping("updateBook")
    public void updateBook(Book book,HttpServletResponse response){
        bookService.updateBook(book);
        JsonOutUtil.jsonOut("{}",response);
    }
}
