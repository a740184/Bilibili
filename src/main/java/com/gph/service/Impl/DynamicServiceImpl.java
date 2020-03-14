package com.gph.service.Impl;

import com.gph.dao.DynamicMapper;
import com.gph.model.Dynamic;
import com.gph.service.DynamicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DynamicServiceImpl implements DynamicService {

    @Autowired
    private DynamicMapper dynamicMapper;
    @Override
    public int insertDynamic(Dynamic dynamic) {
        int i=dynamicMapper.insertSelective(dynamic);
        return i;
    }

    @Override
    public List<Dynamic> SelectAll() {
        List<Dynamic> dynamics=dynamicMapper.SelectAll();
        return dynamics;
    }

    @Override
    public List<Dynamic> SelectDynamicById(Integer userid) {
        List<Dynamic> dynamics=dynamicMapper.SelectDynamicById(userid);
        return dynamics;
    }
}
