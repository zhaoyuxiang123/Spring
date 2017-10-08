package cn.happy.service;

import cn.happy.day02.printer.Print;
import cn.happy.day03.service.ISomeService;
import cn.happy.jihe.Mycollection;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test20171007 {

    @Test
    public void test01(){
    ApplicationContext context=new ClassPathXmlApplicationContext("applicationContextday03.xml");
    /*HappyServices service=(HappyServices)context.getBean("service");
service.work();
        System.out.println(service);*/
        ISomeService service=(ISomeService)context.getBean("someService");
      service.doSome();
}


    @Test
    public void test02(){
        ApplicationContext context=new ClassPathXmlApplicationContext("applicationContextjihe.xml");
    /*HappyServices service=(HappyServices)context.getBean("service");
service.work();
        System.out.println(service);*/
        Mycollection collection=(Mycollection)context.getBean("collection");
        System.out.println(collection);
    }
}