package cn.happy.service;

import cn.happy.day02.printer.Print;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class Test20170928 {

    @Test
    public void test01(){
    ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
    HappyServices service=(HappyServices)context.getBean("service");
service.work();
        System.out.println(service);
       /* Print print=(Print)context.getBean("printer");
        print.printSomething();*/
}
    @Test
    public void test02(){
     /*   ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
        HappyServices service=(HappyServices)context.getBean("service");
        service.work();*/
        BeanFactory factory = new ClassPathXmlApplicationContext("applicationContext.xml");
        HappyServices service=(HappyServices)factory.getBean("service");
        service.work();
        System.out.println(service);
       /* Print print=(Print)context.getBean("printer");
        print.printSomething();*/
    }
    @Test
    public void test03(){
        Resource resource=new ClassPathResource("applicationContext.xml");
        BeanFactory context=new XmlBeanFactory(resource);
        context.getBean("service");
        System.out.println(context.getBean("service"));
    }
}