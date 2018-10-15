<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/main.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Pacifico" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://files.codepedia.info/files/uploads/iScripts/html2canvas.js"></script>
    <title>SeatChange</title>
</head>
<body>
<div id="html-content-holder" style = "height:1500px;">
 <div class = "front">Front</div>



 <%
 	List<Object> seatArray = new ArrayList<Object>();
	List<Object> seatArrayRandom = new ArrayList<Object>();
	String delSeat[];
 	request.setCharacterEncoding("UTF-8");
 	String a = request.getParameter("seatNum");
 	String b = request.getParameter("seatRow");
 	String c = request.getParameter("delSeat");

 	int seatNum = Integer.parseInt(a.replace("명", ""));
 	int seatRow = Integer.parseInt(b.replace("줄", ""));
 	
 	delSeat = c.split(",");
 	
 
	//이름을 넣을 배열 생성
	
	 for (int x = 1; x <= seatNum; x++) {
		 seatArray.add(x);
	 }
	
	 for(int y = 0; y < delSeat.length; y++){
			System.out.println("가가가가" + delSeat[y] + "가가가가"); 
	 		seatArray.remove(new Integer(Integer.parseInt(delSeat[y])));

		 }
	 //seatArray.remove(5);
	
		 
	System.out.println("나나나나" + seatArray + "나나나나"); 

	
	
	 for (int i = 0; i < seatArray.size(); i++){
		 
		 Set s = new HashSet(seatArray.size());
		 s.addAll(seatArray);
		 List shuffledList = new ArrayList(s.size());
		 shuffledList.addAll(s);
		
		 Collections.shuffle(shuffledList);
		 seatArrayRandom = shuffledList;
		 
	  }
  
	 
	 
	 
%>
 
	<div class="drag-list"> 
<%
	 for(int i = 0; i < seatArrayRandom.size(); i++){
		 if(i % seatRow == 0)
		 {
			 out.println("<br>");
		 }
		 
		 
		 out.println("<div class = 'drag-item' draggable='true' id = 'SEAT'>" +  seatArrayRandom.get(i) + "</div>");
	 }

	
 %>
 
 </div>

 <script src = "js/drag.js"></script>
<script>
var formdata = new FormData();
formdata.append("image", dataURItoBlob(canvas.toDataURL('image/png')), 'file.png');
function dataURItoBlob(dataURI) {
   
    var byteString;
    if (dataURI.split(',')[0].indexOf('base64') >= 0)
        byteString = atob(dataURI.split(',')[1]);
    else
        byteString = unescape(dataURI.split(',')[1]);
   
    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
    
    var ia = new Uint8Array(byteString.length);
    for (var i = 0; i < byteString.length; i++) {
        ia[i] = byteString.charCodeAt(i);
    }
    return new Blob([ia], {type:mimeString});
}


</script>       
</div>
 <img src = "img/randomIcon.png" class = "rImg" onclick = "window.location.reload();">
<img src = "img/trashcan.png" class = "tImg" onclick = "window.location.href = 'index.jsp';">
<a id="btn-Convert-Html2Image" href = "#"><img src = "img/document.png" class = "dImg"></a>
    
    <button id="btn-Preview-Image" class = "button" style = "border:3.5px solid #fff;">미리<br>보기</button>
    <br>
   <div id='previewImage' style = "height:1000px;"></div>

<script>
$(document).ready(function(){

	
var element = $("#html-content-holder"); // global variable
var getCanvas; // global variable
 
    $("#btn-Preview-Image").on('click', function () {
    	
         html2canvas(element, {
         onrendered: function (canvas) {
        	   
                $("#previewImage").append(canvas);
                getCanvas = canvas;
                
             }
         });
         
        
    });

	$("#btn-Convert-Html2Image").on('click', function () {
    var imgageData = getCanvas.toDataURL("image/png");
    // Now browser starts downloading it instead of just showing it
    var newData = imgageData.replace(/^data:image\/png/, "data:application/octet-stream");
    $("#btn-Convert-Html2Image").attr("download", "seat.png").attr("href", newData);
	});

});


</script>
</body>
</html>
</body>
</html>
