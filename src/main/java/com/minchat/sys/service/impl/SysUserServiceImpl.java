package com.minchat.sys.service.impl;

import com.minchat.sys.dao.SysUserDao;
import com.minchat.sys.model.SysUser;
import com.minchat.sys.service.SysUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SysUserServiceImpl implements SysUserService {
    @Resource
    private SysUserDao userDao;

    public SysUser getUserById(Long userid) {
        // TODO Auto-generated method stub
        return this.userDao.selectByPrimaryKey(userid);
    }

    public SysUser getByUserAccount(String account) {
        // TODO Auto-generated method stub
        return this.userDao.selectBySysUserAccount(account);
    }
}