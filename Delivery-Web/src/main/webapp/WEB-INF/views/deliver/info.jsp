<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
<title>My page for deliver</title>
<%@ include file="../include/link.jsp"%>
<style>
.imgChange{
	display:none;
} 

.upload-hidden{
	display:none;
}

#chgImgPreview{
	display:none;	
}

.pwChange{
	display:none;
}

.Label{
	display: inline-block;
    min-width: 165px;
    line-height: 32px;
}

.EmailChange{
	display: none;
}

.phoneChange{
	display: none;
}

.addrChange{
	display: none;
}
</style>
</head>

<body>
	<!-- 회원 정보 테이블  -->
	<table class="table">
		<thead>
			<tr>
				<th style="border:none;">deliver 회원 정보 <span>필수</span></th>
			<tr>
		</thead>
		<tbody>
			<tr>
				<td>프로필 사진</td>
				<td>
					<div>
						<img id="dlvr_img" name="dlvr_img" src="${image_url}" alt="프로필 사진" style="width: 80px; height: 80px;">
						<img id="chgImgPreview" src="#" alt="변경한 프로필 사진" style="width: 80px; height: 80px;"/>
						<p>회원님을 나타내는 사진을 등록해 주세요.<br> 등록된 사진은 회원님의 게시물이나 댓글들에 사용됩니다.</p>
					</div>
					<div class="imgChange">
						<form role="form" action="/deliver/imgChange" method="POST" enctype="multipart/form-data" id="frmImgChange">
							<input type="file" class="upload-hidden" id="file-upload" name="chgImg" accept="image/, .jpg, .png, .gif">
							<input type="hidden" value="${sessionScope.deliverVo.dlvr_img }" name="orgImg"><!-- 기존 프사  -->
						</form>
							<button type="button" class="btn btn-secondary" id="upload-click"> 사진 선택</button>
							<button type="button" class="btn btn-secondary" > 기본 이미지로 변경 </button>
					</div>
				</td>
				<td>	
					<button type="button" class="btn btn-secondary" id="btnChgImg">사진변경</button>
					<button type="button" class="btn btn-secondary imgChange" id="btnChgImg_cancel">취소</button>
					<button type="button" class="btn btn-secondary imgChange" id="btnChgImg_ok">완료</button>
					
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${sessionScope.deliverVo.dlvr_id}</td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td class="pwHide">
					<div >
						<input type="password" value="${sessionScope.deliverVo.dlvr_pw}" style="border: none; cursor: default;" readonly />
					</div>
				</td>
				<td class="pwChange">
					<form id="frmPw" action="/deliver/pwChange" method="post">
						<div>
							<label class="pw Label"> 현재 비밀번호</label>
							<input type="password" id="dlvr_pw" name="dlvr_pw">
						</div>
						<div>
							<label class="pw Label"> 새 비밀번호</label>
							<input type="password" id="chg_pw" name="chg_pw">
						</div>
						<div>
							<label class="pw Label"> 새 비밀번호 확인</label>
							<input type="password" id="chg_pw2">
						</div>
					<button type="button" class="btn btn-secondary pwChange" id="btnChgPw_cancel">취소</button>
					<button type="button" class="btn btn-secondary pwChange" id="btnChgPw_ok">완료</button>
					</form>
				</td>
				<td> 
					<button type="button" class="btn btn-secondary pwHide" id="btnChgPw">비밀번호 변경</button>
				</td>
				
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<div>
						${sessionScope.deliverVo.dlvr_name}
					</div>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td class="EmaileHide">
					<div>
						${sessionScope.deliverVo.dlvr_email}
					</div>
				</td>
				<td class="EmailChange">
					<div>
						<form id="frmEmail" action="/deliver/emailChange" method="Post">
							<label class="email Label">수정 이메일 </label>
							<input type="email" id="chg_email" name="chg_email">
							<br/>
							<button type="button" class="btn btn-secondary" id="btnChgEmail_cancel">취소</button>
							<button type="submit" class="btn btn-secondary" id="btnChgEmail_ok">완료</button>
						</form>
					</div>
				</td>
				<td>
					<button type="button" class="btn btn-secondary chgEmail">이메일 변경</button>
				</td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td class="phoneHide">
					<div>
						${sessionScope.deliverVo.dlvr_phone}
					</div>
				</td>
				<td class="phoneChange">
					<div>
						<form id="frmPhone" action="/deliver/phoneChange" method="post">
							<label class="phone Label">수정 전화번호</label>
							<input type="tel" id="chg_phone" name="chg_phone">
							<br/>
							<button type="button" class="btn btn-secondary" id="btnChgPhone_cancel">취소</button>
							<button type="submit" class="btn btn-secondary" id="btnChgPhone_ok">완료</button>
						</form>
					</div>
				</td>
				<td>	
					<button type="button" class="btn btn-secondary" id="btnChgPhone">휴대전화 변경</button>
				</td>
			</tr>
			 <tr>
				<td>주소</td>
				<td class="addrHide"> 
					<div>
						${sessionScope.deliverVo.dlvr_addr}
					</div>
				</td>
				<td class="addrChange">
					<form action="/deliver/addrChange" method="POST" id="frmAddr">
						<div>
							<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호">
							<input type="button" class="btn btn-info" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" id="btnAddr"><br>
							<input type="text" class="form-control dlvr_addr addr1" id="sample4_roadAddress" placeholder="도로명주소">
							<input type="text"class="form-control "  id="sample4_jibunAddress" placeholder="지번주소">
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" class="form-control addr3" id="sample4_detailAddress" placeholder="상세주소(필수)" required>
							<input type="text" class="form-control addr2"  id="sample4_extraAddress" placeholder="참고항목">
							<input type="hidden" id="chg_addr" name="chg_addr">
						</div>
						<br/>
						<button type="button" class="btn btn-secondary" id="btnChgAddr_cancel">취소</button>
						<button type="submit" class="btn btn-secondary" id="btnChgAddr_ok">완료</button>
					</form>
				</td>
				<td>
					<button type="button" class="btn btn-secondary" id="btnChgAddr">주소 변경</button>
				</td>
			</tr>
		</tbody>
	</table>
</body>

<script>
$(function() {
	//메세지
	var imgChangeResult = "${imgChangeResult}";
	if(imgChangeResult == "success") {
		alert("프로필 사진이 변경 되었습니다.");
	}
	
	var pwChangeResult = "${pwChangeResult}";
	if(pwChangeResult == "success") {
		alert("비밀번호가 변경되었습니다.");
	}
	
	var phoneChangeResult = "${phoneChangeResult}";
	if(phoneChangeResult == "success") {
		alert("전화번호가 변경되었습니다.");
	}
	
	var emailChangeResult = "${emailChangeResult}";
	if(emailChangeResult == "success") {
		alert("이메일이 변경되었습니다.");
	}
	
	var addrChangeResult = "${addrChangeResult}";
	if(addrChangeResult == "success") {
		alert("주소가 변경 되었습니다.")
	}
	
	//<프로필 사진 변경>
	// 사진 변경 버튼
	$("#btnChgImg").click(function() {
		$(this).hide();
		$(".imgChange").show();
	});
	
	// 사진변경 - 취소 버튼
	$("#btnChgImg_cancel").click(function() {
		$(this).hide();
		$(".imgChange").hide();
		$("#btnChgImg").show();
		$("#chgImgPreview").hide();
		$("#dlvr_img").show();
	});
	
	// 사진변경 - 사진 선택 버튼 -> input file 실행
	$("#upload-click").click(function() {
		$("#file-upload").trigger("click")
	});
	
	// 사진변경 - 실행된 input file에서 이미지를 선택 => 미리보기 이미지 띄우기
	$("#file-upload").on("change" , function() {
		readURL(this);
		$("#dlvr_img").hide();
		$("#chgImgPreview").show();
	});
	
	// 사진 변경 form 전송 
	$("#btnChgImg_ok").click(function(e){
		e.preventDefault();
		$("#frmImgChange").submit();
	});
	
	//<비밀번호 변경>
	// 비밀번호 변경 버튼 클릭
	$("#btnChgPw").click(function(){
		$(".pwHide").hide();
		$(".pwChange").show();
	});
	
	// 비밀번호 변경 - 취소버튼 클릭
	$("#btnChgPw_cancel").click(function(){
		$(".pwChange").hide();
		$(".pwHide").show();
	});
	
	// 비밀번호 변경 - 완료버튼 클릭 
	$("#btnChgPw_ok").click(function(){
		//비밀번호 AJAX 확인하기
		var dlvr_pw = $("#dlvr_pw").val();
		console.log("dlvr_pw : " + dlvr_pw);
		
		var url = "/deliver/pwCheck";
		var sendData = {
				"dlvr_pw"	:	dlvr_pw				
		};
		$.post(url,sendData,function(result){
			//console.log("deliver info 비번확인 result******* : " + result);
			// 현재 비밀번호가 => 일치 true / 불일치 false
			if(result == "true") {
				var chg_pw = $("#chg_pw").val();
				var chg_pw2 = $("#chg_pw2").val();
				console.log("chg_pw, chg_pw2 : " + chg_pw + "  ///  " +chg_pw2)
				
				if(chg_pw != null && chg_pw != ""){
					for(var i = 0; i < chg_pw.length; i++) {
						var char_chg_pw = chg_pw.charCodeAt(i);
						if( 7 < chg_pw.length && chg_pw.length < 17) {
							if((47 < char_chg_pw && char_chg_pw < 58  ) || (64 < char_chg_pw && char_chg_pw < 91) || (96 < char_chg_pw && char_chg_pw < 123)) {
								if(chg_pw == chg_pw2) {
									$("#frmPw").submit();
								} else {
									alert("새 비밀번호가 일치하지 않습니다.");
									$("#chg_pw").val("").focus();
									$("#chg_pw2").val("");
									return;
								}
							} else {
								alert("8~16자의 영문 대소문자와 숫자만 입력가능 합니다.");
								$("#chg_pw").val("").focus();
								$("#chg_pw2").val("");
								return;
							}// 영어 대소문자, 숫자  else
						} else {
							alert("8~16자의 영문 대소문자와 숫자만 입력가능 합니다.");
							$("#chg_pw").val("").focus();
							$("#chg_pw2").val("");
							return;
						}
					} //for
				} else if(chg_pw == null || chg_pw == "") {
					alert("새 비밀번호를 입력해주세요.");
					$("#chg_pw").focus();
					return;
				}
				
			} else {
				alert("현재 비밀번호를 다시 입력해주세요.");
				$("#dlvr_pw").val("").focus();
			}
				
		});// post
	});
	
	//<이메일 변경>
	// 이메일 변경 버튼
	$(".chgEmail").click(function(){
		$(".EmaileHide").hide();
		$(this).hide();
		$(".EmailChange").show();
	});
	// 이메일 변경 - 취소 버튼
		$("#btnChgEmail_cancel").click(function(){
			$(".EmaileHide").show();
			$(".chgEmail").show();
			$(".EmailChange").hide();
		});
	//이메일 변경 - 완료 버튼 
	$("#btnChgEmail_ok").click(function(e) {
		e.preventDefault();
		var chg_email = $("#chg_email").val();
		if(chg_email != null && chg_email != "") {
			$("#frmEmail").submit();
		} else {
			alert("이메일을 입력해주세요");
			$("#chg_email").focus();
		}
		
	});
	//휴대전화 변경 버튼
	$("#btnChgPhone").click(function(){
		$(".phoneChange").show();
		$(this).hide();
		$(".phoneHide").hide();
	});
	
	//휴대전화 변경 - 취소버튼
	$("#btnChgPhone_cancel").click(function(){
		$(".phoneChange").hide();
		$("#btnChgPhone").show();
		$(".phoneHide").show();
	});
	//휴대전화 변경 - 완료버튼
	$("#btnChgPhone_ok").click(function(e){
		e.preventDefault();
		var chg_phone = $("#chg_phone").val();
		console.log("chg_phone : " + chg_phone);
		
		if(chg_phone != null && chg_phone != "") {
			for(var i = 0; i < chg_phone.length ; i++) {
				var char_chg_phone = chg_phone.charCodeAt(i);
				if(9 < chg_phone.length && chg_phone.length < 17) {
					if( 47< char_chg_phone && char_chg_phone < 58) {
						$("#frmPhone").submit();
					} else {
						alert("10~16자로 숫자만 입력해주세요");
						$("#chg_phone").val("").focus();
						return;
					}
				} else {
					alert("10~16자로 숫자만 입력해주세요");
					$("#chg_phone").val("").focus();
					return;
				}
			} // for
		} else {
			alert("휴대전화 번호를 입력해 주세요.");
			$("#chg_phone").focus();
			return;
		}
	});
	
	// 주소 변경 버튼 클릭
	$("#btnChgAddr").click(function(){
		$(".addrChange").show();
		$(this).hide();
		$(".addrHide").hide();
	});
	
	// 주소 변경 - 취소 버튼
	$("#btnChgAddr_cancel").click(function(){
		$(".addrChange").hide();
		$("#btnChgAddr").show();
		$(".addrHide").show();
	});
	
	//주소 변경 - 완료 버튼
	$("#btnChgAddr_ok").click(function(e){
		e.preventDefault();
		var road1 = $("#sample4_roadAddress").val();
		var road2 = $("#sample4_extraAddress").val();
		var road3 = $("#sample4_detailAddress").val();
		
		// 상세주소가 없는 경우 return
		if(road3.trim() == null || road3.trim() == "") {
			alert("상세주소를 입력해 주세요");
			$("#sample4_detailAddress").focus();
			return;
		} else {
			if(road2 == null || road2 == "") {
				$("#chg_addr").val(road1 + road3);
				$("#frmAddr").submit();
			} else {
				$("#chg_addr").val(road1 + road2 + " " + road3);
				$("#frmAddr").submit();
			}
		}
	});
}); // 핸들러

// 바꿀 프로필 사진 미리 보여주기
function readURL(input) {
    if (input.files && input.files[0]) {
    	var reader = new FileReader();
		reader.onload = function (e) {
          $('#chgImgPreview').attr('src', e.target.result);
       }
		reader.readAs
		reader.readAsDataURL(input.files[0]);
       	console.log("input.files[0] : " + input.files[0]);
    }
}

//<다음 주소 JS> 
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
  new daum.Postcode({
      oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
          // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var roadAddr = data.roadAddress; // 도로명 주소 변수
          var extraRoadAddr = ''; // 참고 항목 변수
          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
              extraRoadAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if(data.buildingName !== '' && data.apartment === 'Y'){
             extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if(extraRoadAddr !== ''){
              extraRoadAddr = ' (' + extraRoadAddr + ')';
          }
          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('sample4_postcode').value = data.zonecode;
          document.getElementById("sample4_roadAddress").value = roadAddr;
          document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
          // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
          if(roadAddr !== ''){
              document.getElementById("sample4_extraAddress").value = extraRoadAddr;
          } else {
              document.getElementById("sample4_extraAddress").value = '';
          }
          var guideTextBox = document.getElementById("guide");
          // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
          if(data.autoRoadAddress) {
              var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
              guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
              guideTextBox.style.display = 'block';
          } else if(data.autoJibunAddress) {
              var expJibunAddr = data.autoJibunAddress;
              guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
              guideTextBox.style.display = 'block';
          } else {
              guideTextBox.innerHTML = '';
              guideTextBox.style.display = 'none';
          }
		var detailAddr = $("#sample4_detailAddress").val();
		if(detailAddr == null || detailAddr == "") {
			$("#sample4_detailAddress").focus();
		}
      }
  }).open();
}
</script>
</html>