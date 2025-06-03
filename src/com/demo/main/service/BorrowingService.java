package com.demo.main.service;

import com.demo.main.dao.BorrowingDao;
import com.demo.main.entity.Borrowing;
import com.demo.main.utils.CommonUtil;
import com.demo.main.vo.BorrowingVo;

import java.util.List;

public class BorrowingService {
    BorrowingDao borrowingDao = new BorrowingDao();

    public void insertOne(Borrowing borrowing) {
        borrowingDao.insertOne(borrowing);
    }

    public List<BorrowingVo> selectVoAll() {
        return borrowingDao.selectVoAll();
    }

    public List<BorrowingVo> selectVoByUserId(int id) {
        return borrowingDao.selectVoByUserId(id);
    }

    public List<BorrowingVo> selectVoByCurrentUser() {
        return borrowingDao.selectVoByUserId(CommonUtil.getUserId());
    }
}
