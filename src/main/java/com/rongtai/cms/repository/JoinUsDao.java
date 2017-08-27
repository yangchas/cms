/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.rongtai.cms.repository;

import com.rongtai.cms.common.enumeration.TOFEnum;
import com.rongtai.cms.entity.JoinUs;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface JoinUsDao extends PagingAndSortingRepository<JoinUs, Long>, JpaSpecificationExecutor<JoinUs> {
    List<JoinUs> findByDeleteFlag(TOFEnum deleteFlag);
}
