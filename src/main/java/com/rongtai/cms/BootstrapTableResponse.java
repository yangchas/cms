package com.rongtai.cms;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by tan on 2017/5/15.
 */
public class BootstrapTableResponse<T> {

    /** 总记录数 */
    private long total;

    /** 内容 */
    private List<T> rows = new ArrayList<T>();

    public BootstrapTableResponse() {
        total = 0L;
    }

    public BootstrapTableResponse(long total, List<T> rows) {
        this.total = total;
        this.rows.addAll(rows);
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }
}
