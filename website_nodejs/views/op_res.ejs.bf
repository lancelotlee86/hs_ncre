<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="/css/op_res.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div id="header">

		<div style="position:relative;">
			<img src="./img/school.png">
		</div>
	</div>
	<div id='mainPanel'>
		<h1><%= res %></h1>
			<%if(info){%>
				<ul>
					<%for (key in info){%>
					<li><%= info[key]%></li>
					<%}%>
				</ul>
			<%}%>
		<a href="/">��˷�����ҳ</a>
	</div>
</body>
</html>