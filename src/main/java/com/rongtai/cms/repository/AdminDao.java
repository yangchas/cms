/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.rongtai.cms.repository;

import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.Admin;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface AdminDao extends PagingAndSortingRepository<Admin, Long>, JpaSpecificationExecutor<Admin> {

    Admin findByUsernameAndDeleteFlag(String username, TOFEnum deleteFlag);

}
