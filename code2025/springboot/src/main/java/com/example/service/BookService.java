package com.example.service;

import com.example.entity.Account;
import com.example.entity.Product;
import com.example.mapper.BookMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {

    @Resource
    BookMapper bookMapper;

    public void add(Product product) {
        bookMapper.insert(product);
    }

    public void update(Product product) {
        Account currentUser = TokenUtils.getCurrentUser();
        bookMapper.updateById(product);
    }

    public void deleteById(Integer id) {
        bookMapper.deleteById(id);
    }

    public List<Product> selectAll(Product product) {
        return bookMapper.selectAll(product);
    }

    public PageInfo<Product> selectPage(Integer pageNum, Integer pageSize, Product product) {
        // 开启分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<Product> list = bookMapper.selectAll(product);
        return PageInfo.of(list);
    }
}
