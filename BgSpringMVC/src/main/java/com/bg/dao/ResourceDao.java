package com.bg.dao;

import com.bg.model.Resource;
import com.bg.model.ResourceTable;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/4/26.
 */
@Repository
public interface ResourceDao {
    List<ResourceTable> findList(Map<String,String> map);
    Long findtotal(Map<String,String> map);
    List<Resource> getAllResource();
    Resource findPreById(String id);
    void addResource(Resource resource);
    void deleteResource(String id);
    Resource findById(String id);
    void updateResource(Resource resource);
}
