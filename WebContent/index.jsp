<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>SeatChange</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Pacifico" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
</head>

<body>
        <p style="color:#fff;margin-top: 60px;font-size: 36pt;font-family: 'Pacifico', cursive;">&copy;ITKOO_SeatChange</p>
     <div class="container">
           
            <div class="navigation">
                <ol>
                    <li><a href="#"  data-ref="seatNum">seatNum</a></li>
                    <li><a href="#"  data-ref="seatRow">seatRow</a></li>
               		<li><a href="#"  data-ref="delSeat">delSeat</a></li>
                </ol>
            </div>
            <form id="sign-form" class="sign-form" action = "main.jsp" method = "post">
                <ol class="questions">
                    <li>
                        <span><label for="seatNum">안녕하세요, 반의 학생 수는 몇명인가요?</label></span>
						<input class="active" id="seatNum" name="seatNum" type="text" value = "명" autofocus/>
                    </li>
                    <li>
				        <span><label for="seatRow">& 교실 책상의 줄 수(행 수)는 몇인가요?</label></span>
                        <input id="seatRow" name="seatRow" type="text" value = "줄" autofocus/>
					</li>
					
					<li>
				        <span><label for="delSeat">& 삭제 할 번호를 입력해주세요.</label></span>
                        <input id="delSeat" name="delSeat" type="text" value = "2,4" autofocus/>
					</li>
                   
                    <li><p style="margin-top: 45px;font-size: 20pt;float:right">
                    	<input type = "submit" style="color:#6A79A6;text-decoration:none;border:none;" value = "자리를 바꾸러 가볼까요? ← Click :)"/>
                       
                    </li>
     
                </ol>
                <div id="next-page" alt="Kiwi standing on oval"></div>
                <div class="error-message"></div>
                
            </form>
            
            
      
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>
    <script  src="js/index.js"></script>

</body>

</html>
