package cn.happy.service;

import cn.happy.entity.UserInfo;
import cn.happy.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface UserInfoService {
    public UserInfo isLogin(UserInfo info);
    public int getTotalCount();
   /* public PageUtil<UserInfo> getOnePageData(int pageindex, int pagesize);*/
   public PageUtil<UserInfo> getOnePageData(int pageindex, int pagesize,UserInfo info);
    public int UserInfoAdd(UserInfo info);
    public int delUserInfo(int id);
    public int UpdateUserInfo(UserInfo info);
}