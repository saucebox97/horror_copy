<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

</head>

    <%@ include file="../include/static-head.jsp" %>

    <style>
        .calendar-list {
            width: 70%;
            margin: 100px auto 100px;
        }
        /* .calendar-list h1{
            margin-bottom: 50px;
        } */

        /* .calendar-list .title {
            display: flex;
            justify-content: space-between;
        } */
        .calendar-list h2 {
            text-align: right;
        }

        /* 검색창 */
        .calendar-list .top-section {
            display: flex;
            justify-content: space-between;
            padding: 0 0 10px 0;
        }
        .calendar-list .top-section .search form {
            display: flex;
        }
        .calendar-list .top-section .search form #search-type {
            flex: 1;
            margin-right: 10px;
        }
        .calendar-list .top-section .search form input[name=keyword] {
            flex: 3;
        }
        .calendar-list .top-section .search form button {
            margin-left: 10px;
        }
        .calendar-list .articles {
            width: 100%;
        }
        .calendar-list .articles tr {
            display: flex;
            align-items: center;
        }
        .calendar-list .articles tr :nth-child(2),
        .calendar-list .articles tr :nth-child(3) {
            font-size: 25px;
            width: 80px;
        }
        .calendar-list .articles tr :nth-child(4) {
            color: red;
            font-size: 20px;
            display: flex;
            align-items: center;
            width: 90px;
        }
        .calendar-list .articles tr :nth-child(4) .circle {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background: red;
            margin-right: 5px;
        }
        .calendar-list .articles tr :nth-child(5) {
            width: 120px;
        }
        .calendar-list .articles tr :nth-child(6) {
            color: green;
            width: 80px;
        }
        .calendar-list .articles tr :nth-child(7) {
            color: white;
            width: 40px;
        }
        .calendar-list .articles tr :nth-child(7) .limit-circle {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: green;
            text-align: center;
            
        }
        /* .calendar-list .articles tr :nth-child(8) {
            width: 300px;
        } */

        .calendar-list .articles td {
            padding: 10px;
            font-size: 18px;
        }

        .articles tr td:first-child {
            display: none;
        }

    </style>


<body>

    <div class="wrap">

        <div class="calendar-list">

            
            <h1>상영 일정</h1>
            <h2>${date}</h2>
            <h2>${time}</h2>
            

            <div class="top-section">
                <!-- 검색창 -->
                <div class="search">
                    <form action="/horror/list" mdethod="get">

                        <select class="form-select" name="type" id="search-type">
                            <option value="title">제목</option>
                            <option value="genre">장르</option>
                            <option value="content">내용</option>
                            <option value="tc">제목+내용</option>
                        </select>
                                                            <!-- /horror/list에서 s로 받았으니 s -->
                        <input type="text" class="form-control" name="keyword" value="${s.keyword}">

                        <button class="btn btn-primary" type="submit">
                            <i class="fas fa-search"></i>
                        </button>

                    </form>
                </div>

                <!-- 글쓰기 버튼 영역 -->
                <div class="btn-write">
                    <a class="btn btn-outline-danger btn-lg" href="/horror/write">글쓰기</a>
                </div>

            </div>
            <table class = "articles">

                <c:forEach var="c" items="${cList}">
                    <tr>
                        <td>${c.calendarNo}</td>
                        <td>${c.month}</td>
                        <td>${c.day}</td>
                        <td><div class="circle"></div>${c.time}</td>
                        <td>${c.channel}</td>
                        <td>${c.genre}</td>
                        <td>
                            <div class="limit-circle">${c.limit}</div>
                        </td>
                        <td>${c.title}</td>
                        <td>${c.movieTime}</td>
                    </tr>
                </c:forEach>

            </table>
            
        </div>

    </div>

    <script>
        // /write에서온 "msg" 확인작업
        function alertServerMessage() {
            const msg = '${msg}';

            if (msg === 'reg-success') {
                alert('게시물이 정상 등록되었습니다.');
            }
        }

        function detailEvent() {
            //상세보기 요청 이벤트
            const $table = document.querySelector(".articles");

            $table.addEventListener('click', e => {


                if (!e.target.matches('.articles td')) return;

                // console.log('tr 클릭됨! - ', e.target);

                let bn = e.target.parentElement.firstElementChild.textContent;
                // console.log('글번호: ' + bn);

                location.href = '/horror/content/' + bn ; 
            });
        }

        // 옵션태그 고정
        function fixSearchOption() {
            const $select = document.getElementById('search-type');

            for (let $opt of [...$select.children]) {
                if ($opt.value === '${s.type}') {
                    $opt.setAttribute('selected', 'selected');
                    break;
                }
            }
        }

        function changeColor() {
            
            const $table = document.querySelector('.articles');
            for (let $tr of [...$table.children[0].children]) {
                // div가 첫째자식임
                const $divLimitCircle = $tr.children[6].firstElementChild;
                const limitValue = $divLimitCircle.textContent;
                // console.log(limitValue);

                if ('19' === limitValue) {
                    $divLimitCircle.style.backgroundColor = 'red';
                }
                else if ('12' === limitValue) {
                    $divLimitCircle.style.backgroundColor = 'turquoise';
                }
                else if ('15' === limitValue) {
                    $divLimitCircle.style.backgroundColor = 'Orange';
                }
            }
        }

        function Straight() {
            const $line = document.querySelector('.articles');

            let prev = null, cur = null; 
            for (let $tr of [...$line.children[0].children]) {

                const $divStraight = $tr.children[2];
                const limitValue = $divStraight.textContent;
                // console.log(limitValue);

                prev = cur;
                cur = limitValue;

                // 만약에 이번 반복회차의 일수가 아까랑 달라지면 윗줄 그어라
                if (prev !== cur) {
                    $tr.style.borderTop = '2px solid rgb(75, 73, 73)'; 
                };
                
                
            }
        }

        function Live() {
            const $search = document.querySelector(".articles");
            let targetDay = '${targetDay}';
            let targetMonth = '${targetMonth}';
            let targetTime = '${targetTime}';
            // let tr = $search.children[0]; table과 tr 사이에 tbody가 숨어잇다 // 쓰레기코드다
            

            for (let $tr of [...$search.children[0].children]) {
                // div가 첫째자식임
                let $divMonth = $tr.children[1].textContent; // 월
                let $divDay = $tr.children[2].textContent; // 일
                let $divTime = $tr.children[3].textContent; // 영화시작시간
                let $divMovieTime = $tr.children[8].textContent; // 영화길이 
                console.log($divTime); // 309 : 9:30 출력
                $divMovieTime = $divMovieTime.substr(0, $divMovieTime.length - 1); //
                $divMovieTime = parseInt($divMovieTime); // num 120
                console.log($divMovieTime); // 120 출력
                
                let minute = $divTime.substr(3, 2);
                minute = parseInt(minute);
                console.log(minute);

                $divTime = parseInt($divTime); // num 20 326
                
                console.log($divTime); // 9
                let startMovie = $divTime*60+minute; // 1200

                let currentMinute = targetTime.substr(3, 2);
                currentMinute = parseInt(currentMinute);
                console.log(currentMinute);

                currentTime = parseInt(targetTime); // 현재 시간 num으로바꿈
                currentTime = currentTime*60+currentMinute;
                endMovie = startMovie+$divMovieTime; // 1350

                console.log(startMovie); //333
                console.log(currentTime); //348
                console.log(endMovie); // 335
                
                

                if($divDay === targetDay && $divMonth === targetMonth && ($divTime<tragetTime<$divTime+$divMovieTime)) {
                    const $td = document.createElement('td');
                    $td.textContent = 'live';
                    $td.style.color = 'red';
                    // $td.style.border = "1px solid black";
                    // $td.style.borderRadius = "5px";
                    $tr.appendChild($td);
                }
            }
        }

        (function () {

            alertServerMessage();
            detailEvent();
            fixSearchOption();
            changeColor();
            Straight();
            Live();

        })();

    </script>

</body>
</html>