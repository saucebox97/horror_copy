package com.project.horror.calendar.service;

import com.project.horror.calendar.domain.Calendar;
import com.project.horror.calendar.repository.CalendarMapper;
import com.project.horror.common.search.Search;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.SimpleFormatter;

@Service
@Log4j2
@RequiredArgsConstructor
public class CalendarService {

    private final CalendarMapper repository;

    public boolean saveService(Calendar calendar) {
        log.info("save service start - {}", calendar);
        return repository.save(calendar);
    }

    public Map<String, Object> findAllService(Search search) {

        log.info("findAll service start");

        Map<String, Object> findDataMap = new HashMap<>();

        List<Calendar> boardList = repository.findAll(search);
        // 현재시간 // 우리가보는 평소에 보는 시간을출력할려면 SimpleDateFormat써야함
        Date today = new Date();
        System.out.println(today);
        SimpleDateFormat date = new SimpleDateFormat("yyyy년/MM월/dd일");
        SimpleDateFormat time = new SimpleDateFormat("a hh:mm:ss");
        SimpleDateFormat targetMonth = new SimpleDateFormat("MM월");
        SimpleDateFormat targetDay = new SimpleDateFormat("dd일");
        // 대문자 HH 하면 오전 오후없어지고 오후돼면 +12됌
        SimpleDateFormat targetTime = new SimpleDateFormat("HH:mm");
        // SimpleDateFormat 썻으니 format넣어서 출력
        System.out.println("time = " + time.format(today));
        System.out.println("date = " + date.format(today));
        System.out.println("targetTime = " + targetTime.format(today));
        // 월 일중 10미만은 0을 붙인다
        for (Calendar c : boardList) {
        // 월에 10미만은 0을붙인다
            String m = c.getMonth().substring(0, c.getMonth().length()-1);
            int month = Integer.parseInt(m);
            String newMonth = month < 10 ? "0" + c.getMonth() : c.getMonth();
            c.setMonth(newMonth);
        // 일에 10미만은 0을붙인다
            String d = c.getDay().substring(0, c.getDay().length()-1);
            int day = Integer.parseInt(d);
            String newDay = day < 10 ? "0" + c.getDay() : c.getDay();
            c.setDay(newDay);
        }

        findDataMap.put("cList", boardList);
//        년 월 일
        findDataMap.put("date", date.format(today));
//        오전/오후 시간
        findDataMap.put("time", time.format(today));
//        날 시간 영상시간뺴기
        findDataMap.put("targetDay", targetDay.format(today));
        findDataMap.put("targetMonth", targetMonth.format(today));
        findDataMap.put("targetTime", targetTime.format(today));

        return findDataMap;
    }

    public Calendar findOneService(Long calendarNo) {
        log.info("findOne service start - {}", calendarNo);
        Calendar calendar = repository.findOne(calendarNo);

        return calendar;
    }

    public boolean removeService(Long boardNo) {
        log.info("remove service start - {}", boardNo);
        return repository.remove(boardNo);
    }

    // 게시물 수정 요청 중간 처리
    public boolean modifyService(Calendar calendar) {
        log.info("modify service start - {}", calendar);
        return repository.modify(calendar);
    }

}
