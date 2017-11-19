package cn.happy.service;

import cn.happy.dao.UserInfoDao;
import cn.happy.entity.UserInfo;
import cn.happy.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("userService")
public class UserInfoServiceImpl implements UserInfoService {
    @Resource(name = "userInfoDao")
    private UserInfoDao userInfoDao;

    public UserInfo isLogin(UserInfo info) {
        return userInfoDao.isLogin(info);
    }

    public int getTotalCount() {
        return userInfoDao.getTotalCount();
    }

    public PageUtil<UserInfo> getOnePageData(int pageindex, int pagesize, UserInfo info) {
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("pageindex",(pageindex-1)*pagesize);
        map.put("pagesize",pagesize);

        if(info!=null&&!info.getUserName().equals(null)){
            map.put("userName",info.getUserName());
        }

        PageUtil<UserInfo> page=new PageUtil<UserInfo>();
        page.setPageIndex(pageindex);
        page.setPageSize(pagesize);
        int totalRecords=0;
        if(info!=null&&!info.getUserName().equals(null)){
            totalRecords=userInfoDao.getTotalRecordsByCondition(info.getUserName());
        }else {
            totalRecords=userInfoDao.getTotalCount();
        }
        page.setTotalRecords(totalRecords);
        page.setTotalPages(page.getTotalRecords()%page.getPageSize()==0?page.getTotalRecords()/page.getPageSize():page.getTotalRecords()/page.getPageSize()+1);
        page.setList(userInfoDao.getOnePageData(map));
        return  page;
    }

    public int UserInfoAdd(UserInfo info) {
        return userInfoDao.UserInfoAdd(info);
    }

    public int delUserInfo(int id) {
        return userInfoDao.delUserInfo(id);
    }

    public int UpdateUserInfo(UserInfo info) {
        return userInfoDao.UpdateUserInfo(info);

    }


/*
    public  PageUtil<UserInfo>  getOnePageData(int pageindex, int pagesize) {
Map<String,Integer> map=new HashMap<String, Integer>();
map.put("pageindex",(pageindex)*pagesize);
map.put("pagesize",pagesize);
        PageUtil<UserInfo> page=new PageUtil<UserInfo>();
        page.setPageIndex(pageindex);
        page.setPageSize(pagesize);
        int totalRecords=userInfoDao.getTotalCount();
        page.setTotalRecords(totalRecords);
        //总页数=totalRecords/pageSize

        page.setTotalPages(page.getTotalRecords()%page.getPageSize()==0?page.getTotalRecords()/page.getPageSize():page.getTotalRecords()/page.getPageSize()+1);

        page.setList(userInfoDao.getOnePageData(map));

        return page;
        *//*return userInfoDao.getOnePageData(map);*//*
}*/
}