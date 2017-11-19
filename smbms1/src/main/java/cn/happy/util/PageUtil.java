package cn.happy.util;

import cn.happy.entity.UserInfo;

import java.util.List;

/**
 * Created by Happy on 2017-11-11.
 * 分页工具类
 */
public class PageUtil<T> {
     private Integer pageIndex;
     private Integer pageSize;
     private Integer totalRecords;
     private Integer totalPages;
     private List<T>  list;

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(Integer totalRecords) {
        this.totalRecords = totalRecords;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
