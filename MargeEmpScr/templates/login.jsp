<html>
 	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
    <!-- Theme CSS -->
    <link href="../script/login.css" rel="stylesheet">
		</head>
<body>
	<h1>社員情報管理システム</h1>
  		<hr>
		<div align="center">
			<table class="table" border="0">
				<form action="list.html" method="get">
						<tr>
							<th>
								社員番号
							</th>
						</tr>
						<tr>							
						 	<td>
                                 <input type="text" class="text" id="id" name="id" value="" size="8" placeholder="IDを入力してください">
                         	</td>
 	    				</tr>
 	    				<tr>
 	    					<th>
		                         パスワード
	                     	</th>
 	    				</tr>
 	                    <tr>
	                      	<td>
		                          <input type="password" class="text" id="password" name="password" value="" size="12"
		                          placeholder="Passwordを入力してください">
	                      	</td>
                      	</tr>
	                    <tr>
	                          <td class="btn-center" colspan="2">
	                              <input type="button" class="btn-login" id="login" value="login" onclick="location.href='./user_info.html'">
	                          </td>
	                    </tr>
	                    <tr>
	                    	<td class="center-2" colspan="2">
	                    		<a href="" id="forgetPassword">パスワードを忘れました</a>
	                    	</td>
	                    </tr>	                  
	         	</form>
          	</table>
      	</div>
</body>
 </html>