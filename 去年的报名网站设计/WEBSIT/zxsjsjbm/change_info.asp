<!--#include file="conn.asp"-->

<%
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 

If  request.cookies("member")="" or session("userid")="" Then
Response.redirect"index.asp"
End If

dim userid
userid=session("userid")
if userid="''" or  Instr(userid,"'")>0  or   Instr(userid,"%")>0 then
response.write("非法参数")
response.end
end if

dim rs,sql
set rs=Server.CreateObject("Adodb.Recordset")
sql="select * from t_bm where id='"&userid&"'"
rs.open sql,conn,1,1
%>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<title>修改记录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript">
<!--
if (parent.frames.length > 0) {
parent.location.href = location.href;
}
function help(){
window.open("help.htm","","width=440,height=480,top=30,left=180,resizable=no,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no");
}
// --></script>
<script language="JavaScript">
function zdsc()
{
var getsf=document.form2.sfzh.value;
if (getsf.length==15)
{
  document.form2.csrq.value="19"+getsf.substring(6,12);
  document.form2.csrq.focus()
  return false
  }
else if (getsf.length==18)
{
  document.form2.csrq.value=getsf.substring(6,14);
  document.form2.csrq.focus()
  return false
  }
}
</script>
<script language="javascript" src="checkdata.js" type="text/javascript"></script>
<link href="mycss.css" rel="stylesheet" type="text/css">
</head>

<body topmargin="1" leftmargin="0" bgcolor="#ffdd6d">
<!--#include file="header.html"-->
<form name="form2" method="POST"  onSubmit="return Validator.Validate(this,2)"  action="change_info_save.asp">
  <div align="center">
    <table border="0" cellpadding="0" cellspacing="0" width="778" bgcolor="#FFA800" height="421">
      <tr> 
        <td height="55" width="151"> 
          <p align="center"><img src="images/home.gif" width="27" height="25" usemap="#Map" border="0"><map name="Map"><area shape="rect" coords="2,1,47,33" href="logout.asp"></map> 
        </td>
        <td height="421" width="627" bgcolor="#F6F6F6" rowspan="4" valign="top"> 
          <div align="center">
            <table border="0" width="99%" cellspacing="1" height="369">
              <tr>
                <td height="40" colspan="2"><p align=center>修改报名资料，请根据要求谨慎修改，修改后请查看，<span class="STYLE3">**</span>为必填项!</td>
              </tr>
              <tr>
                <td width="29%" height="29" bgcolor="#F0F0F0"><p align="right">姓 名：       </td>
                <td width="68%"><span class="STYLE3">**</span>
                  <input type="text" name="rname" size="20" maxlength="20" class="form" value="<%=rs("xm")%>"  dataType="Chinese" msg="姓名只允许中文">
                <td width="3%" height="29"><div align="center"></div></td>
              </tr>
              <tr>
                <td width="29%" height="28" bgcolor="#F0F0F0"><p align="right">性 别：                </td>
                <td width="68%"><div align="left">
                    <span class="STYLE3">**</span><input type="radio" value="1"  <% if rs("xb")="1" then%>checked<%end if%> name="sex">
                  男&nbsp;
                  <input type="radio" value="2" <% if rs("xb")="2" then%>checked<%end if%> name="sex">
                  女</div>
                <td width="3%" height="28"><div align="center"></div></td>
              </tr>
              <tr>
                 <td width="29%" height="24" bgcolor="#F0F0F0"> 
                  <p align="right"><span class="tdc">民 族</span>： 
                </td>
                <td width="68%">    
				<%dim rs0,sql0
set rs0=Server.CreateObject("Adodb.Recordset")
sql0="select * from tc_mz"
rs0.open sql0,conn,1,1
%>
<span class="STYLE3">**</span><select name="mz" size=1>
<%do while not RS0.eof %>
        <option value="<%=rs0("mz")%>" <%if rs0("mz")=rs("mz") then%> selected <%end if%>><%=rs0("mzmc")%></option>
<%rs0.movenext
loop
rs0.close
set rs0=nothing%>
</select>
              </tr>
              <tr>
                <td height="6" bgcolor="#F0F0F0"><p align="right">身份证号：                </td>
                <td height="6"><span class="STYLE3">**</span><input name="sfzh" type="text"  onBlur="zdsc()" class="form" style="font-family: Arial" id="sfzh" value="<%=rs("sfzh")%>" size="20" maxlength="18" dataType="IdCard" msg="身份证号错误"></td>
                <td height="24">&nbsp;</td>
              </tr>
              <tr>
                <td width="29%" height="24" bgcolor="#F0F0F0"><div align="right">出生日期： </div></td>
                <td><span class="STYLE3">**</span><input type="text" name="csrq" size="8" class="form" style="font-family: Arial" maxlength="8" value="<%=rs("csrq")%>" readonly><font color=blue>&nbsp;&nbsp;*应与身份证上对应</font>
                <td height="24">&nbsp;</td>
              </tr>
              <tr>
                <td width="29%" height="24" bgcolor="#F0F0F0"><p align="right"><span class="tdc">报考级别语言</span>：                </td>
                <td width="68%">
								<%dim rs1,sql1
set rs1=Server.CreateObject("Adodb.Recordset")
sql1="select * from tc_jbyy where kkbj=true"
rs1.open sql1,conn,1,1
%>
<span class="STYLE3">**</span><select name="jbyydm" size=1>
<%do while not RS1.eof %>
        <option value="<%=rs1("jbyydm")%>" <%if rs1("jbyydm")=mid(rs("bmh"),7,2) then%> selected <%end if%>><%=rs1("jbyydm")%>-<%=rs1("jbyy")%></option>
<%rs1.movenext
loop
rs1.close
set rs1=nothing%>
</select>

                <td width="3%" height="24"></td>
              </tr>
              <tr>
                <td width="29%" height="9" bgcolor="#F0F0F0"><p align="right"><span class="tdc">文化程度</span>：                </td>
                <td width="68%">
										<%dim rs2,sql2
set rs2=Server.CreateObject("Adodb.Recordset")
sql2="select * from tc_whcd"
rs2.open sql2,conn,1,1
%>
<span class="STYLE3">**</span><select name="whcd" size=1>
<%do while not RS2.eof %>
        <option value="<%=rs2("whcd")%>" <%if rs2("whcd")=rs("whcd") then%> selected <%end if%>><%=rs2("whcdmc")%></option>
<%rs2.movenext
loop
rs2.close
set rs2=nothing%>
</select>
                <td width="3%" height="9">&nbsp;</td>
              </tr>
              <tr>
                <td height="6" bgcolor="#F0F0F0"><p align="right"><span class="tdc">职业</span>： </td>
                <td height="6">
				<%dim rs3,sql3
set rs3=Server.CreateObject("Adodb.Recordset")
sql3="select * from tc_zy"
rs3.open sql3,conn,1,1
%>
<span class="STYLE3">**</span><select name="zy" size=1>
<%do while not RS3.eof %>
        <option value="<%=rs3("zy")%>" <%if rs3("zy")=rs("zy") then%> selected <%end if%>><%=rs3("zymc")%></option>
<%rs3.movenext
loop
rs3.close
set rs3=nothing%>
</select>
              </tr>
            
           
                <tr>
                <td width="29%" height="6" bgcolor="#F0F0F0"><p align="right"><span class="tdc">保留成绩种类</span>： </td>
                <td width="68%" height="6">
				<%dim rs4,sql4
set rs4=Server.CreateObject("Adodb.Recordset")
sql4="select * from tc_blcj"
rs4.open sql4,conn,1,1
%>
<span class="STYLE3">**</span><select name="blcjzl" size=1>
<%do while not RS4.eof %>
        <option value="<%=rs4("blcj")%>" <%if rs4("blcj")=rs("blcjzl") then%> selected <%end if%>><%=rs4("blcjmc")%></option>
<%rs4.movenext
loop
rs4.close
set rs4=nothing%>
</select>
                </tr>  
              <tr>
                <td width="29%" height="6" bgcolor="#F0F0F0"><p align="right"><span class="tdc">原准考证号</span>： </td>
                <td width="68%" height="6"><span class="STYLE3">**</span><input type="text" name="yzkzh" size="17" maxlength="16" class="form" value="<%=rs("yzkzh")%>"  style="ime-mode: disabled;">
                补考考生必填,非补考考生勿填.</td>
              </tr> 
			  <tr>
                <td width="29%" height="6" bgcolor="#F0F0F0"><p align="right">学号或联系地址：                </td>
                <td width="68%" height="6"><span class="STYLE3">**</span><input type="text" name="addr1" size="20" maxlength="20" class="form" value="<%=rs("lxdz")%>"  dataType="LimitB" min="9" max="20"  msg="学号应为9位，外校考生地址长度必须在[9,20]个字节之内，一个汉字2个字节"> （本校全日制本科学生是填写9位学号，其他报考人员填写实际联系地址，字数以4-5字为宜）               </td>
              </tr>
           <tr>
                <td width="29%" height="6" bgcolor="#F0F0F0"><p align="right">联系电话：                </td>
                <td width="68%" height="6"><input type="text" name="tel1" size="20" maxlength="20" class="form" value="<%=rs("lxdh")%>"  style="ime-mode: disabled;">                </td>
              </tr>
            
              <tr>
                <td height="1" colspan="2"><p align="center">
                    <input type="submit" value="提交信息" name="B3" class="form">
                  &nbsp;
                  <input type="reset" value="重新来过" name="B3" class="form">
                </td>
              </tr>
            </table>
        </div>        </td>
      </tr>
      <center>
        <tr> 
          <td height="18" width="151" bgcolor="#FFCD71"> 
            <p align="left">当前用户：<%=rs("xm")%>
		  <br>报名号：<%=rs("bmh")%>          </td>
        </tr><%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
        <tr> 
          <td height="17" width="151">　</td>
        </tr>
      </center>
      <tr> 
        <td height="331" width="151" valign="top"> 
          <div align="center"> 
            <table border="0" cellpadding="3" width="100%" height="157">
              <tr> 
                <td width="100%" height="77" valign="top"> 
                  <p align="center">
                 【<a href="view.asp" class="1">查看报名</a>】<p align="center">
                 【<a href="javascript:help()" class="1">帮助信息</a>】<p align="center">
                【<a href="logout.asp" class="1">退出登陆</a>】</td>
              </tr>
            </table>
        </div>        </td>
      </tr>
    </table>
</div>
</form>
<!--#include file="footer.html"-->
</body>

</html>
