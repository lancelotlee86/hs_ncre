<% 
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
If len(Session("FirstTimeToPage")) > 0 then 
' 用户已经访问过当前页面，现在是再次返回访问。 
' 清除会话变量，将用户重定向到登录页面。 
Session("FirstTimeToPage") = "" 
Response.Redirect "logout.asp" 
Response.End 
End If 
' 如果程序运行到这里，说明用户能够查看当前页面 
' 以下开始创建表单 
%> 
<HTML><HEAD><TITLE>全国计算机等级考试网上报名系统-华北水利水电学院考点</TITLE>
<SCRIPT language=javascript>
function click() 
{if (event.button==2)
{
alert('欢迎来参加网上报名。')
}
}
document.onmousedown=click
</SCRIPT>

<META http-equiv=Content-Language content=zh-cn>
<STYLE>
A:link {
	TEXT-DECORATION: none;
	color: blue;
}
A:visited {
	TEXT-DECORATION: none;
	color: blue;
	}
A:active {
	COLOR: #FF0000; TEXT-DECORATION: none
}
A {
	TEXT-TRANSFORM: none;
	TEXT-DECORATION: none;
	font-size: 12pt; line-height:16pt
}
A:hover {
	TEXT-DECORATION: none
}
.s1 {
	FONT-SIZE: 12px;
	PADDING-TOP: 8px;
}
.s2 {
	FONT-SIZE: 12pt}
.style2 {font-size: 14}
body {
	margin-top: 2px;background-color: #F0F0F0;
}
.atd    {font-size: 12pt; line-height: 18pt  }
td{font-size:9pt;line-height:12pt}
.STYLE3 {FONT-SIZE: 12px;  }
.STYLE4 {FONT-SIZE: 12pt;line-height:18pt}
.style7 { background-color:#f0f0f0； font-size:9pt}
SPAN {}
</STYLE>
<meta http-equiv="Content-Language" content="zh-cn">
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name="Description" content="全国计算机等级考试,网上报名系统">
<meta name="Keywords" content="全国计算机等级考试,网上报名系统">
<META content="Microsoft FrontPage 4.0" name=GENERATOR></HEAD>
<BODY class=s2 vlink="#FFFFFF" >
<!--#include file="../header.html"-->
<DIV align=center><CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=778 border=0>
      <TBODY> 
      <TR>
        <TD width="100%"> 
       <CENTER>
      <DIV align=center>
      <CENTER>
      <TABLE class=s1 cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
                    <TD height=6 colspan="2"></TD>
                    </TR>
        <TR>
                    <TD width="44%" valign="top"> 
                      <div align="right"> 
                        <table class=s2 height=281 cellspacing=0 
            cellpadding=0 width="84%"  border=1>
                          <tbody> 
                          <tr> 
                            <td width="100%" height="281"> 
                              <div align="center">
                                <p><img src="images/jsleft.jpg" width="178" height="146" alt="全国计算机等级考试华北水利水电学院考点"> </div></td>
                          </tr>
                          </tbody>
                        </table>
                      </div>                    </TD>
                    <TD vAlign=top width="56%"> 
                      <TABLE class=s2 height=272 cellSpacing=0 
            cellPadding=0 width="84%"  border=1>
                        <TBODY> 
                        <TR>
                <TD width="100%">
                  <DIV align=center>
                  <CENTER>
                    <DIV align=center>
                      <CENTER>
                        <p align="center"><strong><font color=red size="3">我校所有在校本科生<u>切勿</u>在此报名</font></strong></p>
                        <TABLE class=s1 cellSpacing=0 cellPadding=0 width="90%" 
                  border=0>
                          <TBODY>
						
							
                            <TR>
                              <TD width="100%"><div align="center"><a href="reg.asp"><strong>→<u>录入报名信息请点击此处进入</strong></a></div></TD>
                            </TR>
                          </TBODY>
                        </TABLE>
                      </CENTER>
                    </DIV>
                    <DIV align=center>
                      <CENTER>
                      </CENTER>
                      <p>&nbsp;</p>
                    </DIV>
                    <TABLE class=s1 cellSpacing=0 cellPadding=0 width="90%" 
                  border=0>
                    <TBODY>
                    <TR>
                                    <TD width="100%"><font class=s2 >修改或查看报名信息的考生请从下面登录进入</font></TD>
                                  </TR></TBODY></TABLE>
                  </CENTER></DIV>
                  <DIV align=center>
                  <CENTER>
                  <TABLE cellSpacing=0 cellPadding=0 width="90%" border=0>
                    <TBODY>
                    <TR>
                      <TD width="100%">
                        <HR color=#000000 noShade SIZE=1>                      </TD></TR></TBODY></TABLE></CENTER></DIV>
                  <FORM action=check.asp method=post name="ybmksdl">
                  <DIV align=center>
                  <CENTER>
                                  <TABLE  cellSpacing=0 cellPadding=0 
                  border=0>
                                    <TBODY> 
                                    <TR> 
                                      <TD> <font class="STYLE4">姓&nbsp;&nbsp;&nbsp;&nbsp;名： </FONT><font class="s2">
                                        <input maxlength=20 size=9 name=xm>
                                        </FONT></TD>
                                    </TR>
                                    <TR> 
                                      <TD><FONT class=s2><span class="STYLE4">身份证号：</span>
                                        <INPUT  maxLength=18 size=18 name=sfzh>
                                        </FONT></TD>
                                    </TR>
                                    <TR> 
                                      <TD height=16></TD>
                                    </TR>
                                    <TR> 
                                      <TD> 
                                        <P align=center>
                                          <INPUT  type=submit value=进入查看或修改 name=B1>
                                          &nbsp; 
                                          <INPUT  type=reset value=重新输入 name=B2>
                                        </P>                                      </TD>
                                    </TR>
                                    </TBODY>
                                  </TABLE>
                          </CENTER></DIV></FORM></TD></TR></TBODY></TABLE></TD></TR>
      </TBODY></TABLE>
      </CENTER></DIV>
      <TABLE class=s2 cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="100%">
                 </TD></TR></TBODY></TABLE></CENTER></TD></TR></TBODY></TABLE>
<!--#include file="../footer.html"-->
    </center>
</DIV>
</BODY></HTML>
