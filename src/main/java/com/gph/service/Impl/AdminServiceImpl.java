package com.gph.service.Impl;

import com.gph.dao.AdminMapper;
import com.gph.model.Admin;
import com.gph.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public Admin login(String username, String password) {
        Admin admin=adminMapper.login(username,password);
        return admin;
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int i=adminMapper.deleteByPrimaryKey(id);
        return i;
    }

    @Override
    public Admin selectInfoByAdminName(String adminName) {
        Admin admin=adminMapper.selectInfoByAdminName(adminName);
        return admin;
    }

    @Override
    public int insert(Admin record) {
        int i=adminMapper.insert(record);
        return i;
    }

    @Override
    public int insertSelective(Admin record) {
        int i=adminMapper.insertSelective(record);
        return i;
    }

    @Override
    public Admin selectByPrimaryKey(Integer id) {
        Admin admin=adminMapper.selectByPrimaryKey(id);
        return admin;
    }

    @Override
    public int updateByPrimaryKeySelective(Admin record) {
        int i=adminMapper.updateByPrimaryKeySelective(record);
        return i;
    }

    @Override
    public int updateByPrimaryKey(Admin record) {
        int i=adminMapper.updateByPrimaryKey(record);
        return i;
    }
}
