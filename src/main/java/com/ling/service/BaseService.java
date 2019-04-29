package com.ling.service;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ling.exception.MyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by LING on 2019/3/2.
 */
public abstract class BaseService<T> {

    @Autowired
    private Mapper<T> mapper;

    //根据id查询实体
    public T queryById(Long id){
        return this.mapper.selectByPrimaryKey(id);
    }

    //查询所有
    public List<T> queryAll(){
        return this.mapper.select(null);
    }

    //条件查询
    public List<T> queryListByWhere(T param){
        return this.mapper.select(param);
    }

    //查询记录数
    public Integer queryCount(T param){
        return this.mapper.selectCount(param);
    }

    //分页
    public PageInfo<T> queryPageListByWhere(T param, Integer page, Integer rows){
        PageHelper.startPage(page, rows);
        List<T> list = this.mapper.select(param);
        return new PageInfo<T>(list);
    }

    //查询一条记录
    public T queryOne(T param){
        return this.mapper.selectOne(param);
    }

    //插入
    @Transactional
    public Integer save(T param){
        return this.mapper.insert(param);
    }

    //新增非空字段
    @Transactional
    public Integer saveSelect(T param){
        return this.mapper.insertSelective(param);
    }

    //根据主键更新
    @Transactional
    public Integer update(T param){
        return this.mapper.updateByPrimaryKey(param);
    }

    //根据主键更新非空字段
    @Transactional
    public Integer updateSelective(T param){
        return this.mapper.updateByPrimaryKeySelective(param);
    }
    @Transactional
    public Integer updateByExampleSelective(T param,Object o,String col) {
        Example example = new Example(param.getClass());
        example.createCriteria().andEqualTo(col,o);
        return this.mapper.updateByExampleSelective(param,example);
    }
    @Transactional
    public Integer updateBy2ExampleSelective(T param,Object o,String col,Object o1,String col1) {
        Example example = new Example(param.getClass());
        example.createCriteria().andEqualTo(col,o).andEqualTo(col1,o1);
        return this.mapper.updateByExampleSelective(param,example);
    }

    @Transactional
    //根据主键删除
    public Integer deleteById(Long id){
        return this.mapper.deleteByPrimaryKey(id);
    }

    //批量删除
    @Transactional
    public Integer deleteByIds(Class<T> clazz,List<Object> values){
        Example example = new Example(clazz);
        example.createCriteria().andIn("id", values);
        return this.mapper.deleteByExample(example);
    }

}
