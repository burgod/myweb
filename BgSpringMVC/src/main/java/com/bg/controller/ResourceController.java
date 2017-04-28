package com.bg.controller;

import com.bg.common.ComboBox;
import com.bg.common.Page;
import com.bg.dao.ResourceDao;
import com.bg.model.Resource;
import com.bg.model.ResourceTable;
import com.bg.service.IResourceService;
import com.bg.utils.GsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yitop on 2017/4/26.
 */
@Controller
@RequestMapping(value="resource")
public class ResourceController {

    @Autowired
    private IResourceService iResourceService;

    @RequestMapping(value="toView")
    public String toView(){
        return "/resource/resource";
    }

    @RequestMapping(value="findList")
    @ResponseBody
    public String findList(@RequestParam(value="page", required=false) String page, @RequestParam(value="rows", required=false) String rows){
        Page pageBean = new Page(Integer.parseInt(page), Integer.parseInt(rows));
        Map reMap = new HashMap();
        Map paraMap = new HashMap();

        //paraMap.put("title", title);
        paraMap.put("firstPage", pageBean.getFirstPage());
        paraMap.put("rows", pageBean.getRows());

        List<ResourceTable> results = iResourceService.findList(paraMap);
        long total = iResourceService.findtotal(paraMap);
        reMap.put("rows",results);
        reMap.put("total",total);
        return GsonUtils.bean2json(reMap);
    }

    @RequestMapping(value="toAdd")
    public String toAdd(){
        return "/resource/addOrEdit";
    }

    @RequestMapping(value="getAllResource")
    @ResponseBody
    public String getAllResource(@RequestParam(value="resourceId")String id){
        List<Resource> allResource = iResourceService.getAllResource();
        Resource choose = null;
        if(!"".equals(id)&&id!=null){
            choose = iResourceService.findPreById(id);
        }
        List<ComboBox> ur = new ArrayList<ComboBox>();
        for(Resource c:allResource){
            ComboBox cb = new ComboBox();
            cb.setId(c.getResourceid());
            cb.setText(c.getResourcename());
            if(choose.getResourceid().equals(c.getResourceid())){
                cb.setSelected(true);
            }
            ur.add(cb);
        }
        return GsonUtils.bean2json(ur);
    }

    @RequestMapping(value="addResource")
    @ResponseBody
    public String addResource(Resource resource){
        iResourceService.addResource(resource);
        return "success";
    }
}
