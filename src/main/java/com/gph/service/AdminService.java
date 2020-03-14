package com.gph.service;

import com.gph.model.Admin;

public interface AdminService {
    Admin login(String username , String password);
    int deleteByPrimaryKey(Integer id);
    Admin selectInfoByAdminName(String adminName);
    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);
    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);


}
