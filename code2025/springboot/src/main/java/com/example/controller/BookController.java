package com.example.controller;

import com.example.common.Result;
import com.example.entity.Product;
import com.example.service.BookService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/product")
public class BookController {

    @Resource
    BookService productService;

    @PostMapping("/add")
    public Result add(@RequestBody Product product) {  // @RequestBody 接收前端传来的 json参数
        productService.add(product);
        return Result.success();
    }

    @PutMapping("/update")
    public Result update(@RequestBody Product product) {  // @RequestBody 接收前端传来的 json参数
        productService.update(product);
        return Result.success();
    }

    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {  // @PathVariable 接收前端传来的路径参数
        productService.deleteById(id);
        return Result.success();
    }

    @GetMapping("/selectAll")  //   完整的请求路径：http://ip:port/book/selectAll
    public Result selectAll(Product product) {
        List<Product> productList = productService.selectAll(product);
        return Result.success(productList);
    }

    /**
     * 分页查询
     * pageNum: 当前的页码
     * pageSize：每页的个数
     */
    @GetMapping("/selectPage")
    public Result selectPage(@RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize,
                             Product product) {
        PageInfo<Product> pageInfo = productService.selectPage(pageNum, pageSize, product);
        return Result.success(pageInfo);  // 返回的是分页的对象
    }

}
