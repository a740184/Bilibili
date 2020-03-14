package com.gph.service;

import com.gph.model.Dynamic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DynamicService  {
    int insertDynamic(Dynamic dynamic);

    List<Dynamic> SelectAll();

    List<Dynamic> SelectDynamicById( Integer userid);
}
