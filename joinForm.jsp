<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<script language="javascript">										
										
	function sub(){									
		/* 3 칸으로 입력된 핸드폰번호를 1 개로 연결하기 위한 함수 */								
		a=document.join.m_phone1.value;								
		b=document.join.m_phone2.value;								
		c=document.join.m_phone3.value;								
		d=a+"-"+b+"-"+c;			
		
		document.join.m_phone.value= d;								
										
		/* 2 칸으로 입력된 이메일을 1 개로 연결하기 위한 함수 */
	    e=document.join.m_email1.value;								
		f=document.join.m_email2.value;	
	    g=e+"@"+f;		
	    
		document.join.m_email.value= g;	
		
		/* 3 칸으로 입력된 생년월일을 1 개로 연결하기 위한 함수 */
		h=document.join.m_birth1.value;								
		i=document.join.m_birth2.value;								
		j=document.join.m_birth3.value;								
		k=h+i+j;			
		
		document.join.m_birth.value= k;	
									
		return true;								
		}								
	
</script>
						
</head>									
<body>									
										
	<h1>회원 가입</h1>									
	<br>										
	<br>										
<form action="join.do" name="join"  method="post" onsubmit="sub()">										
										
	<fieldset>									
	<legend>가입 양식</legend>									
		<table>								
		<colgroup>								
			<col width=20%>							
			<col width=50%>							
		</colgroup>			
								
		<tr>								
		<th>아이디</th> 			
										
		<td><input type="text" name="m_id" placeholder="영문+숫자 최대 16자리" size="16" maxlength="16" value="${param.m_id}">											
				<c:if test="${errors.m_id}"> ID를 입력하세요.</c:if>						
				<c:if test="${errors.duplicateId}"> 이미 사용중인 아이디입니다.</c:if>						
		</td>								
		</tr>								
										
		<tr>								
		<th>비밀번호</th>								
										
		<td><input type="password" name="m_pw" placeholder="영문+숫자 최대 16자리" size="16" maxlength="16">								
				<c:if test="${errors.m_pw}"> 비밀번호를 입력하세요.</c:if>						
		</td>								
		</tr>								
										
		<tr>								
		<th>비밀번호 확인</th>								
										
		<td><input type="password" name="confirmPassword" placeholder="영문+숫자 최대 16자리" size="16" maxlength="16">								
				<c:if test="${errors.confrimPassword}"> 비밀번호를 한번 더 입력하세요.</c:if>						
				<c:if test="${errors.notMatch}"> 비밀번호가 일치하지 않습니다.</c:if>						
		</td>								
		</tr>								
										
		<%-- <tr>								
		<th>생년월일1</th>								
		<td>								
		<input type="text" name="m_birth" placeholder="예시) 19970505" size="16" maxlength="8" value="${param.m_birth}"/>								
							
				<c:if test="${errors.m_birth}"> 생년월일8자리 입력하세요.</c:if>						
		</td>								
		</tr> --%>
		
		<tr>
        <th>생년월일2</th>
        <td><input type="hidden" name="m_birth" value="${param.m_birth}"/>	
        
                <input type="text" name="m_birth1" placeholder="예) 1997년생 > 1997" size="16" maxlength="4"  />
                <select name="m_birth2" >
                    <option value=01>1월</option>
                    <option value=02>2월</option>
                    <option value=03>3월</option>
                    <option value=04>4월</option>
                    <option value=05>5월</option>
                    <option value=06>6월</option>
                    <option value=07>7월</option>
                    <option value=08>8월</option>
                    <option value=09>9월</option>
                    <option value=10>10월</option>
                    <option value=11>11월</option>
                    <option value=12>12월</option>
                </select>
                <select name="m_birth3" >
                    <option value=01>1일</option>
                    <option value=02>2일</option>
                    <option value=03>3일</option>
                    <option value=04>4일</option>
                    <option value=05>5일</option>
                    <option value=06>6일</option>
                    <option value=07>7일</option>
                    <option value=08>8일</option>
                    <option value=09>9일</option>
                    <option value=10>10일</option>
                    <option value=11>11일</option>
                    <option value=12>12일</option>
                    <option value=13>13일</option>
                    <option value=14>14일</option>
                    <option value=15>15일</option>
                    <option value=16>16일</option>
                    <option value=17>17일</option>
                    <option value=18>18일</option>
                    <option value=19>19일</option>
                    <option value=20>20일</option>
                    <option value=21>21일</option>
                    <option value=22>22일</option>
                    <option value=23>23일</option>
                    <option value=24>24일</option>
                    <option value=25>25일</option>
                    <option value=26>26일</option>
                    <option value=27>27일</option>
                    <option value=28>28일</option>
                    <option value=29>29일</option>
                    <option value=30>30일</option>
                    <option value=31>31일</option>
                </select>    
            </td> 
        </tr>							
		
		<tr>								
		<th>성별</th>								
										
		<td>	<label>남성<input type="radio" name="m_gender" value="male"      /></label>
		        <label>여성<input type="radio" name="m_gender" value="female"  />	</label>
		          
		</td>								
		</tr>
			
		<tr>								
		<th>이메일</th>								
		<td><input type="hidden" name="m_email" value="${param.m_email}"/>		
		
               <input type="text" name="m_email1" id="str_email01" size="16" maxlength="20"  /> 
				<span>@</span>
				<input type="text" name="m_email2" id="str_email02"  disabled value="gmail.com" size="10" />
				<select name="selectEmail" id="selectEmail">
				     <option value="1" >직접입력</option>
				     <option value="gmail.com" selected>gmail.com</option>
				     <option value="naver.com" >naver.com</option>
				     <option value="hanmail.net">hanmail.net</option>
				     <option value="nate.com">nate.com</option>
				</select>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
// 이메일 입력방식 선택
$('#selectEmail').change(function(){
   $("#selectEmail option:selected").each(function () {
        
        if($(this).val() == '1'){  //직접입력일 경우
             $("#str_email02").val('');                        //값 초기화
             $("#str_email02").attr("disabled",false);    //활성화
        } else{                       //직접입력이 아닐경우
             $("#str_email02").val($(this).text());       //선택값 입력
             $("#str_email02").attr("disabled",true);    //비활성화
        }
   });
});
</script>
        <c:if test="${errors.m_email}"> 이메일 입력하세요.</c:if>						
		</td>								
		</tr>
														
		<tr>								
		<th>핸드폰 번호</th>								
		<td><input type="hidden" name="m_phone" value="${param.m_phone}"/>			
					
				<select name="m_phone1" >						
				<option value="010">010</option>						
				<option value="011">011</option>						
				<option value="016">016</option>	
				<option value="017">017</option>					
				<option value="018">018</option>	
				<option value="019">019</option>				
				</select>
			 - <input type="text" name="m_phone2" size="1" maxlength="4"  />								
			 - <input type="text" name="m_phone3" size="1" maxlength="4"  />						
								
				<c:if test="${errors.m_phone}"> 핸드폰 입력하세요.</c:if>					
		</td>								
		</tr>
									
		</table>															
			<input type="submit" value="가입신청" >								
	</fieldset>
	</form>
</body>
</html>