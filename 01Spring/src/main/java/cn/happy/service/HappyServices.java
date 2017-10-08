package cn.happy.service;

public class HappyServices {
    public String getInfo() {
        return info;
    }



    private int age;

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public HappyServices() {
    }

    @Override
    public String toString() {
        return "HappyServices{" +
                "age=" + age +
                ", info='" + info + '\'' +
                '}';
    }

    public HappyServices(int age, String info) {
        this.age = age;
        this.info = info;
    }

    public void setInfo(String info) {

        System.out.println("66666");
        this.info = info;
    }

    private String info;
    public void work(){
        System.out.println("work"+info);
        System.out.println("1111111111111"+age);

    }

}