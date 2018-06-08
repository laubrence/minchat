package com.minchat.sys.service;

import com.minchat.sys.model.SysUser;

public interface SysUserService {
    public SysUser getUserById(Long userid);

    public SysUser getByUserAccount(String account);

}