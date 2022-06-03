package com.sjsq.service;

import com.sjsq.po.Record;

import java.util.List;


public interface RecordService {


    //查询所有借阅信息

    public List<Record> selectRecords();


    //查询借阅信息

    public List<Record> selectRecord(Integer userid);


    //新增借阅记录

    public boolean addRecord(Record record);


    //删除借阅记录

    public boolean deleteRecord(Integer borrowid);
}

