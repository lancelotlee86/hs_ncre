<!--
'' ============================================================================================
'' 项目名称：查询班级报名情况
'' 项目版本：V1.0
'' 项目描述：按班级查询报名情况
'' 文件名称：t_bm_search.asp
'' 文件描述：信息搜索文件
'' 公司名称：教务处
'' 开发人员：李大侠
'' 创建日期：2010-12-4 16:44:24
'' 修订日期：2010-12-04 04:53:08
'' 版权信息：Copyright (C) 2010

'' 项目升级时需读取以下生成工具的版权信息
'' 生成工具：风越代码生成器 [FireCode Creator]
'' 当前版本：通用版 V3.5
'' 官方网站：http://www.sino8848.com
'' ============================================================================================
-->

<!--#include file="conn.asp"-->
<!--#include file="inc/function.asp"-->

<HTML>
<HEAD>
<TITLE><%=fypSysTitle & " " & currentAspFileName()%></TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=GB2312">
<LINK HREF="css/css.css" REL="stylesheet" TYPE="text/css">
<SCRIPT LANGUAGE="javascript" SRC="js/js.js"></SCRIPT>
</head>

<BODY LEFTMARGIN="0" TOPMARGIN="0">
<FORM ACTION="<%=currentAspFileFullName()%>" METHOD="post" NAME="<%=currentAspFileName()%>_Form" ID="<%=currentAspFileName()%>_Form" STYLE="display:inline"  onsubmit="return checkForm(this)">





<TABLE WIDTH="" BORDER="0" ALIGN="center" CELLPADDING="5" CELLSPACING="1" CLASS="tableStyleSolidLine">

<tr>
    <td nowrap>[id]</td>
    <td width="90%">



        <input type='text' name='id' id='id' maxlength='200' value='<%=Request.Form("id")%>' style='width:100%' class='textBox'>
    </td>
</tr>

<tr>
    <td nowrap>[BMH]</td>
    <td width="90%">



        <input type='text' name='BMH' id='BMH' maxlength='200' value='<%=Request.Form("BMH")%>' style='width:100%' class='textBox'>

















    </td>
</tr>

<tr>
    <td nowrap>[CSRQ]</td>
    <td width="90%">        <input type='text' name='CSRQ' id='CSRQ' maxlength='200' value='<%=Request.Form("CSRQ")%>' style='width:100%' class='textBox'>















    </td>
</tr>

<tr>
    <td nowrap>[BLCJZL]</td>
    <td width="90%">



        <input type='text' name='BLCJZL' id='BLCJZL' maxlength='200' value='<%=Request.Form("BLCJZL")%>' style='width:100%' class='textBox'>

















    </td>
</tr>

<tr>
    <td nowrap>[DGCL]</td>
    <td width="90%">



        <input type='text' name='DGCL' id='DGCL' maxlength='200' value='<%=Request.Form("DGCL")%>' style='width:100%' class='textBox'>

















    </td>
</tr>

<tr>
    <td nowrap>[DGCP]</td>
    <td width="90%">



        <input type='text' name='DGCP' id='DGCP' maxlength='200' value='<%=Request.Form("DGCP")%>' style='width:100%' class='textBox'>

















    </td>
</tr>

<tr>
    <td nowrap>[HAVEXP]</td>
    <td width="90%">



        <input type='text' name='HAVEXP' id='HAVEXP' maxlength='200' value='<%=Request.Form("HAVEXP")%>' style='width:100%' class='textBox'>

















    </td>
</tr>

<tr>
    <td nowrap>[cxcn]</td>
    <td width="90%">



        <input type='text' name='cxcn' id='cxcn' maxlength='200' value='<%=Request.Form("cxcn")%>' style='width:100%' class='textBox'>

















    </td>
</tr>


<TR>
    <TD> </TD>
    <TD>
        <INPUT TYPE="submit" NAME="Submit" VALUE="查找">
        <INPUT TYPE="reset" NAME="Reset" VALUE="重置">
    </TD>
</TR>
</TABLE>



<%
'在排序、翻页时，也需判断搜索条件，不仅在搜索时（submit有值时）才判断
'If Request.Form("Submit") <> "" Then
    Dim errMessage
    errMessage=""

    ' ASP代码检测输入数据正确性

    Dim id
    id = Request.Form("id")
    If Len(id) > 6 Or (Len(id) > 0 And RegExpCheck("[\s\S]*", id) = False) Then errMessage = errMessage & "所输入 [id] 的内容有误：<br>" & id & "<br>长度不能超过6 并且仅允许为不检测<br>"

    Dim BMH
    BMH = Request.Form("BMH")
    If Len(BMH) > 14 Or (Len(BMH) > 0 And RegExpCheck("[\s\S]*", BMH) = False) Then errMessage = errMessage & "所输入 [BMH] 的内容有误：<br>" & BMH & "<br>长度不能超过14 并且仅允许为不检测<br>"

    Dim CSRQ
    CSRQ = Request.Form("CSRQ")
    If Len(CSRQ) > 8 Or (Len(CSRQ) > 0 And RegExpCheck("[\s\S]*", CSRQ) = False) Then errMessage = errMessage & "所输入 [CSRQ] 的内容有误：<br>" & CSRQ & "<br>长度不能超过8 并且仅允许为不检测<br>"

    Dim BLCJZL
    BLCJZL = Request.Form("BLCJZL")
    If Len(BLCJZL) > 1 Or (Len(BLCJZL) > 0 And RegExpCheck("[\s\S]*", BLCJZL) = False) Then errMessage = errMessage & "所输入 [BLCJZL] 的内容有误：<br>" & BLCJZL & "<br>长度不能超过1 并且仅允许为不检测<br>"

    Dim DGCL
    DGCL = Request.Form("DGCL")
    If Len(DGCL) > 2 Or (Len(DGCL) > 0 And RegExpCheck("^[\d]+$", DGCL) = False) Then errMessage = errMessage & "所输入 [DGCL] 的内容有误：<br>" & DGCL & "<br>长度不能超过2 并且仅允许为仅允许整数<br>"

    Dim DGCP
    DGCP = Request.Form("DGCP")
    If Len(DGCP) > 2 Or (Len(DGCP) > 0 And RegExpCheck("^[\d]+$", DGCP) = False) Then errMessage = errMessage & "所输入 [DGCP] 的内容有误：<br>" & DGCP & "<br>长度不能超过2 并且仅允许为仅允许整数<br>"

    Dim HAVEXP
    HAVEXP = Request.Form("HAVEXP")
    If Len(HAVEXP) > 10 Or (Len(HAVEXP) > 0 And RegExpCheck("^[\d]+$", HAVEXP) = False) Then errMessage = errMessage & "所输入 [HAVEXP] 的内容有误：<br>" & HAVEXP & "<br>长度不能超过10 并且仅允许为仅允许整数<br>"

    Dim cxcn
    cxcn = Request.Form("cxcn")
    If Len(cxcn) > 2 Or (Len(cxcn) > 0 And RegExpCheck("[\s\S]*", cxcn) = False) Then errMessage = errMessage & "所输入 [cxcn] 的内容有误：<br>" & cxcn & "<br>长度不能超过2 并且仅允许为不检测<br>"


    If (errMessage <> "") Then
        Call Javascript("showMsg('" & Replace(errMessage, "<br>", "\n\n") & "'); goUrl('-1','')")
        Response.End()
    End If
'End If

Dim sql,Rs
' 每页记录数
Dim maxPerPage
' 总记录数
Dim totalRecord
' 当前页数
Dim currentPage
' 总页数
Dim totalPages
' 排序SQL
Dim strOrderBy
' 当前排序字段
Dim sqlOrderByStr
' 搜索条件的SQL语句
Dim sqlSearch

' 限定页数最小值
currentPage=1
totalRecord=0
totalPages=1

maxPerPage=20
If Request.Form("maxPerPage") <> "" And isNumeric(Request.Form("maxPerPage")) Then
    If Request.Form("maxPerPage") >= 1 Then maxPerPage=CInt(Request.Form("maxPerPage"))
    If Request.Form("maxPerPage") > 40 Then maxPerPage=40
End If

'删除指定记录
If Request.Form("recordID") <> "" And Request.Form("actMod") = "DEL" Then
    Dim arrRecID, strid_sql
    arrRecID = TrimRight(Request.Form("recordID"), ", ")
    arrRecID = Split(arrRecID, ", ")
    For i = 0 To UBound(arrRecID)

        strid_sql = strid_sql & "'" & Split(arrRecID(i), "|||")(0) & "', "
    Next

    strid_sql = TrimRight(strid_sql, ", ")



    sql = "delete from [t_bm] where [id] in(" & strid_sql & ")"
    'Response.Write (sql & "<br>")
    conn.execute (sql)
    Call Javascript("showMsg('成功删除本条记录'); goUrl('" & currentAspFileFullName() & "','')")
End If



'设置搜索条件
sqlSearch = ""


If id <> "" Then sqlSearch = sqlSearch & " And [id] like '%" & id & "%'"




If BMH <> "" Then sqlSearch = sqlSearch & " And [BMH] like '%" & BMH & "%'"




If CSRQ <> "" Then sqlSearch = sqlSearch & " And [CSRQ] like '%" & CSRQ & "%'"




If BLCJZL <> "" Then sqlSearch = sqlSearch & " And [BLCJZL] like '%" & BLCJZL & "%'"





If DGCL <> "" Then sqlSearch = sqlSearch & " And [DGCL] = " & DGCL




If DGCP <> "" Then sqlSearch = sqlSearch & " And [DGCP] = " & DGCP




If HAVEXP <> "" Then sqlSearch = sqlSearch & " And [HAVEXP] = " & HAVEXP



If cxcn <> "" Then sqlSearch = sqlSearch & " And [cxcn] like '%" & cxcn & "%'"




If sqlSearch <> "" Then
    sqlSearch = " where " & mid(sqlSearch, 5)
End If

sql = "select [id], [BMH], [CSRQ], [BLCJZL], [DGCL], [DGCP], [HAVEXP], [cxcn] from [t_bm] " & sqlSearch & strOrderBy
'Response.Write (sql & "<br>")
Set Rs =  Server.CreateObject("ADODB.Recordset")
Rs.Open sql, conn, 1, 1

totalRecord = CInt(Rs.Recordcount)

If totalRecord > 0 Then
    ' 获取、设置合法当前页数，来源：Form QueryString
    If Not IsEmpty(Request.Form("page")) And IsNumeric(Request.Form("page")) Then
        If Request.Form("page") >= 1 Then currentPage=CInt(Request.Form("page"))
    End If
    ' 当前页数，以QueryString为主
    If Not IsEmpty(Request.QueryString("page")) And IsNumeric(Request.QueryString("page")) Then
        If Request.QueryString("page") >= 1 Then currentPage=CInt(Request.QueryString("page"))
    End If

    ' 限定页数最大值，超过实际值，则重新设定
    totalPages = CInt(totalRecord \ maxPerPage)
    If (totalRecord Mod maxPerPage) <> 0 Then totalPages = (totalRecord \ maxPerPage) + 1
    If currentPage > totalPages Then currentPage = totalPages

    ' 指针向后移动N条记录
    Rs.Move (currentPage-1)*maxPerPage
    Dim bookmark
    bookmark=Rs.BookMark
End If

'调用翻页(页眉显示)
Call showPage(currentPage,totalPages,maxPerPage,totalRecord,false)
'调用列表内容
Call showContent()
'调用翻页(页脚显示)
Call showPage(currentPage,totalPages,maxPerPage,totalRecord,true)
%>

<%
'显示列表内容子程序 始--------------------------------------------------
Sub showContent()
%>
    <TABLE WIDTH="100%" BORDER="1" ALIGN="CENTER" CELLPADDING="5" CELLSPACING="1" CLASS="tableStyleSolidLine">
        <TR><TD COLSPAN="100" BGCOLOR="#ffffff" ALIGN="center">[]</TD></TR>
    <%
    ' 调用表头排序
    Call tableTitle()
    %>





    <%
    If (totalRecord>0) Then
        Dim p
        p = 1
        Do While Not Rs.Eof
        %>
    <tr>

    <td bgcolor="#FFFFFF"><%=htmEncodeStr(Rs("id"))%></td>

    <td bgcolor="#FFFFFF"><%=htmEncodeStr(Rs("BMH"))%></td>

    <td bgcolor="#FFFFFF"><%=htmEncodeStr(Rs("CSRQ"))%></td>

    <td bgcolor="#FFFFFF"><%=htmEncodeStr(Rs("BLCJZL"))%></td>

    <td bgcolor="#FFFFFF"><%=htmEncodeStr(Rs("DGCL"))%></td>

    <td bgcolor="#FFFFFF"><%=htmEncodeStr(Rs("DGCP"))%></td>

    <td bgcolor="#FFFFFF"><%=htmEncodeStr(Rs("HAVEXP"))%></td>

    <td bgcolor="#FFFFFF"><%=htmEncodeStr(Rs("cxcn"))%></td>

    <td bgcolor="#FFFFFF">
        <a href='t_bm_detail.asp?id=<%=Rs("id")%>' target='_blank'>查看</a>
        <a href='t_bm_edit.asp?id=<%=Rs("id")%>' target='_blank'>修改</a>


        <a href='#' onClick="return delRec('<%=Rs("id")%>')">删除</a>

    </td>
    </tr>
        <%
        If p >= maxPerPage Then Exit Do
        Rs.MoveNext()
        p = p + 1
        Loop
    Else
        Response.Write ("<tr><td colspan=""100"" bgcolor=""#ffffff"" align=""center"">暂无任何记录!</td></tr>")
    End If
    %>
    <%
    ' 调用表头排序
    Call tableTitle()
    %>
    </TABLE>
<%
End Sub
'显示列表内容子程序 终--------------------------------------------------
%>

<%


' 表头排序代码 始---------------------------------
Sub tableTitle()
    Dim strAscDesc
    Dim strAscDescSymbol

    Dim bShowTableTag
    bShowTableTag = False
    If (bShowTableTag = True) Then
    %>
<table>
    <%
    End If
    %>
    <tr>

    <td bgcolor="#EEEEEE">


    id

    </td>

    <td bgcolor="#EEEEEE">


    BMH

    </td>

    <td bgcolor="#EEEEEE">


    CSRQ

    </td>

    <td bgcolor="#EEEEEE">


    BLCJZL

    </td>

    <td bgcolor="#EEEEEE">


    DGCL

    </td>

    <td bgcolor="#EEEEEE">


    DGCP

    </td>

    <td bgcolor="#EEEEEE">


    HAVEXP

    </td>

    <td bgcolor="#EEEEEE">


    cxcn

    </td>

    <td bgcolor="#EEEEEE" nowrap>



        查看

    </td>
    </tr>
    <%
    '为便于在Dreamweaver等软件中排版, 加上</table>标签, 实际调用时并不显示
    If (bShowTableTag = True) Then
    %>
</table>
<%
    End If
End Sub
' 表头排序代码 终---------------------------------
%>

<SCRIPT LANGUAGE="javascript">
function goPage(strPage)
{
    document.all.page.value=strPage;
    document.<%=currentAspFileName()%>_Form.submit();
    return false;
}

// 单条删除记录
function delRec(strID)
{
    if (confirm('确定删除吗？'))
    {
        document.all.recordID.value=strID;
        document.all.actMod.value='DEL';
        document.all.<%=currentAspFileName()%>_Form.submit();
    }
    else
    {
        alert('您取消了删除操作');
    }
    return false;
}





</SCRIPT>

<INPUT NAME="page" TYPE="hidden" VALUE="<%=currentPage%>">
<INPUT NAME="maxPerPage" TYPE="hidden" VALUE="<%=maxPerPage%>">
<input name="actMod" type="hidden" value="">
<input name="recordID" id="recordID" type="hidden" value="">
<input name="sqlOrderBy" type="hidden" value="<%=Request.Form("sqlOrderBy")%>">
<input name="sqlDescAsc" type="hidden" value="<%=Request.Form("sqlDescAsc")%>">

</FORM>

<script language="javascript">
<!--
try
{

    var ctrl_id_BgColor = document.all.id.style.backgroundColor;
    var ctrl_BMH_BgColor = document.all.BMH.style.backgroundColor;
    var ctrl_CSRQ_BgColor = document.all.CSRQ.style.backgroundColor;
    var ctrl_BLCJZL_BgColor = document.all.BLCJZL.style.backgroundColor;
    var ctrl_DGCL_BgColor = document.all.DGCL.style.backgroundColor;
    var ctrl_DGCP_BgColor = document.all.DGCP.style.backgroundColor;
    var ctrl_HAVEXP_BgColor = document.all.HAVEXP.style.backgroundColor;
    var ctrl_cxcn_BgColor = document.all.cxcn.style.backgroundColor;
}
catch(e)
{ alert("控件不具备相应属性，请修改如下代码：\r\n" + e.description) }
function checkForm(theCheckForm)
{
    var errMessage = "";
    try
    {

        if (theCheckForm.id.value.length > 6 || (theCheckForm.id.value.length > 0 && !/[\s\S]*/g.test(theCheckForm.id.value)))
        {
            errMessage = errMessage + "所输入 [id] 的内容有误，长度不能超过6个字符，并且文本格式不正确！\n\n";
            theCheckForm.id.focus();
            theCheckForm.id.style.backgroundColor = "yellow";
        }
        else
            theCheckForm.id.style.backgroundColor = ctrl_id_BgColor;

        if (theCheckForm.BMH.value.length > 14 || (theCheckForm.BMH.value.length > 0 && !/[\s\S]*/g.test(theCheckForm.BMH.value)))
        {
            errMessage = errMessage + "所输入 [BMH] 的内容有误，长度不能超过14个字符，并且文本格式不正确！\n\n";
            theCheckForm.BMH.focus();
            theCheckForm.BMH.style.backgroundColor = "yellow";
        }
        else
            theCheckForm.BMH.style.backgroundColor = ctrl_BMH_BgColor;

        if (theCheckForm.CSRQ.value.length > 8 || (theCheckForm.CSRQ.value.length > 0 && !/[\s\S]*/g.test(theCheckForm.CSRQ.value)))
        {
            errMessage = errMessage + "所输入 [CSRQ] 的内容有误，长度不能超过8个字符，并且文本格式不正确！\n\n";
            theCheckForm.CSRQ.focus();
            theCheckForm.CSRQ.style.backgroundColor = "yellow";
        }
        else
            theCheckForm.CSRQ.style.backgroundColor = ctrl_CSRQ_BgColor;

        if (theCheckForm.BLCJZL.value.length > 1 || (theCheckForm.BLCJZL.value.length > 0 && !/[\s\S]*/g.test(theCheckForm.BLCJZL.value)))
        {
            errMessage = errMessage + "所输入 [BLCJZL] 的内容有误，长度不能超过1个字符，并且文本格式不正确！\n\n";
            theCheckForm.BLCJZL.focus();
            theCheckForm.BLCJZL.style.backgroundColor = "yellow";
        }
        else
            theCheckForm.BLCJZL.style.backgroundColor = ctrl_BLCJZL_BgColor;

        if (theCheckForm.DGCL.value.length > 2 || (theCheckForm.DGCL.value.length > 0 && !/^[\d]+$/g.test(theCheckForm.DGCL.value)))
        {
            errMessage = errMessage + "所输入 [DGCL] 的内容有误，长度不能超过2个字符，并且整数格式不正确！\n\n";
            theCheckForm.DGCL.focus();
            theCheckForm.DGCL.style.backgroundColor = "yellow";
        }
        else
            theCheckForm.DGCL.style.backgroundColor = ctrl_DGCL_BgColor;

        if (theCheckForm.DGCP.value.length > 2 || (theCheckForm.DGCP.value.length > 0 && !/^[\d]+$/g.test(theCheckForm.DGCP.value)))
        {
            errMessage = errMessage + "所输入 [DGCP] 的内容有误，长度不能超过2个字符，并且整数格式不正确！\n\n";
            theCheckForm.DGCP.focus();
            theCheckForm.DGCP.style.backgroundColor = "yellow";
        }
        else
            theCheckForm.DGCP.style.backgroundColor = ctrl_DGCP_BgColor;

        if (theCheckForm.HAVEXP.value.length > 10 || (theCheckForm.HAVEXP.value.length > 0 && !/^[\d]+$/g.test(theCheckForm.HAVEXP.value)))
        {
            errMessage = errMessage + "所输入 [HAVEXP] 的内容有误，长度不能超过10个字符，并且整数格式不正确！\n\n";
            theCheckForm.HAVEXP.focus();
            theCheckForm.HAVEXP.style.backgroundColor = "yellow";
        }
        else
            theCheckForm.HAVEXP.style.backgroundColor = ctrl_HAVEXP_BgColor;

        if (theCheckForm.cxcn.value.length > 2 || (theCheckForm.cxcn.value.length > 0 && !/[\s\S]*/g.test(theCheckForm.cxcn.value)))
        {
            errMessage = errMessage + "所输入 [cxcn] 的内容有误，长度不能超过2个字符，并且文本格式不正确！\n\n";
            theCheckForm.cxcn.focus();
            theCheckForm.cxcn.style.backgroundColor = "yellow";
        }
        else
            theCheckForm.cxcn.style.backgroundColor = ctrl_cxcn_BgColor;

    }
    catch(e)
    { alert("控件不具备相应属性，请修改如下代码：\r\n" + e.description) }
    if (errMessage.length > 0)
    {
        alert(errMessage);
        theCheckForm.method = "";
        return false;
    }

    //拆分备注型字段，以接受大于100K的数据

    theCheckForm.method = "post";
    return true;
}



-->
</script>



<%
Rs.Close()
Set Rs = Nothing
connClose()

' 错误检测
CheckError()
%>
</BODY>

</HTML>