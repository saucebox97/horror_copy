package com.project.horror.calendar.domain;

import lombok.*;

import java.util.Date;

@Setter @Getter @ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
public class Calendar {

    // 테이블 컬럼 필드

    private Long calendarNo;
    private String month;
    private String day;
    private String time;
    private String channel;
    private String genre;
    private String limit;
    private String title;
    private String movieTime;
    private String id;

    private String director;
    private String content;
}
