<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>

    <style>
        .content-container {
            width: 60%;
            margin: 150px auto;
            position: relative;
        }

        .content-container .main-content {
            border: 2px solid #ccc;
            border-radius: 20px;
            padding: 10px 25px;
            text-align: justify;
            min-height: 400px;
            width: 100%;
        }

        .content-container .custom-btn-group {
            position: absolute;
            bottom: -10%;
            left: 50%;
            transform: translateX(-50%);
        }

        .content-container h1 {
            margin-bottom: 50px;
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

    <div class="wrap">

        <div class="content-container">
            <!-- post는 주소에 ? 못붙임 -->

            <h1>영화 수정하기</h1>

            <form action="/horror/modify" method="post">
                <!-- hidden는 사용자몰래 데이터전송 -->
                <input type="hidden" name="calendarNo" value="${calendar.calendarNo}">

                <div class="firstBox">
                    <div class="month col-md-3 mb-3">
                        <label for="month-input" class="form-label">월</label>
                        <input type="text" class="form-control" id="month-input" placeholder="월" name="month" value="${calendar.month}">
                    </div>
                    <div class="day col-md-3 mb-3">
                        <label for="day-input" class="form-label">일</label>
                        <input type="text" class="form-control" id="day-input" placeholder="일" name="day" value="${calendar.day}">
                    </div>
                    <div class="time col-md-3 mb-3">
                        <label for="time-input" class="form-label">시간</label>
                        <input type="text" class="form-control" id="time-input" placeholder="시간" name="time" value="${calendar.time}">
                    </div>
                </div>

                <div class="secondBox">
                    <div class="channel col-md-3 mb-3">
                        <label for="channel-input" class="form-label">채널</label>
                        <input type="text" class="form-control" id="channel-input" placeholder="채널" name="channel" value="${calendar.channel}">
                    </div>
                    <div class="genre col-md-3 mb-3">
                        <label for="genre-input" class="form-label">장르</label>
                        <input type="text" class="form-control" id="genre-input" placeholder="장르" name="genre" value="${calendar.genre}">
                    </div>
                    <div class="limit col-md-3 mb-3">
                        <label for="limit-input" class="form-label">나이제한</label>
                        <input type="text" class="form-control" id="limit-input" placeholder="나이제한" name="limit" value="${calendar.limit}">
                    </div>
                </div>
                
                <div class="thirdBox">
                    <div class="title col-md-5 mb-3">
                        <label for="title-input" class="form-label">제목</label>
                        <input type="text" class="form-control" id="title-input" placeholder="제목" name="title" value="${calendar.title}">
                    </div>
                    <div class="movieTime col-md-5 mb-3">
                        <label for="movie-time-input" class="form-label">영상시간</label>
                        <input type="text" class="form-control" id="movie-time-input" placeholder="영화시간" name="movieTime" value="${calendar.movieTime}">
                    </div>
                    <div class="director col-md-5 mb-3">
                        <label for="director-input" class="form-label">감독명</label>
                        <input type="text" class="form-control" id="director-input" placeholder="감독명" name="director" value="${calendar.director}">
                    </div>
                </div>

                <div class="mb-3"> 
                    <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                    <!-- 넘기기위해선 name를 써야함 -->
                    <textarea name="content" class="main-content">${calendar.content}</textarea>
                </div>

                <div class="btn-group btn-group-lg custom-btn-group" role="group">
                    <button id="mod-btn" type="submit" class="btn btn-warning">완료</button>
                    <button type="submit" class="btn btn-dark">목록</button>
                </div>

            </form>

        </div>

    </div>


</body>

</html>