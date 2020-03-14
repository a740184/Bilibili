package com.gph.service;

import com.gph.model.Follow;

import java.util.List;

public interface FollowService {
    Integer fan_count(Integer follow_id);
    Integer follow_count(Integer userid);
    int follow_user(Integer userid,Integer followId);
    Integer select_if_follow(Integer userid,Integer followId);
    int cancel_follow(Integer userid,Integer followId);
    List<Follow> select_follow_id(Integer userid);
}
