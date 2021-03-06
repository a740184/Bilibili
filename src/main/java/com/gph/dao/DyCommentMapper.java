package com.gph.dao;

import com.gph.model.DyComment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DyCommentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dy_comment
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer cid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dy_comment
     *
     * @mbggenerated
     */
    int insert(DyComment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dy_comment
     *
     * @mbggenerated
     */
    int insertSelective(DyComment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dy_comment
     *
     * @mbggenerated
     */
    DyComment selectByPrimaryKey(Integer cid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dy_comment
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(DyComment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dy_comment
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(DyComment record);

    List<DyComment> selectDyCommentS();

    List<DyComment> selectCommentByDyId(@Param("dy_id") Integer dy_id);

    DyComment selectCommentByCid(@Param("cid") Integer cid);
}