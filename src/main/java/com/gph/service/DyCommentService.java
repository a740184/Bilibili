package com.gph.service;

import com.gph.model.DyComment;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DyCommentService {
    List<DyComment> selectDyCommentS();

    List<DyComment> selectCommentByDyId( Integer dy_id);

    int Insert(DyComment dyComment);

    DyComment selectCommentByCid(Integer cid);
}
