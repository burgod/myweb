package com.bg.dao;

import com.bg.model.Resource;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/4/26.
 */
@Repository
public interface ResourceDao {
    List<Resource> findList(Map<String,String> map);
    Long findtotal(Map<String,String> map);
    List<Resource> getAllResource();
    Resource findPreById(String id);
}
