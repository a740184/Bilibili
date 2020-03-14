package com.gph.service.Impl;

import com.gph.dao.DyCommentMapper;
import com.gph.model.DyComment;
import com.gph.service.DyCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DyCommentServiceImpl implements DyCommentService {


    @Autowired
    private DyCommentMapper dyCommentMapper;

    @Override
    public List<DyComment> selectDyCommentS() {
        List<DyComment> dyComments = dyCommentMapper.selectDyCommentS();
        return dyComments;
    }

    @Override
    public List<DyComment> selectCommentByDyId(Integer dy_id) {
        List<DyComment> dyComments = dyCommentMapper.selectCommentByDyId(dy_id);
        return dyComments;
    }

    @Override
    public int Insert(DyComment dyComment) {
        int i=dyCommentMapper.insertSelective(dyComment);
        return i;
    }

    @Override
    public DyComment selectCommentByCid(Integer cid) {
        DyComment dyComment=dyCommentMapper.selectCommentByCid(cid);
        return dyComment;
    }
}
