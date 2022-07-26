package com.project.horror.calendar.repository;

import com.project.horror.calendar.domain.Calendar;
import com.project.horror.common.search.Search;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CalendarMapper {

    // 입력
    boolean save(Calendar calendar);

    // 게시글 search 조회
    List<Calendar> findAll(Search search);
    // 게시글 전체 조회
    List<Calendar> findAll();

    Calendar findOne(Long calendarNo);

    // 삭제
    boolean remove(Long calendarNo);

    // 수정
    boolean modify(Calendar calendar);

    // 전체 게시물수 조회
//    int getTotalCount(Search search);

}
