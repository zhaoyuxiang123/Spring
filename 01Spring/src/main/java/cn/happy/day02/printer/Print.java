package cn.happy.day02.printer;

import cn.happy.day02.ink.Ink;
import cn.happy.day02.paper.Pape;

public class Print {
    public Ink getInk() {
        return ink;
    }

    public void setInk(Ink ink) {
        this.ink = ink;
    }

    public Pape getPape() {
        return pape;
    }

    public void setPape(Pape pape) {
        this.pape = pape;
    }

    private Ink ink;
    private Pape pape;
    public void printSomething(){
        System.out.println("你正在使用"+ink.GetInk()+"打印我爱你在"+pape.GetPage()+"上");

    }
}