<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectTask/mainTask/taskDetail.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectTask/mainTask/taskDropdown.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectTask/mainTask/tap.css">
</head>
<body>
   <!-- <button onclick="" class="searchBtn" id="apply">모달창</button> -->
    <!-- Trigger/Open The Modal -->
    <!-- The Modal -->
    <div id="taskDetailModal"  class="taskmodal">
      <!-- Modal content -->
      <div class="taskmodal-content"><!-- 
      	 <input type="text" name="taskCode" id="taskCode" value=""> -->
         <div class="projectList" id="project"><div id="storyicon"></div><p id="sprintName" value=""></p></div><div class="projectList">/</div>
         <div class="projectList" id="story"><div id="taskicon"></div>TEST<p id="taskCode" value=""></p></div>
         <div id="cancel"><img src="/agile/resources/icon/common/icon_x.png" class="taskclose"></div>
         <div id="additional" style="margin-right:50px; margin-top:5px; border:none; ">
         	<div class="taskdropdown2">
                    <div class="select">
                          <span id="user-list"><img src="/agile/resources/icon/common/icon_more horizontalicon.png" id="add"></span>
                      <i class="fa fa-chevron-left"></i>
                    </div>
                    <ul class="taskdropdown2-menu">
                      <li id="work" href = "javascript:void(0)" 
                onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
                                         작업로그</li>
                      <li id="clone-task">복제</li>
                      <li id="delete-task">삭제</li>
                    </ul>
                  </div>
         </div>
         <div><img src="/agile/resources/icon/common/icon_shareicon.png" id="share"></div>
         <div><!-- <label id="count">1번</label> --><img src="/agile/resources/icon/common/icon_bookmarkicon.png" id="bookmark" value=""></div>
        <p align="left" class ="taskmodaltitle"><input type="text" placeholder="제목을 입력하세요" style="font-size:20px;" id="titleName" onkeyup="enterkey();" name="taskTitle" value=""></p>
        <input type="hidden" name="taskCategoryCode" id="taskCategoryCode" value="J">
        <input type="hidden" name="taskCode" id="taskCode" value="">
        <div id="leftContent">
        <table align="center" class="taskmodalTable"><!--  class="modal-dialog" -->
            <tr>
               <td>
               <button id="attachment"><img src = "/agile/resources/icon/common/icon_clip.png"><label class="subBtn">첨부</label></button>
               <form id="uploadForm" method="post" enctype="multipart/form-data" action="fileUpload" >
               <input type="file" name="upload" multiple="true" id="fileArea">
               <button id="uploadBtn" value="">업로드</button>
               </form>
               <button id="subtask"><img src = "/agile/resources/icon/common/icon_copyicon.png"><label class="subBtn">하위 테스크 생성</label></button>
               </td>
            </tr>
            <tr>
               <td id="intro" class="label">설명</td>
            </tr>
            <tr id="description">
               <td class="active"><input type="text" id="descript" name="descipt" placeholder="설명을 입력하세요" value=""></td>
            </tr>
            <tr id="htmlBox" style="display:none;">
               <td><textarea id="summernote" name="summernote" rows="10" cols="150" style="display:none;"></textarea></td>
               </div><input type="hidden" name="summerContent" id="summerContent">
               <input type="hidden" name="taskCategoryCode1" id="taskCategoryCode1" value="H">
            </tr>
            <tr id="htmlBtn" style="display:none;">
               <td><button id="desBtnCan" class="intBtn">Cancel</button>
               <button class="intBtn" onclick="updateDescipt()">Save</button></td>
            </tr>
            <div>
            <tr id="subTaskBox" style="display:none;">
               <td>하위 테스크</td>
            </tr>
            <table id="replySelect"><thead></thead><tbody></tbody></table>
            <tr id="subTaskText" style="display:none;"> 
               <td><input tyep="text" name="subTaskTitle" id="subTaskTitle" placeholder="무엇을해야합니까?" value=""></td>
            </tr>
            <tr id="subTaskBtn" style="display:none;">
               <td>
               <button id="subTaskCan" class="subTaskBtn">취소</button>
               <button id="subTaskMake"class="subTaskBtn" onclick="insertSubTask()">만들기</button>
               </td>
               <input type="hidden" name="subTaskCode" id="subTaskCode" value=""> 
               <input type="hidden" name="taskCategoryCode" id="taskCategoryCode2" value="J">           
            </tr><!-- 
            <tr>
               <td >활동</td>
            </tr> -->
        </table>
        	<div id="activity" class="label">활동</div>
        	<div class="container">
 
		        <ul class="tabs">
		          <li id="replyTab" class="tab-link current" data-tab="tab-1">댓글</li>
		          <li class="tab-link" data-tab="tab-2">기록</li>
		          <li class="tab-link" data-tab="tab-3">작업로그</li>
		        </ul>
		       
		        <div id="tab-1" class="tab-content current">
		        	<table id="replySelectTable"><thead></thead><tbody></tbody></table>
		        </div>
		        	<div class="profile" id="user"></div><label><c:out value="${ sessionScope.loginUser.userName }"/></label>
		               <input type="text" placeholder="댓글추가...." id="replyContents" value="">
		               <button id="replyBtn" class="replyBtn" onclick="insertReply()">등록</button>
		               <button id="replyBtnCan" class="replyBtn" >취소</button>
		               <input type="hidden" name="taskCategoryCode3" id="taskCategoryCode3" value="K">
		               <input type="hidden" id="replyHistCode">
		        	
		        
		        <div id="tab-2" class="tab-content">
		        	<div>기</div>
		        	<div>록</div>
		        </div>
		        
		        <div id="tab-3" class="tab-content">
		      		<div>활</div>
		        	<div>동</div>
		         </div>
		       
		      </div>
        
        </div>
       
       
       <!-------------------- 오른쪽 ----------------------------->
        <div id="detail">
           <table>
           	  <tr>
           	  	<div class="taskdropdown">
                    <div class="select">
                          <span id="not-start" value="not-start">미진행 v</span>
                      <i class="fa fa-chevron-left"></i>
                    </div>
                    <ul class="taskdropdown-menu" id="taskdropdown-menu">
                      <li class="taskStatus" id="work" value="work" onclick="taskStatus1()">진행중</li>
                      <li class="taskStatus" id="done" value="done" onclick="taskStatus2()">완료</li>
                    </ul>
                  </div>
                  </td>
           	  </tr>
              <tr>
                 <td><label>담당자</label></td>
              </tr>
             <tr>
                <td colspan="2"><!-- <div class="detailprofile" id="dProfile"></div>
                 <input type="text" placeholder="할당해제 됨" id="master" name="worker" class="worker"> -->
                 <div class="taskdropdown">
                    <div class="select">
                          <span id="user-list" onclick="selectTeam()"><div class="detailprofile" id="dProfile"></div>할당해제 됨</span>
                      <i class="fa fa-chevron-left"></i>
                    </div>
                    <ul id="teamlist2" class="taskdropdown-menu" >
                    <!-- <li id="work">심</li>
                      <li id="rest">다</li>
                      <li id="travel">윤</li>  -->
                    </ul>
                  </div>
                  </td>
                 <input type="hidden" name="taskCategoryCode4" id="taskCategoryCode4" value="L">
             </tr>
              <tr>
                 <td><label>보고자</label></td>
              </tr>
              <tr>
                <td colspan="2"><!-- <div class="detailprofile" id="bProfile"></div>
                 <input type="text" placeholder="할당해제 됨" id="bogo" class="worker"> -->
                 <div class="taskdropdown">
                    <div class="select">
                          <span id="user-list" onclick="teamSelect()"><div class="detailprofile" id="dProfile"></div>할당해제 됨</span>
                      <i class="fa fa-chevron-left"></i>
                    </div>
                    <ul id="teamlist" class="taskdropdown-menu">
                    </ul>
                  </div>
                 </td>
                 <input type="hidden" name="taskCategoryCode5" id="taskCategoryCode5" value="M">
             </tr>
             <tr>
                <td class="rTitle">스프린트 </td>
             </tr>
             <tr>
                <td><p id="sprintName" val=""></p></td>
             </tr>
             <tr>
                <td class="rTitle">레이블</td>
                <input type="hidden" name="taskCategoryCode6" id="taskCategoryCode6" value="N">
             </tr>
             <tr>
                <td><input type="text" placeholder="없음" class="dinput" id="labelText" value=""></td>
                <td><button type="submit" class="btn" id="labelBtn" onclick="insertLabel()" ><img src="/agile/resources/icon/common/icon_check.png" class="btnImage" style="width:10px; height:10px;"></button></td>
             </tr>
             <tr>
                <td class="rTitle">Story Points</td>
             </tr>
             <tr>
                <td><input type="text" id="pointText" name="amount" value=""></td>
                <td><button type="submit" class="btn" id="pointBtn" onclick="insertPoint()"><img src="/agile/resources/icon/common/icon_check.png" class="btnImage" style="width:10px; height:10px;"></button></td>
                <input type="hidden" name="taskCategoryCode7" id="taskCategoryCode7" value="D">
             </tr>
             <tr>
                <td class="rTitle">최초예상</td>
             </tr>
             <tr>
                <td><input type="datetime" placeholder="0m" class="dinput" id="expectText" name="expectTime" value=""></td>
                <td><button type="submit" class="btn" id="expectBtn" onclick="insertExpect()"><img src="/agile/resources/icon/common/icon_check.png" class="btnImage" style="width:10px; height:10px;"></button></td>
                <input type="hidden" name="taskCategoryCode8" id="taskCategoryCode8" value="A">
             </tr>
             <tr>
                <td class="rTitle">시간추적</td>
             </tr>
             <tr>
                <td><img src = "/agile/resources/icon/common/icon_clock.png"></td>
             <!--    <td><a href = "javascript:void(0)" 
                onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">여기</a></td>  -->
                <input type="hidden" name="taskCategoryCode9" id="taskCategoryCode9" value="B">
             </tr>
             <tr>
                <td class="rTitle">우선 순위
                <div class="taskdropdown">
                    <div class="select">
                          <span id="user-list">
							<img src="/agile/resources/icon/common/icon_arrow_upward_orange.png" style="width:20px; height:20px; float:left;">
							<label style="color:#FF6B00">Medium</label>
						  </span>
                      <i class="fa fa-chevron-left"></i>
                    </div>
                    <ul class="taskdropdown-menu">
                      <li id="high" value="high" onclick="taskProperty1();"><label style="color:#DD0351"><img src="/agile/resources/icon/common/icon_arrow_upward_red.png" style="width:20px; height:20px; float:left;">High</label></li>
                      <li id="medium" value="medium" onclick="taskProperty2();"><label style="color:#FF6B00"><img src="/agile/resources/icon/common/icon_arrow_upward_orange.png" style="width:20px; height:20px; float:left;">Medium</label></li>
                      <li id="low" value="low" onclick="taskProperty3();"><label style="color:#03A500"><img src="/agile/resources/icon/common/icon_arrow_downward_green.png" style="width:20px; height:20px; float:left;">Low</label></li>
                    </ul>
                  </div>
                 </td>
                <input type="hidden" name="taskCategoryCode10" id="taskCategoryCode10" value="C">
             </tr>
             <tr>
                <td></td>
             </tr>
             <tr>
                <td><hr></td>
             </tr>
             <tr>
                <td>생성됨</td><td id="makeDate" value=""></td><td id="makeTime" value=""></td>
             </tr>
             <tr>
                <td>2초전 업데이트</td>
             </tr>
           </table>
        </div>
    </div>
   </div>
    <!----------------- 테스크추가 모달창 ---------------------->
      <div id="taskModalYn" class="modal">
         <div class="modal-content">
            <p align="left" class="modaltitle">🎉 새로운 테스크 생성</p>
            <table align="center" class="modalTable">
               <tbody>
                  <tr>
                     <td>[<b id="sprintName" value=""></b>]
                     (스프린트)에 새로운 테스크를 추가하시겠습니까?</td>
                  </tr>
                  <tr>
                     <td>※초기 테스크명은 테스크 코드로 자동지정됩니다.</td>
                  </tr>
               </tbody>
            </table>
            <div class="modalButtonArea" id="newTask">
               <button onclick="createTask()" class="taskMake" id="rectangle7" type="submit">저장</button>
               <div class="taskCancel" id="rectangle7" data-dismiss="modal" aria-label="Close">취소</div>
               <input type="hidden" name="sprintCode" id="sprintCode" value="">
               <input type="hidden" name="taskCode" id="taskCode" value="">
            </div>    

         </div>
      </div>

	<!-- 시간 추적 -->
		<div id="light" class="white_content">
			<div id="header">
                <h3>시간 추적</h3>
                <div class="result"><img src = "/agile/resources/icon/common/icon_clock.png" id="clockImg"></div>
                <div><label id="graph">그래프</label></div>
                <div class="timeSet"><input type="text"></div><div class="timeSet"><input type="text"></div>
            	
            </div>
            <div id="medium">
                <div id="during">
                    <div id="expect-left" class="leftTime">예상 소요시간 : </div>
                    <div id="leftTime" class="leftTime">남은시간 : </div>
                </div>
                    <div><label id="expect-left-modal" class="takenTime"><label id="left-modal" class="takenTime"></div>
            </div>
            <div>
                <div id="startDate">시작한날짜 : </div>
             </div>    
            <div><button id="rectangle6">저장</button></div>
            <div><button id="rectangle7">
		<a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">닫기</a></button></div>
     	<div id="fade" class="black_overlay"></div>
     </div>	
     
   <!-- 로딩중 -->
    <div class="wrap-loading display-none">
         <div><img src="/agile/resources/icon/common/icon_loading.gif"/></div>
   </div> 
   

<script>
	$('.sprinttbody').click(function () {
	    
	    /* 언니이건 스프린트코드 */
	    var receiveCode = $('#sendSprintCode').val();
	    
	    /* 이건 프로젝트네임 */
	    var receiveProjectName = $('#projectName').html();
	    
	    /*스프린트 네임*/
	    var sprintName = $('.updateSprintName').val();
	    
	    /* task좌측 상단에 넣는거 */
	    $('#projectNameReceive').html(receiveProjectName);
	    /* $('#sprintCodeReceive').html(receiveCode+'번 스프린트'); */
	    $('#sprintCode').val(receiveCode);
	    $('#sprintName').val(sprintName);
	    				
		/* $('#taskCode').val(data.TaskHistory.taskCode); */
		console.log('#taskCode');
	    
	 })
   
   //When the user clicks anywhere outside of the modal, close it
   window.onclick = function(event) {
     if (event.target == taskModalYn) {
    	 taskModalYn.style.display = "none";
     } else if (event.target == taskDetailModal) {
    	 taskDetailModal.style.display = "none";
     }
   };
   
   //테스크 내에 설명 html부분
   $('#summernote').summernote({
      	lang: 'ko-KR',
        placeholder: '안녕하세요 스탭업! 입니다',
        tabsize: 4,
        width: 400,
        height: 140,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline']],
          ['color', ['color']],
          ['para', ['paragraph']],
          ['insert', ['link', 'picture']],
          ['view', [ 'codeview']]
        ]
      });
   
   //html 입력부분 클릭시 나타남
   $('#descript').click(function() {
		$('#htmlBox').fadeIn(300); 
		$('#htmlBox').css('display','block');
		$('#htmlBtn').css('display','block');
		$('#descript').css('display','none');
	});
   
   //Cancel 버튼 클릭시 html 사라짐
   $('#desBtnCan').click(function(){
	   $('#descript').fadeIn(300); 
	   $('#descript').css('display','block');
	   $('#htmlBox').css('display','none');
	   $('#htmlBtn').css('display','none');
   });
   
   //댓글 버튼 나오기
   $('#reply').click(function(){
	   $('.replyBtn').toggle();
   });
   
 	//sub-Task 추가 부분 나오기
   $('#subtask').click(function(){
	   $('#subTaskBox').toggle();
	   $('#subTaskText').toggle();
	   $('#subTaskBtn').toggle();
	   
   });
 	
 	//레이블 버튼
 	$(".labelText").click(function(){
 		$('.labelBtn').toggle();
 	});
 	
 	//StoryPoint 버튼
 	$('.pointText').click(function(){
 		$('.pointBtn').toggle();
 	});
 	
 	//최초예상 버튼
 	$('.expectText').click(function(){
 		$('.expectBtn').toggle();
 	});
 	
 	//드롭다운
 	$('.taskdropdown').click(function() {
	$(this).attr('tabindex', 1).focus();
	$(this).toggleClass('active');
	$(this).find('.taskdropdown-menu').slideToggle(300);
	});
	
	$('.taskdropdown').focusout(function() {
		$(this).removeClass('active');
		$(this).find('.taskdropdown-menu').slideUp(300);
	});
	
	$('.taskdropdown .taskdropdown-menu li').click(
		function() {
			$(this).parents('.taskdropdown').find('span').text($(this).text());
			$(this).parents('.taskdropdown').find('input').attr('value',$(this).attr('id'));
	});
	
	$('.taskdropdown-menu li').click(function() {
			var input = '<strong>' + $(this).parents('.taskdropdown').find('input').val() + '</strong>', msg = '<span class="msg">Hidden input value: ';
			$('.msg').html(msg + input + '</span>');
			var input = $(this).parents('.taskdropdown').find('input').val()
	});
	
	
	
	//드롭다운2
 	$('.taskdropdown2').click(function() {
	$(this).attr('tabindex', 1).focus();
	$(this).toggleClass('active');
	$(this).find('.taskdropdown2-menu').slideToggle(300);
	});
	
	$('.taskdropdown2').focusout(function() {
		$(this).removeClass('active');
		$(this).find('.taskdropdown2-menu').slideUp(300);
	});
	
	$('.taskdropdown2 .taskdropdown2-menu li').click(
		function() {
			$(this).parents('.taskdropdown2').find('span').text($(this).text());
			$(this).parents('.taskdropdown2').find('input').attr('value',$(this).attr('id'));
	});
	
	$('.taskdropdown2-menu li').click(function() {
			var input = '<strong>' + $(this).parents('.taskdropdown2').find('input').val() + '</strong>', msg = '<span class="msg">Hidden input value: ';
			$('.msg').html(msg + input + '</span>');
			var input = $(this).parents('.taskdropdown2').find('input').val()
	});
	
	//탭메뉴
	$(document).ready(function(){
   
  $('ul.tabs li').click(function(){
    var tab_id = $(this).attr('data-tab');
 
    $('ul.tabs li').removeClass('current');
    $('.tab-content').removeClass('current');
 
    $(this).addClass('current');
    $("#"+tab_id).addClass('current');
  })
 
})

	//파일 업로드
	$(function(){
		$("#fileArea").hide();
		
		$("#attachment").click(function(){
			$("#fileArea").click();
		});
	});
	
 	//예상시간 정규표현식
 	function parse (str) {
    			        // validate year as 4 digits, month as 01-12, and day as 01-31 
    			        if ((str = str.match (/^(\d{4})(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/))) {
    			           // make a date
    			           str[0] = new Date (+str[1], +str[2] - 1, +str[3]);
    			           // check if month stayed the same (ie that day number is valid)
    			           if (str[0].getMonth () === +str[2] - 1) {
    			              return str[0];
    			           }
    			           alert("20200918의 패턴으로 작성해주세요")
    			        }
    			        return str;
    			 }
 
	 
    //TASK_LIST 생성 후 TASK 모달로 연결
   	var taskCode;
	 function createTask() {
			var sprintCode = $('#sendSprintCode').val();
			
			console.log(sprintCode);
			
			$.ajax({
				url:"createTask.pj",
				type:"post",
				data:{'sprintCode': sprintCode},
				async: false,
				dataType : "json",
				success:function(data) {
					console.log("성공!");
					console.log(data);
					$('#taskCode').append(data.list.taskCode);
					$('#taskCode').val(data.list.taskCode);
					$('#makeDate').append('<td>'+data.list.taskCreateDate+'/<td>').append('<td colspan="2">'+data.list.taskCreateTime+'/<td>');
					$('#makeDate').val(data.list.taskCreateDate);
					$('#makeTime').val(data.list.taskCreateDate);
					$('#taskModalYn').css('display','none');
					$('#taskDetailModal').fadeIn(); 
					$('#taskDetailModal').css('display','block');
				},
				error:function(){
					console.log("에러!");
				},
				beforeSend : function(){
                    $('.wrap-loading').removeClass('display-none');
                },
                complete : function(){
                    $('.wrap-loading').addClass('display-none');
                 }
			});
			return taskCode;
		}
    
	//input type text에서 엔터치면 실행되는 함수
	function enterkey() {
		if(window.event.keyCode == 13){
				updateTitle();
		}
	}
    
    //TASK_HISTORY에 정보 입력
    //1. 제목 변경
     function updateTitle(){
    	
    	var taskCode = $('#taskCode').val();
    	var taskHistValue = $('#titleName').val();
    	var taskCategoryCode = $('#taskCategoryCode').val();
    	console.log(taskCode);
    	console.log(taskHistValue);
    	console.log(taskCategoryCode);
    	
    	$.ajax({
    		type:"post",
    		url:"updateTitle.pj",
    		data: {"taskCode" : taskCode,
    			   "taskHistValue" : taskHistValue,
    			   "taskCategoryCode" : taskCategoryCode
    		},
    		success: function(data){
    			$('#titleName').val(data);
    		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    }
    
    //2. 설명 변경
    function updateDescipt(){

    	var taskCode = $('#taskCode').val();
    	//summernote 내용 가져오기
        var summernote = $('#summernote').summernote('code').replace(/<\/?[^>]+(>|$)/g, ""); 
    	var taskCategoryCode = $('#taskCategoryCode1').val();
    	var descript = $('#descript').val();
    	console.log(taskCode);
    	console.log(summernote);
    	console.log(descript);
    	
    	$.ajax({
    		type:"post",
    		url:"updateDescipt.pj",
    		data: {
    			"taskCode": taskCode, 
    			"summernote": summernote, 
    			"taskCategoryCode": taskCategoryCode
    		},
    		success: function(data){
    			console.log("성공!");
    			console.log(taskCode);
    			console.log(summernote);
    			$('#descript').val(summernote);
    			$('#descript').fadeIn(300); 
    			$('#descript').css('display','block');
    			$('#htmlBox').css('display','none');
    			$('#htmlBtn').css('display','none');
    		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    }
    
    //3.서브 테스크 추가
     function insertSubTask(){
    	var headTaskCode = $('#taskCode').val();
    	var subTaskTitle = $('#subTaskTitle').val();
    	var taskCategoryCode = $('#taskCategoryCode2').val();
    	console.log(taskCode);
    	console.log(subTaskTitle);
    	console.log(taskCategoryCode);
    	
    	$.ajax({
    		type:"post",
    		url:"insertSubTask.pj",
    		data: {
    			"headTaskCode": headTaskCode, 
    			"subTaskTitle": subTaskTitle, 
    			"taskCategoryCode": taskCategoryCode
    		},
    		success: function(data){
    			console.log("성공!")
     			console.log(data);
     			
 				var $replySelect = $("#replySelect tbody");
 				$replySelect.html('');
 				
 				for(var i = 0; i<data.history.length; i++) {
 					var $tr = $("<tr>").css("border", "1px");
 					var $img = $("<td><div id='taskicon'></div></td>").css("width","40px");
 					var $teskNumTd = $("<td>").text('Task'+data.history[i].taskHistCode);
 					var $titleTd = $("<td>").text(data.history[i].taskHistValue).css("width", "200px");
 					/* var $statusTd =  진행미진행 추가하기 */
 					
 					$tr.append($img);
 					$tr.append($teskNumTd);
 					$tr.append($titleTd);
 					
 					$replySelect.append($tr);
 				} 
     		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    }
    
   //4.댓글 추가 
   	var replyCode;
    var userCode;
    var memberCode;
     function insertReply() {
  		var content = $("#replyContents").val();
  		var taskCode = $('#taskCode').val();
  		var taskCategoryCode = $('#taskCategoryCode3').val();

  		console.log(content);
  		console.log(taskCode);
  		console.log(taskCategoryCode);
     	
     	$.ajax({
     		type:"post",
     		url:"insertReply.pj",
     		dataType : "json",
     		data: {
     			"content": content,
     			"taskCode": taskCode,
     			"taskCategoryCode": taskCategoryCode
     		},
     		success: function(data){
     			console.log("성공!")
     			console.log(data);
     			
     			console.log(data.replyHistory[0].replyList.replyCode);
     			
     			
 				var $replySelectTable = $("#replySelectTable tbody");
 				$replySelectTable.html('');
 				
 				for(var i = 0; i<data.replyHistory.length; i++) {
 					
 				   replyCode = data.replyHistory[i].replyCode;
 				   userCode = data.replyList.userCode;
 				   memberCode = '""' + userCode + '""';
 					
 					var $tr = $("<tr>");
 					var $pictureTd = $("<td>").text(data.replyHistory[i].attachment.thumbnailPath).css("width", "50px");
 					var $nameTd = $("<td>").text(data.replyHistory[i].member.userName).css("width", "50px");
 					var $contentTd = $("<td>").text(data.replyHistory[i].replyContents).css("width", "130px");
 					var $dateTd = $("<td>").text(data.replyHistory[i].replyUpdateDate).css("width", "80px");
 					var $reviseBtn = $("<td><button onclick='updateReply(" + replyCode + "," + memberCode ")';>수정</button>").css("width","50px");
 					var $deleteBtn = $("<td><button>삭제</button>").css("width","50px");
 					$('#replyHistCode').val(data.replyHistory[i].replyHistCode);
 					
 					$tr.append($pictureTd);
 					$tr.append($nameTd);
 					$tr.append($contentTd);
 					$tr.append($dateTd);
 					$tr.append($reviseBtn);
 					$tr.append($deleteBtn);
 					
 					$replySelectTable.append($tr);
 					
 					
				}
 		},
     		error:function(){
     			console.log("에러!");
     		},
     		beforeSend : function(){
                 $('.wrap-loading').removeClass('display-none');
             },
             complete : function(){
                 $('.wrap-loading').addClass('display-none');
              }
     	});
     	
     	return false;
   }
   
   //4-1.댓글 수정
   
   function updateReply(replyCode, memberCode) {
 						console.log(replyCode);
 						console.log(memberCode);
 						
 						var taskCode = $('#taskCode').val();
 						var replyCode = replyCode;
 						var userCode = userCode;
 						
 						$.ajax({
 							url:"updateReply.pj",
 							type:"post",
 							async:false,
 							data : {
 								'taskCode':taskCode,
 								'replyCode':replyCode,
 								'userCode' :userCode
 							},
 							dataType:"json",
 							success:function(data) {
 								console.log("성공!");
 								console.log(data);
 							},
 							error:function(){
									console.log("에러!");
								},
								beforeSend : function(){
				                 $('.wrap-loading').removeClass('display-none');
				             },
				             complete : function(){
				                 $('.wrap-loading').addClass('display-none');
				              }
							});
							return taskCode;
						} 
     
   //5.담당자 리스트 선택
   
	
	//5.담당자 선택
	function selectTeam(){
	   
	   var taskCode = $('#taskCode').val();
	   console.log(taskCode);
	   
	   $.ajax({
		   type:"post",
		   url:"selectTeam.pj",
		   dataType:"json",
		   async:false,
		   data: {
			   "taskCode" : taskCode
		   },
		   success:function(data) {
			   console.log("성공!");
			   console.log(data);
			   console.log(data.list[0].userName);
			   
			   var $teamlist = $("#teamList");
			   $teamlist.html('');
			   
			   for(var i = 0; i<data.list.length; i++) {
				   memberCode = data.list[i].userCode;
				   memberName = data.list[i].userName;
				   giveUserName = '""' + memberName + '""';
				   
				   var $li = $("<li>");
				   var $userName = $("<li onclick='updateUser(" + memberCode + "," + giveUserName + ");'>").text(data.list[i].userName);
				   
				   $li.append($userName);
				   $teamlist.append($li);
			   }
		   },
		   error:function(){
   			console.log("에러!");
   		},
   		beforeSend : function(){
               $('.wrap-loading').removeClass('display-none');
           },
           complete : function(){
               $('.wrap-loading').addClass('display-none');
            }
   	});
   	
   	return false;
	}
	
	//6.보고자 팀리스트 선택
	  function updateUser(memberCode, giveUserName) {
		console.log(memberCode);
		console.log(memberName);
		
		var taskCode = $('#taskCode').val();
		var memberCode = memberCode;
		var memberName = memberName;
		
		$.ajax({
			url:"updateUser.pj",
			type:"post",
			data:{
				'taskCode' :taskCode,
				'memberCode':memberCode,
				'memberName' :memberName
			},
			async:false,
			dataType:"json",
			success:function(data){
				console.log("성공!");
				console.log(data);
			},
			error:function(){
				console.log("에러!");
			},
			beforeSend : function(){
             $('.wrap-loading').removeClass('display-none');
         },
         complete : function(){
             $('.wrap-loading').addClass('display-none');
          }
		});
		return taskCode;
	}  

   
   //6.보고자 선택
	function teamSelect(){

    	var taskCode = $('#taskCode').val();
    	console.log(taskCode);
    	
    	$.ajax({
    		type:"post",
    		url:"selectTeam2.pj",
    		dataType : "json",
    		data: {
    			"taskCode": taskCode
    		},
    		success: function(data){
    			console.log("성공!");
    			console.log(data);
    			
    			
    			var $teamlist = $("#teamlist2");
 				$teamlist.html('');
 				
				for(var i = 0; i<data.list.length; i++) {
 					
 					pplCode = data.list[i].userCode;
 					pplName = data.list[i].userName;
 					pplName = data.list[i].userName;
	 				UserName = '"' + memberName +'"';
 					
 					var $li = $("<li>");
 					var $userName = $("<li onclick='updateMaster(" + pplCode + "," + UserName + ");'>").text(data.list[i].userName);
 					$li.append($userName);
 					
 					$teamlist.append($li);
 					
 					 function updateMaster(pplCode, UserName) {
 						console.log(taskCode);
 						console.log(pplCode);
 						console.log(mempplCodeberName);
 						var taskCode = $('#taskCode').val();
 						var pplCode = pplCode;
 						var pplName = pplName;
 						console.log(memberCode);
 						console.log(pplName);
 						
 						$.ajax({
 								url:"taskUser.pj",
 								type:"post",
 								async: false,
 								data:{
 									  'pplCode' : pplCode,
 									  'pplName' : pplName,
 									  'taskCode' : taskCode
 								},
 								dataType : "json",
 								success:function(data) {
 									console.log("성공!");
 									console.log(data);
 									
 								},
 								error:function(){
 									console.log("에러!");
 								},
 								beforeSend : function(){
 				                 $('.wrap-loading').removeClass('display-none');
 				             },
 				             complete : function(){
 				                 $('.wrap-loading').addClass('display-none');
 				              }
 							});
 							return taskCode;
 						} 
 				}
     		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    }	 		
   //7.레이블 선택
	function insertLabel(){

    	var labelText = $('#labelText').val();
    	var taskCode = $('#taskCode').val();
    	var taskCategoryCode = $('#taskCategoryCode6').val();
    	console.log(taskCode);
    	console.log(labelText);
    	console.log(taskCategoryCode);
    	
    	$.ajax({
    		type:"post",
    		url:"insertLabel.pj",
    		dataType:"json",
    		data: {
    			"labelText": labelText, 
    			"taskCode": taskCode, 
    			"taskCategoryCode": taskCategoryCode
    		},
    		success: function(data){
    			console.log("성공!");
    			var list = JSON.stringify(data);
    			console.log(list)
    			$('#labelText').val(list);
    		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    }		
   //8.Story Point 선택
	function insertPoint(){

    	var taskHistValue = $('#pointText').val();
    	var taskCode = $('#taskCode').val();
    	var taskCategoryCode = $('#taskCategoryCode7').val();
    	console.log(taskCode);
    	console.log(taskHistValue);
    	console.log(taskCategoryCode);
    	
    	$.ajax({
    		type:"post",
    		url:"insertPoint.pj",
    		dataType:"json",
    		data: {
    			"taskHistValue": taskHistValue, 
    			"taskCode": taskCode, 
    			"taskCategoryCode": taskCategoryCode
    		},
    		success: function(data){
    			console.log("성공!");
    			$('#pointText').val(list);
    		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    }		
   //9.최초예상 선택
	 function insertExpect(){

    	var taskHistValue = $('#expectText').val();
    	var taskCode = $('#taskCode').val();
    	var taskCategoryCode = $('#taskCategoryCode8').val();
    	console.log(taskCode);
    	console.log(taskHistValue);
    	console.log(taskCategoryCode);
    	
    	$.ajax({
    		type:"post",
    		url:"insertExpect.pj",
    		dataType:"json",
    		data: {
    			"taskHistValue": taskHistValue, 
    			"taskCode": taskCode, 
    			"taskCategoryCode": taskCategoryCode
    		},
    		success: function(data){
    			console.log("성공!");
    			console.log(data);
    			$('#expectText').val(data.taskHistory.taskHistValue);
    			$('#expect-left').val(data.taskHistory.taskHistValue);
    			$('#expect-left').append(data.taskHistory.taskHistValue);
    			$('#expectText').append(data.taskHistory.taskHistValue);
    		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    }	
   //10.시간추적 선택
			
   //11.우선순위 선택
   function taskProperty1(){
	   
	    var high = $('#high').val();
    	var taskCode = $('#taskCode').val();
    	console.log(taskCode);
    	console.log(high);
    	
    	$.ajax({
    		type:"post",
    		url:"taskProperty1.pj",
    		dataType : "json",
    		async:false,
    		data: {
    			"taskCode": taskCode,
    			"high": high
    		},
    		success: function(data){
    			console.log("성공!");
				console.log(data);
     		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    }
   
    function taskProperty2(){
 	   
    	var medium = $('#medium').val();
    	var taskCode = $('#taskCode').val();
    	console.log(taskCode);
    	console.log(medium);
    	
    	$.ajax({
    		type:"post",
    		url:"taskProperty2.pj",
    		dataType : "json",
    		data: {
    			"taskCode": taskCode,
    			"medium": medium
    		},
    		success: function(data){
    			console.log("성공!");
    			console.log(data);
     		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    }
    
    function taskProperty3(){
  	   
    	var low = $('#low').val();
    	var taskCode = $('#taskCode').val();
    	console.log(taskCode);
    	console.log(low);
    	
    	$.ajax({
    		type:"post",
    		url:"taskProperty2.pj",
    		dataType : "json",
    		data: {
    			"taskCode": taskCode,
    			"low": low
    		},
    		success: function(data){
    			console.log("성공!");
    			console.log(data);
     		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    }
   //12.테스크 진행여부 선택.
  /*  var selectOption = ''; */
   /* $(document).on('click', '#taskdropdown-menu li', function(){
    $('#taskdropdown-menu li').click(function(){ */
    	
      /*  function taskStatus(){
    	$('.tastStatus').click(function(){
		   status += $(this).val();
    	}); */
     	var date = new Date();
		var year;
		var month;
		var day;
		var time;
		var fullDate;
		var fullTime;
		
    	function taskStatus1(){
	   
	    var selectOption = $('#work').val();
    	var taskCode = $('#taskCode').val();
    	console.log(taskCode);
    	console.log(selectOption);
    	
    	$.ajax({
    		type:"post",
    		url:"taskStatus1.pj",
    		dataType : "json",
    		data: {
    			"taskCode": taskCode,
    			"selectOption": selectOption
    		},
    		success: function(data){
    			console.log("성공!");
    			console.log(data.taskHistory.taskHistUpdateDate);
    			$('#startDate').append(data.taskHistory.taskHistUpdateDate).append(data.taskHistory.taskHistUpdateTime);
				
    			var str = $('#expect-left').text();
    			 
    			
    			/* fullDate = data.taskHistory.taskHistUpdateDate;
    			fullTime = data.taskHistory.taskHistUpdateTime;
    			year = fullDate.getFullYear();
    			month = fullDate.getMonth();
    			day = fullDate.getDate();
    			time = fullTime.getTime();
    			console.log(year);
    			console.log(month);
    			console.log(day);
    			console.log(time);   */
     		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    }
    	
    function taskStatus2(){
 	   
	    var selectOption = $('#done').val();
    	var taskCode = $('#taskCode').val();
    	console.log(taskCode);
    	console.log(selectOption);
    	
    	$.ajax({
    		type:"post",
    		url:"taskStatus2.pj",
    		dataType : "json",
    		data: {
    			"taskCode": taskCode,
    			"selectOption": selectOption
    		},
    		success: function(data){
    			console.log("성공!");
    			console.log(data);
     		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    }
    
   //북마크
   /*  function bookmark(){
  	   
    	var taskCode = $('#taskCode').val();
    	console.log(taskCode);
    	
    	$.ajax({
    		type:"post",
    		url:"bookmark.pj",
    		dataType : "json",
    		data: {
    			"taskCode": taskCode
    		},
    		success: function(data){
    			console.log("성공!");
    			console.log(data);
    			var bookmark = $('#bookmark');
    			bookmark.src="/agile/resources/icon/common/icon_bookmarkfull.jpg";
 
     		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    } */
    
   //파일업로드
	/* $('.file').change(function(){                            //업로드할 파일을 선택 할 경우 동작을 일으킵니다.

var form = $('#uploadForm');

form.ajaxSubmit({

           url: 'fileUploadAjax',

           data: form.serialize(),                         //폼의 값들을 주소화하여 보내게 됩니다.

           type: 'POST',     

           success: function(data){
        	   $('.file').val('');                           //file input에 들어가 있는 값을 비워줍니다.
               console.log(data);                      //업로드 되었다면 결과를 콘솔에 출력해봅니다.
           },
			error: function(data){
				console.log("실패");
			},
			 beforeSend : function(){
	            $('.wrap-loading').removeClass('display-none');
	        },
	          complete : function(){
	            $('.wrap-loading').addClass('display-none');
	        }
		}); // $.ajax
	}); */
   
    
   //복제 클릭 이벤트
	$(document).on("click","#clone-task",function(){
		
		var titleName = $('#titleName').val();
		var taskCode = $('#taskCode').val();
		var sprintCode = $('#sprintCode').val();
		var subTaskTitle = $('#subTaskTitle').val();
		var replyContents =  $('#replyContents').val();
		var labelText =  $('#labelText').val();
		var taskPointText =  $('#taskPointText').val();
		var expectText =  $('#expectText').val();
		var high =  $('#high').val();
		var medium =  $('#medium').val();
		var low =  $('#low').val();
		var work =  $('#work').val();
		var done =  $('#done').val();
		var summernote = $('#summernote').summernote('code').replace(/<\/?[^>]+(>|$)/g, ""); 

		$.ajax({
			url:"insertCloneTask.pj",
			type:"post",
			data:{
				"taskCode": taskCode, 
				"sprintCode":sprintCode,
				"subTaskTitle" : subTaskTitle,
				"replyContents" : replyContents,
				"labelText" : labelText,
				"taskPointText" : taskPointText,
				"expectText" : expectText,
				"high" : high, 
				"medium" : medium,
				"low" : low,
				"work" : work,
				"done" : done,
				"summernote" : summernote
			},
			dataType : "json",
			success: function(data){
				location.href="selectBugTask.pj";
				//location.reload(true);
			},
			error: function(data){
				console.log("실패");
			},
			 beforeSend : function(){
	            $('.wrap-loading').removeClass('display-none');
	        },
	          complete : function(){
	            $('.wrap-loading').addClass('display-none');
	        }
		});
	});
	
	//삭제 클릭 이벤트
	$(document).on("click","#delete-task",function(){
		var taskCode = $('#taskCode').val();
		
		$.ajax({
			url:"deleteCloneTask.pj",
			type:"post",
			data:{"taskCode" : taskCode},
			dataType : "json",
			success: function(data){
				location.href="selectBugTask.tk";
				//location.reload(true);
			},
			error: function(data){
				console.log("실패");
			},
			 beforeSend : function(){
	            $('.wrap-loading').removeClass('display-none');
	        },
	          complete : function(){
	            $('.wrap-loading').addClass('display-none');
	        }
		});
	});

</script>
</body>
</html>