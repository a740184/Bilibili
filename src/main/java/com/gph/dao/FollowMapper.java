package com.gph.dao;

import com.gph.model.Follow;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FollowMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table follow
     *
     * @mbggenerated
     */
    int insert(Follow record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table follow
     *
     * @mbggenerated
     */
    int insertSelective(Follow record);

    Integer fan_count(Integer follow_id);

    Integer follow_count(Integer userid);

    int follow_user(@Param("userid") Integer userid,@Param("followId") Integer followId);

    Integer select_if_follow(@Param("userid") Integer userid,@Param("followId") Integer followId);

    int cancel_follow(@Param("userid") Integer userid,@Param("followId") Integer followId);

    List<Follow> select_follow_id(@Param("userid")Integer userid);
}