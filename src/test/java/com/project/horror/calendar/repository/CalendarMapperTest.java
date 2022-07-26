package com.project.horror.calendar.repository;

import com.project.horror.calendar.domain.Calendar;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class CalendarMapperTest {

    @Autowired CalendarMapper mapper;

    @Test
    void saveTest() {
        Calendar calendar = new Calendar();
        calendar.setMonth("7월");
        calendar.setDay("22일");
        calendar.setTime("16:00");
        calendar.setChannel("ONC");
        calendar.setTitle("남산의 부장들");
        calendar.setGenre("드라마");
        calendar.setDirector("우민호");
        calendar.setContent("대통령암살");

        mapper.save(calendar);
    }

    @Test
    @DisplayName("전체확인")
    void findAll() {
        List<Calendar> calendarList = mapper.findAll();
        for (Calendar c : calendarList) {
            System.out.println(c);
        }
    }

    @Test
    @DisplayName("특정 게시물 조회 글제목이 일치")
    void findOneTest() {

        Calendar calendar = mapper.findOne(40001L);
        System.out.println("calendar = " + calendar);

        assertEquals("남산의 부장들", calendar.getTitle());

    }

    @Test
    @DisplayName("삭제한다")
    @Transactional
    void removeTest() {

        boolean flag = mapper.remove(40001L);

        assertTrue(flag);
    }

    @Test
    @DisplayName("수정한다")
    @Transactional
    void modifyTest() {

        Calendar cal = new Calendar();
        cal.setMonth("8월");
        cal.setDay("12일");
        cal.setTime("18:00");
        cal.setChannel("스크린");
        cal.setGenre("액션");
        cal.setTitle("람보 3");
        cal.setDirector("피터 맥도널드");
        cal.setContent("전쟁참여");
        cal.setCalendarNo(40001L);

        boolean flag = mapper.modify(cal);

        assertTrue(flag);
    }
}