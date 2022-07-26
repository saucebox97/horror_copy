<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/static-head.jsp" %>

<style>
    .write-container {
        width: 50%;
        margin: 100px auto 100px;
        font-size: 1.2em;
    }
    .write-container h1 {
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
    .title, .director, .movie-time
    {
        margin-right: 5px;
    }

</style>
</head>

<body>
    <div class="wrap">

        <div class="write-container">

            <h1>영화 등록하기</h1>

            <form id="write-form" action="/horror/write" method="post" autocomplete="off">
                <!-- name은 calendar의 데이터이름 // name이 있어야 데이터를 옮긴다-->
                <div class="firstBox">
                    <div class="month col-md-3 mb-3">
                        <label for="month-input" class="form-label">월</label>
                        <input type="text" class="form-control" id="month-input" placeholder="월" name="month">
                    </div>
                    <div class="day col-md-3 mb-3">
                        <label for="day-input" class="form-label">일</label>
                        <input type="text" class="form-control" id="day-input" placeholder="일" name="day">
                    </div>
                    <div class="time col-md-3 mb-3">
                        <label for="time-input" class="form-label">시간</label>
                        <input type="text" class="form-control" id="time-input" placeholder="시간" name="time">
                    </div>
                </div>
                
                <div class="secondBox">
                    <div class="channel col-md-3 mb-3">
                        <label for="channel-input" class="form-label">채널</label>
                        <input type="text" class="form-control" id="channel-input" placeholder="채널" name="channel">
                    </div>
                    <div class="genre col-md-3 mb-3">
                        <label for="genre-input" class="form-label">장르</label>
                        <input type="text" class="form-control" id="genre-input" placeholder="장르" name="genre">
                    </div>
                    <div class="limit col-md-3 mb-3">
                        <label for="limit-input" class="form-label">나이제한</label>
                        <input type="text" maxlength="2" class="form-control" id="limit-input" placeholder="나이제한" name="limit">
                    </div> 
                </div>

                <div class="thirdBox">
                    <div class="title col-md-5 mb-3">
                        <label for="title-input" class="form-label">제목</label>
                        <input type="text" class="form-control" id="title-input" placeholder="제목" name="title">
                    </div>
                    <div class="movieTime col-md-5 mb-3">
                        <label for="movie-time-input" class="form-label">영상시간</label>
                        <input type="text" class="form-control" id="movie-time-input" placeholder="영화시간" name="movieTime">
                    </div>
                    <div class="director col-md-5 mb-3">
                        <label for="director-input" class="form-label">감독명</label>
                        <input type="text" class="form-control" id="director-input" placeholder="감독명" name="director">
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="content-input" class="form-label">내용</label>
                    <textarea name="content" class="form-control" id="content-input" rows="10"></textarea>
                </div>

                <div class="d-grid gap-2">
                    <button id="reg-btn" class="btn btn-dark" type="button">글 작성하기</button>
                    <button id="to-list" class="btn btn-warning" type="button">목록으로</button>
                </div>

            </form>

        </div>
        
    </div>


    <script>

        //월 일 변환함수
        function add() {
            const $monthInput = document.getElementById('month-input');
            const $dayInput = document.getElementById('day-input');
        }

        // 게시물 등록 입력값 검증 함수
        function validateFormValue() {
            // 이름입력태그, 제목 입력태그
            const $monthInput = document.getElementById('month-input');
            const $dayInput = document.getElementById('day-input');
            const $timeInput = document.getElementById('time-input');
            const $channelInput = document.getElementById('channel-input');
            const $genreInput = document.getElementById('genre-input');
            const $titleInput = document.getElementById('title-input');
            const $movieTimeInput = document.getElementById('movie-time-input');
            const $limitInput = document.getElementById('limit-input');
            const $directorInput = document.getElementById('director-input');
            const $contentInput = document.getElementById('content-input');
            let flag = false; // 입력 제대로하면 true로 변경

            console.log('month: ',$monthInput.value);
            console.log('day: ',$dayInput.value);
            console.log('time: ',$timeInput.value);
            console.log('channe: ',$channelInput.value);
            console.log('genre: ',$genreInput.value);
            console.log('title: ',$titleInput.value);
            console.log('title: ',$movieTimeInput.value);
            console.log('limit: ',$limitInput.value);
            console.log('director: ',$directorInput.value);
            console.log('content: ',$contentInput.textContent);

            if ($monthInput.value.trim() !== '월' && 
            (13>$monthInput.value.trim()>0)) {
                alert('(1~12)월 로 입력해주세요');
            } else if ($dayInput.value.trim() !== '일' &&
            (32>$dayInput.value.trim()>0)) {
                alert('(1~31)일 로 입력해주세요');
            } else if ($timeInput.value.trim() === '') {
                alert('시간은 필수값입니다~');
            } else if ($channelInput.value.trim() === '') {
                alert('채널은 필수값입니다~');
            } else if ($genreInput.value.trim() === '') {
                alert('장르는 필수값입니다~');
            } else if ($titleInput.value.trim() === '') {
                alert('제목은 필수값입니다~');
            } else if ($limitInput.value.trim() !== '전' &&
            $limitInput.value.trim() !== '12' &&
            $limitInput.value.trim() !== '15' &&
            $limitInput.value.trim() !== '19') {
                alert('전 or 12 or 15 or 19중 하나를 입력하세요');
            } else if ($movieTimeInput.value.trim() === '') {
                alert('영상시간은 필수값입니다~');
            } else if ($directorInput.value.trim() === '') {
                alert('감독명은 필수값입니다~');
            } else if ($contentInput.value.trim() === '') {
                alert('내용은 필수값입니다~');
            } else {
                flag = true;
            }

            console.log('flag:', flag);

            return flag;
        }

        // 게시물 입력값 검증
        const $regBtn = document.getElementById('reg-btn');

        $regBtn.onclick = e => {
            e.preventDefault(); // 고유동작을중지?
            console.log("글작성 클릭!");
            // 입력값을 제대로 채우지 않았는지 확인 / 바로 위
            if (!validateFormValue()) {
                return;
            }

            // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
            const $form = document.getElementById('write-form');
            $form.submit();
        };

        //목록버튼 이벤트
        const $toList = document.getElementById('to-list');
        $toList.onclick = e => {
            location.href = '/horror/list';
        };

    </script>

</body>

</html>