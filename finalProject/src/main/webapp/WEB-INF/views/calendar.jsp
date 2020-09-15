<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Calendar cal = Calendar.getInstance();
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	String inputDate = request.getParameter("inputDate");

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
	if (strYear != null) {
		year = Integer.parseInt(strYear);
		month = Integer.parseInt(strMonth);
	} else {
	}
	//년도/월 셋팅
	cal.set(year, month, 1);
	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0;
	//오늘 날짜 저장.

	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
	if (inputDate == null) {
		String sUseDate = cal.get(Calendar.YEAR) + "-";
		sUseDate += Integer.toString(month + 1).length() == 1
				? "0" + Integer.toString(month + 1)
				: Integer.toString(month + 1);
		sUseDate += Integer.toString(date).length() == 1
				? "-0" + Integer.toString(date)
				: "-" + Integer.toString(date);
		inputDate = sUseDate;
	}
	int calcMonth = month + 1;
	int Max = 30;
	if (calcMonth == 1 || calcMonth == 3 || calcMonth == 5 || calcMonth == 7 || calcMonth == 8
			|| calcMonth == 10 || calcMonth == 12)
		Max = 31;
	else if (calcMonth == 2) {
		if (year % 4 == 0)
			Max = 29;
		else
			Max = 28;
	} else {
		Max = 30;
	}
	char[] eatten = request.getParameter("eatten").toCharArray();
%>

<html lang="ko">
<HEAD>
<TITLE>캘린더</TITLE>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javaScript" language="javascript"> 
       </script>
<style TYPE="text/css">
body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin: "0 auto";
}

td {
	font-family: "맑은고딕";
	font-size: 9pt;
	color: #595959;
}

th {
	font-family: "맑은고딕";
	font-size: 9pt;
	color: #000000;
}

select {
	font-family: "맑은고딕";
	font-size: 9pt;
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

A:link {
	font-size: 9pt;
	font-family: "맑은고딕";
	color: #000000;
	text-decoration: none;
}

A:visited {
	font-size: 9pt;
	font-family: "맑은고딕";
	color: #000000;
	text-decoration: none;
}

A:active {
	font-size: 9pt;
	font-family: "맑은고딕";
	color: red;
	text-decoration: none;
}

A:hover {
	font-size: 9pt;
	font-family: "맑은고딕";
	color: red;
	text-decoration: none;
}
</style>
</HEAD>
<BODY>
<!-- 				여기에서 색깔 입히자 -->
					<c:choose>
						<c:when test="${login.auth eq '1' }">
							<c:set var="myBackColor" value="#E1B643" />
							<c:set var="myColor" value="#E09C43" />
						</c:when>
						<c:when test="${login.primaryop eq '유아'}">
							<c:set var="myBackColor" value="#f0bf59" />
							<c:set var="myColor" value="#F0A759" />
						</c:when>
						<c:when test="${login.primaryop eq '임산부'}">
							<c:set var="myBackColor" value="#FF6F61" />
							<c:set var="myColor" value="#FFA7A7" />
						</c:when>
						<c:when test="${login.primaryop eq '고혈압'}">
							<c:set var="myBackColor" value="#9C1B31" />
							<c:set var="myColor" value="#B5315D" />
						</c:when>
						<c:when test="${login.primaryop eq '당뇨'}">
							<c:set var="myBackColor" value="#65488f" />
							<c:set var="myColor" value="#8670a6" />
						</c:when>
						<c:when test="${login.primaryop eq '비만'}">
							<c:set var="myBackColor" value="#8CA4CF" />
							<c:set var="myColor" value="#8CAFCF" />
						</c:when>
						<c:when test="${login.primaryop eq '학생'}">
							<c:set var="myBackColor" value="#88b04b" />
							<c:set var="myColor" value="#99B04C" />
						</c:when>
						<c:when test="${login.primaryop eq '남자'}">
							<c:set var="myBackColor" value="#169c78" />
							<c:set var="myColor" value="#169C62" />
						</c:when>
						<c:when test="${login.primaryop eq '여자'}">
							<c:set var="myBackColor" value="#b565a7" />
							<c:set var="myColor" value="#B565B5" />
						</c:when>
					</c:choose>
	<form name="calendarFrm" id="calendarFrm" action="" method="post">
		<DIV id="content" style="width: 500px; margin: 0 auto">
			<table width="100%" border="0" cellspacing="1" cellpadding="1">
				<tr>
					<td align="right"><input type="button"
						onclick="javascript:location.href='<c:url value='/myInfo.do' />'"
						value="오늘" /></td>
				</tr>
			</table>
			<!--날짜 네비게이션  -->
			<table width="100%" border="0" cellspacing="1" cellpadding="1"
				id="KOO" bgcolor="${myBackColor }" style="border: 1px solid ${myColor}">
				<tr>
					

					<td height="60" id="_here" style="background-color: ${myBackColor}; color:${myColor } ">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="10"></td>
							</tr>
							<tr>
								<td align="center"><h3><a
									href="/ssafyvue/myInfo.do?inputDate=<%=year - 1%>-<%=month + 1%>-01"
									target="_self"> <b>◀◀</b> <!-- 이전해 -->
								</a> <%
 	if (month > 0) {
 %> <a
									href="/ssafyvue/myInfo.do?inputDate=<%=year%>-<%=month - 1 + 1%>-01"
									target="_self"> <b>◁</b> <!-- 이전달 -->
								</a> <%
 	} else if (month == 0) {
 %> <a href="/ssafyvue/myInfo.do?inputDate=<%=year - 1%>-<%=11%>-01"
									target="_self"> <b>◁</b> <!-- 이전달 -->
								</a> <%
 	} else {
 %> <b>&lt;</b> <%
 	}
 %> &nbsp;&nbsp;<b><%=year%>년 <%=month + 1%>월</b>&nbsp;&nbsp; <%
 	if (month < 11) {
 %> <a
									href="/ssafyvue/myInfo.do?inputDate=<%=year%>-<%=month + 1 + 1%>-01"
									target="_self"> <!-- 다음달 --> <b>▷</b>

								</a> <%
 	} else if (month == 11) {
 %> <a href="/ssafyvue/myInfo.do?inputDate=<%=year + 1%>-<%=0 + 1%>-01"
									target="_self"> <b>▷</b> <!-- 이전달 -->
								</a> <%
 	} else {
 %> <b>&gt;</b> <%
 	}
 %> <a
									href="/ssafyvue/myInfo.do?inputDate=<%=year + 1%>-<%=month + 1%>-01"
									target="_self"> <!-- 다음해 --> <b>▶▶</b>
								</a></h3></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br>
			<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
				<THEAD>
					<TR bgcolor="${myBackColor }">
						<TD width='100px'>
							<DIV align="center">
								<font color="red"><b>일</b></font>
							</DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center" style="color: black"><b>월</b></DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center" style="color: black"><b>화</b></DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center" style="color:black"><b>수</b></DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center" style="color:black"><b>목</b></DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center" style="color:black"><b>금</b></DIV>
						</TD>
						<TD width='100px'>
							<DIV align="center">
								<font color="#529dbc"><b>토</b></font>
							</DIV>
						</TD>
					</TR>
				</THEAD>
				<TBODY>
					<TR>
						<%
							//처음 빈공란 표시
							for (int index = 1; index < start; index++) {
								out.println("<TD >&nbsp;</TD>");
								newLine++;
							}
							for (int index = 1; index <= endDay; index++) {
								String color = "";
								if (newLine == 0) {
									color = "RED";
								} else if (newLine == 6) {
									color = "#529dbc";
								} else {
									color = "BLACK";
								}
								;

								String sUseDate = Integer.toString(year) + "-";
								sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
										: Integer.toString(month + 1);
								sUseDate += Integer.toString(index).length() == 1 ? "-0" + Integer.toString(index)
										: "-" + Integer.toString(index);
								int iUseDate = Integer.parseInt(sUseDate.replace("-", ""));
								String backColor = "#EFEFEF";
								if (sUseDate.equals(inputDate)) {
									backColor = "#c9c9c9";
								}
								out.println("<TD valign='top' align='left' height='92px' bgcolor='" + backColor + "' nowrap>");
						%>
						<font style="font-size: 25px;" color='<%=color%>'> &nbsp;<%=index%>
						</font>
						<%
							out.println("<BR>"); //여기에 함수를 만들어서 붙여야해 ! ! ! ! ! !
								if (eatten[index] == 'Y')
									out.println("<br/><a href='/ssafyvue/myInfo.do?inputDate=" + sUseDate + "'>" + "&nbsp;&nbsp;[섭취 내역]"
											+ "</a>");
								out.println("<BR>");
								//기능 제거 
								out.println("</TD>");
								newLine++;
								if (newLine == 7) {
									out.println("</TR>");
									if (index <= endDay) {
										out.println("<TR>");
									}
									newLine = 0;
								}
							}
							//마지막 공란 LOOP
							while (newLine > 0 && newLine < 7) {
								out.println("<TD>&nbsp;</TD>");
								newLine++;
							}
						%>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
	</form>
</BODY>
</HTML>
