package com.gph.dao;

import com.gph.model.Dynamic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DynamicMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dynamic
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dynamic
     *
     * @mbggenerated
     */
    int insert(Dynamic record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dynamic
     *
     * @mbggenerated
     */
    int insertSelective(Dynamic record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dynamic
     *
     * @mbggenerated
     */
    Dynamic selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dynamic
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Dynamic record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dynamic
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Dynamic record);

    List<Dynamic> SelectAll();

    List<Dynamic> SelectDynamicById(@Param("userid") Integer userid);
}