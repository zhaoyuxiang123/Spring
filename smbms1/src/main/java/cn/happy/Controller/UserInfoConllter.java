package cn.happy.Controller;

import cn.happy.entity.UserInfo;
import cn.happy.service.UserInfoService;
import cn.happy.util.PageUtil;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserInfoConllter {

    @InitBinder
    public void initBind(WebDataBinder binder){
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class,new CustomDateEditor(dateFormat,false));
    }




    @Resource(name="userService")
        UserInfoService userService;
        @RequestMapping("/first")
        public String doFirst(UserInfo info,HttpSession session){

           UserInfo user=userService.isLogin(info);
           if(user!=null){
               session.setAttribute("userinfo",user);
               return "/jsp/welcome.jsp";
           }else {
               return "/jsp/login.jsp";
           }

        }
        @RequestMapping("/userList")
        @ResponseBody
public Object userList(@RequestParam(defaultValue = "0",required = false,value = "page") int pageindex, @RequestParam(defaultValue = "2",required = false,value = "rows")
                       int pagesize,UserInfo info){
            Map<String,Object> map=new HashMap<String,Object>();

            PageUtil<UserInfo> page =  userService.getOnePageData(pageindex, pagesize,info);
            map.put("total",page.getTotalRecords());
            map.put("rows",page.getList());
            return map;

}





    @RequestMapping("/second")
    public String doSecondAdd(UserInfo userInfo){

        System.out.println(userInfo.getUserCode());
        System.out.println(userInfo.getUserName());
        int count=userService.UserInfoAdd(userInfo);
            return "/jsp/userList.jsp";
    }

    @RequestMapping("/delUser")
    public String doThree(UserInfo userInfo){
        System.out.println("1");
        int count=userService.delUserInfo(userInfo.getId());
        System.out.println("2");
        return "/jsp/userList.jsp";
    }

    @RequestMapping("/updateUser")
    @ResponseBody
    public String doFour(UserInfo userInfo){
        System.out.println("11");
        System.out.println(userInfo.getId());
        System.out.println(userInfo.getUserName());
        System.out.println(userInfo.getGender());
        System.out.println(userInfo.getBirthday());
        System.out.println(userInfo.getPhone());
        System.out.println(userInfo.getAddress());
        System.out.println(userInfo.getUserRole());
        System.out.println("===========");
        int count=userService.UpdateUserInfo(userInfo);
        System.out.println(count+"===========");
        return "/jsp/userList.jsp";
    }



}