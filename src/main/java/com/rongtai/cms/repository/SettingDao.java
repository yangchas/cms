/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.rongtai.cms.repository;

import com.rongtai.cms.entity.Setting;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface SettingDao extends PagingAndSortingRepository<Setting, Long>, JpaSpecificationExecutor<Setting> {
}
