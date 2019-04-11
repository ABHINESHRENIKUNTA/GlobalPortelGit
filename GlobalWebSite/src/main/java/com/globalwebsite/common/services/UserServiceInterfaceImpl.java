package com.globalwebsite.common.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalwebsite.common.dao.UserDaoInterfaceImpl;

@Service("userServices")
public class UserServiceInterfaceImpl {
	
	@Autowired
	private UserDaoInterfaceImpl userdaoimpl;

}
