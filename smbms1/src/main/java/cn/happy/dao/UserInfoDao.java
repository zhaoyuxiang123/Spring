package cn.happy.dao;

import cn.happy.entity.UserInfo;

import java.util.List;
import java.util.Map;

public interface UserInfoDao {
    //1.登陆
    public UserInfo isLogin(UserInfo info);
    //2.获取总记录数
    public int getTotalCount();
    //3.获取单页数据的方法
    public List<UserInfo> getOnePageData(Map map);
//模糊查询
    public int getTotalRecordsByCondition(String userName);

    public int UserInfoAdd(UserInfo info);
    public int delUserInfo(int id);

    public int UpdateUserInfo(UserInfo info);
}