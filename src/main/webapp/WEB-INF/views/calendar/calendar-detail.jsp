<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <%@ include file="../include/static-head.jsp" %>

    <style>
        .content-container {
            width: 70%;
            margin: 100px auto 100px;
        }
        .content-container .main-title {
            text-align: center;
        }
        .content-container .button {
            margin-top: 50px;
            text-align: center;
        }
        .content-container h1 {
            margin: 0 auto 50px;
            text-align: center;
        }

        .firstBox{
        display: flex;
        justify-content: space-between;
        }
        .month, .day, .time
        {
            margin-right: 5px;
        }
        .secondBox{
            display: flex;
            justify-content: space-between;
        }
        .channel, .genre, .limit
        {
            margin-right: 5px;
        }
        .thirdBox{
            display: flex;
            justify-content: space-between;
        }
        .title, .director, .movieTime
        {
            margin-right: 5px;
        }
    </style>

</head>

<body>

    <div class="content-container">

        <h1>영화 상세보기</h1>

        <div class="firstBox">
            <div class="month col-md-3 mb-3">
                <label for="month-input" class="form-label">월</label>
                <input type="text" class="form-control" id="month-input" placeholder="월" name="month" value="${calendar.month}" disabled>
            </div>
            <div class="day col-md-3 mb-3">
                <label for="day-input" class="form-label">일</label>
                <input type="text" class="form-control" id="day-input" placeholder="일" name="day" value="${calendar.day}" disabled>
            </div>
            <div class="time col-md-3 mb-3">
                <label for="time-input" class="form-label">시간</label>
                <input type="text" class="form-control" id="time-input" placeholder="시간" name="time" value="${calendar.time}" disabled>
            </div>
        </div>

        <div class="secondBox">
            <div class="channel col-md-3 mb-3">
                <label for="channel-input" class="form-label">채널</label>
                <input type="text" class="form-control" id="channel-input" placeholder="채널" name="channel" value="${calendar.channel}" disabled>
            </div>
            <div class="genre col-md-3 mb-3">
                <label for="genre-input" class="form-label">장르</label>
                <input type="text" class="form-control" id="genre-input" placeholder="장르" name="genre" value="${calendar.genre}" disabled>
            </div>
            <div class="limit col-md-3 mb-3">
                <label for="limit-input" class="form-label">나이제한</label>
                <input type="text" class="form-control" id="limit-input" placeholder="나이제한" name="limit" value="${calendar.limit}" disabled>
            </div>
        </div>

        <div class="thirdBox">
            <div class="title col-md-5 mb-3">
                <label for="title-input" class="form-label">제목</label>
                <input type="text" class="form-control" id="title-input" placeholder="제목" name="title" value="${calendar.title}" disabled>
            </div>
            <div class="movieTime col-md-5 mb-3">
                <label for="movie-time-input" class="form-label">영상시간</label>
                <input type="text" class="form-control" id="movie-time-input" placeholder="영화시간" name="movieTime" value="${calendar.movieTime}" disabled>
            </div>
            <div class="director col-md-5 mb-3">
                <label for="director-input" class="form-label">감독명</label>
                <input type="text" class="form-control" id="director-input" placeholder="감독명" name="director" value="${calendar.director}" disabled>
            </div>
        </div>

        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">내용</label>
            <p class="main-content">
                ${calendar.content}
            </p>

        </div>

        <div class="button">
            <div class="btn-group btn-group-lg custom-btn-group" role="group" >
                <button id="mod-btn" type="button" class="btn btn-warning">수정</button>
                <button id="del-btn" type="button" class="btn btn-danger">삭제</button>
                <button id="list-btn" type="button" class="btn btn-dark">목록</button>
            </div>
        </div>

    </div>

    <script>
        const [$modBtn, $delBtn, $listBtn] // 54줄 잡아옴 role이 group인애
           = [...document.querySelector('div[role=group]').children];

        // const $modBtn = document.getElementById('mod-btn');
        //수정버튼
        $modBtn.onclick = e => { // get임 post할려면 form써야됌
            location.href = '/horror/modify?calendarNo=${calendar.calendarNo}';
        };

        //삭제버튼
        $delBtn.onclick = e => {
            if(!confirm('정말 삭제하시겠습니까?')) {
                return;
            }
            location.href = '/horror/delete?calendarNo=${calendar.calendarNo}';
        };
        //목록버튼
        $listBtn.onclick = e => {               // page에서 pagenum/ amount/ 잊지않기위해쓴다//pageNum=${p.pageNum}&amount=${p.amount}
            location.href = '/horror/list?';
        };
    </script>

</body>
</html>