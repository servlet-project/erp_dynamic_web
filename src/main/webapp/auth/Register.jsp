<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" 	uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" 	uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
    <title>회원 가입</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .form-container { width: 400px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 5px; }
        .form-container input, .form-container select { width: 100%; padding: 10px; margin: 5px 0; }
        .form-container button { width: 100%; padding: 10px; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer; }
        .form-container button:hover { background-color: #45a049; }
    </style>
</head>
<body>
    <h2 style="text-align: center;">회원 가입</h2>
    <div class="form-container">
        <form id="registerForm">
            <label for="userId">아이디</label>
            <input type="text" id="userId" name="userId" required />

            <label for="userPassword">비밀번호</label>
            <input type="password" id="userPassword" name="userPassword" required />

            <label for="email">이메일</label>
            <input type="email" id="email" name="email" required />

            <label for="address">주소</label>
            <input type="text" id="address" name="address" required />

            <label for="phoneNumber">전화번호</label>
            <input type="text" id="phoneNumber" name="phoneNumber" required />

            <label for="userName">이름</label>
            <input type="text" id="userName" name="userName" required />

            <label for="gender">성별</label>
            <select id="gender" name="gender" required>
                <option value="0">남성</option>
                <option value="1">여성</option>
            </select>

            <label for="birth">생일</label>
            <input type="date" id="birth" name="birth" required />

            <button type="button" id="submitBtn">가입하기</button>
        </form>
    </div>

    <script>
	    $( document ).ready(function() {
	    	 $("#submitBtn").click(function() {
	    		 var formData = {
	                     userId: $("#userId").val(),
	                     userPassword: $("#userPassword").val(),
	                     email: $("#email").val(),
	                     address: $("#address").val(),
	                     phoneNumber: $("#phoneNumber").val(),
	                     userName: $("#userName").val(),
	                     gender: $("#gender").val(),  // gender는 숫자로 0 또는 1
	                     birth: $("#birth").val()
	                 };
	    		 
	    		 $.ajax({
	                 url: 'register',  // 서버에서 처리할 URL
	                 type: 'POST',
	                 contentType: 'application/json',
	                 data: JSON.stringify({ data: formData }),  // data 필드 안에 formData 객체를 JSON으로 보냄
	                 success: function(response) {
	                     alert("회원 가입이 성공적으로 완료되었습니다.");
	                     window.location.href = "register-success.jsp";  // 성공 후 리디렉션 (예시)
	                 },
	                 error: function(xhr, status, error) {
	                     alert("회원 가입에 실패했습니다: " + error);
	                 }
	             });
	    	 })
		});
    </script>
</body>
</html>