package com.tenco.team_two_flight_ticket._core.vo;

import lombok.Data;

@Data
public class PageVO {
    private int pageNumber;
    private int currentPage;
    private int countPerPage;
    private int pageSize;
    private int countSize;
    private int lastPage;
    private int firstPage;
}
