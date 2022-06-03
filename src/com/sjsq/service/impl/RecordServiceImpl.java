package com.sjsq.service.impl;

import com.sjsq.Dao.RecordDao;
import com.sjsq.Dao.impl.RecordDaoImpl;
import com.sjsq.po.Record;
import com.sjsq.service.RecordService;

import java.util.List;

public class RecordServiceImpl implements RecordService {

    private RecordDao recordDao = new RecordDaoImpl();
    @Override
    public List<Record> selectRecords() {
        return recordDao.selectRecords();
    }

    @Override
    public List<Record> selectRecord(Integer userid) {
        return recordDao.selectRecord(userid);
    }

    @Override
    public boolean addRecord(Record record) {
        return recordDao.addRecord(record);
    }

    @Override
    public boolean deleteRecord(Integer borrowid) {
        return recordDao.deleteRecord(borrowid);
    }
}
