package cn.happy.day03.service;

import cn.happy.day03.dao.ISomeDAO;

public class SomeServiceImpl implements  ISomeService {
    private ISomeDAO dao;

    public ISomeDAO getDao() {
        return dao;
    }

    public void setDao(ISomeDAO dao) {
        this.dao = dao;
    }

    public void doSome() {

        dao.doSome();
    }
}