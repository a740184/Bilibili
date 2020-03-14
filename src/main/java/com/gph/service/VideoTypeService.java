package com.gph.service;

import com.gph.model.VideoType;

import java.util.List;

public interface VideoTypeService {
    VideoType selectByPrimaryKey(Integer typeId);
    List<VideoType> selectAll();
}
