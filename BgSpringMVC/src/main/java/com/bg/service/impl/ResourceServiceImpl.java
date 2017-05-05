package com.bg.service.impl;

import com.bg.common.Ztree;
import com.bg.dao.ResourceDao;
import com.bg.model.Resource;
import com.bg.model.ResourceTable;
import com.bg.service.IResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/4/26.
 */
@Service
public class ResourceServiceImpl implements IResourceService{

    @Autowired
    private ResourceDao resourceDao;

    public List<ResourceTable> findList(Map<String, String> map) {
        return resourceDao.findList(map);
    }

    public Long findtotal(Map<String, String> map) {
        return resourceDao.findtotal(map);
    }

    public List<Resource> getAllResource() {
        return resourceDao.getAllResource();
    }

    public Resource findPreById(String id) {
        return resourceDao.findPreById(id);
    }

    public void addResource(Resource resource) {
        resourceDao.addResource(resource);
    }

    public void deleteResource(String id) {
        resourceDao.deleteResource(id);
    }

    public Resource findById(String id) {
        return resourceDao.findById(id);
    }

    public void updateResource(Resource resource) {
        resourceDao.updateResource(resource);
    }

    public List<Ztree> getAllResources(String roleid) {
        List<Ztree> ztrees = new ArrayList<Ztree>();
       List<Resource> resources = resourceDao.getAllResources(roleid);
        for(Resource c :resources){
            Ztree z = new Ztree();
            z.setId(c.getResourceid()+"");
            z.setpId(c.getPresourceid()+"");
            z.setName(c.getResourcename());
            z.setOpen(true);
            ztrees.add(z);
        }
        return ztrees;
    }
}
