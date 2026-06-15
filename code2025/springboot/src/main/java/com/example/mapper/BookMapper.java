package com.example.mapper;

import com.example.entity.Product;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BookMapper {

    List<Product> selectAll(Product product);

    void insert(Product product);

    void updateById(Product product);

    @Delete("delete from `product` where id = #{id}")
    void deleteById(Integer id);

    @Select("select * from `product` where id = #{id}")
    Product selectById(Integer id);

}
