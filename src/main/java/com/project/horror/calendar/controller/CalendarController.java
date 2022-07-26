package com.project.horror.calendar.controller;

import com.project.horror.calendar.domain.Calendar;
import com.project.horror.calendar.service.CalendarService;
import com.project.horror.common.search.Search;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller // Model에 뷰를 넘겨줌
@Log4j2
@RequiredArgsConstructor // 의존성주입
@RequestMapping("/horror")
public class CalendarController {

    private final CalendarService calendarService;

    // 게시물 목록 요청

    @GetMapping("/list") // "s" 타입으로 옵션태그를 보내준다
    public String list(@ModelAttribute("s") Search search, Model model) {

        log.info("controller request /board/list GET!");

        Map<String, Object> calendarMap = calendarService.findAllService(search);
        log.info("return data - {}", calendarMap);

        model.addAttribute("cList", calendarMap.get("cList"));
        model.addAttribute("time", calendarMap.get("time"));
        model.addAttribute("date", calendarMap.get("date"));
        model.addAttribute("targetDay", calendarMap.get("targetDay"));
        model.addAttribute("targetMonth", calendarMap.get("targetMonth"));
        model.addAttribute("targetTime", calendarMap.get("targetTime"));


        return "calendar/calendar-list";

    }
    // 게시물 상세 조회 요청
    @GetMapping("/content/{calendarNo}")
    public String content(@PathVariable Long calendarNo, Model model) {
        Calendar calendar = calendarService.findOneService(calendarNo);
        log.info("return data - {}", calendar);
        model.addAttribute("calendar", calendar);

        return "calendar/calendar-detail";
    }

    // 게시물 쓰기 화면 요청
    @GetMapping("/write")
    public String write() {
        log.info("controller request /calendar/write GET");
        return "calendar/calendar-write";
    }

    // 게시물 등록 요청
    @PostMapping("/write")
    public String write(Calendar calendar, RedirectAttributes ra) {
        log.info("controller request /calendar/write POST! - {}", calendar);
        boolean flag = calendarService.saveService(calendar);

        if (flag) ra.addFlashAttribute("msg", "reg-success");

        return flag ? "redirect:/horror/list" : "calendar:/";
    }

    // 게시물 삭제 요청
    @GetMapping("/delete")
    public String delete(Long calendarNo) {
        log.info("controller request /calendar/delete GET! - bno: {}", calendarNo);
        return calendarService.removeService(calendarNo)
                ? "redirect:/horror/list" : "redirect:/";
    }

    // 수정 화면 요청
    @GetMapping("/modify")
    public String modify(Long calendarNo, Model model) {
        log.info("controller request /board/modify GET! - bno: {}", calendarNo);
        Calendar calendar = calendarService.findOneService(calendarNo);
        log.info("find article: {}", calendar);

        model.addAttribute("calendar", calendar);
        return "calendar/calendar-modify";
    }

    // 수정 처리 요청
    @PostMapping("/modify")
    public String modify(Calendar calendar) {
        log.info("controller request /board/modify POST! - {}", calendar);
        boolean flag = calendarService.modifyService(calendar);
        return flag ? "redirect:/horror/content/" + calendar.getCalendarNo() : "redirect:/";
    }

}
