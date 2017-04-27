package com.bg.service;

import com.bg.model.Resource;

import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/4/26.
 */
public interface IResourceService {
    List<Resource> findList(Map<String,String> map);
    Long findtotal(Map<String,String> map);
    List<Resource> getAllResource();
    Resource findPreById(String id);
}
