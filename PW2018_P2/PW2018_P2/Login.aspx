<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PW2018_P2.Login" %>
<!doctype html>
<html>
	<head runat="server">
		<meta charset="utf8"/>
		<title> Login - PDM Clã </title>
		<link rel="stylesheet" href="estilo.css" />
		<meta name="description" content="PDM Clã é uma rede de vendas de jogos digitais muito popular no Brasil"/>
		<meta name="keywords" content="cadastro,login,jogos"/>
		<link rel="shortcut icon" href="controle.png">
	</head>
	<body>
		<form id="form1" runat="server">
		<div id="menu"> 
			<a>Conta</a>
			<div class="menu1">
					<a href="Login.aspx">Login</a><br/>
			</div>
		</div>
		<div class="caixa">
		<img src="logo.png" width="30%" class="logo"> 
				<h1> Efetue seu login </h1><br />
                <div class="lbl">
				    <p><asp:Label id="txtLbl2" runat="server" Text=""></asp:Label></p><br />
                </div>
				<p>Email<p><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox> <br />
                <p>&nbsp;<p>&nbsp;<p>&nbsp;<p>Senha</p><asp:TextBox ID="txtSenha" runat="server" Height="40px" TextMode="Password" Width="259px"></asp:TextBox> <br />
            <asp:LinkButton ID="btnReenviar" runat="server" OnClick="reenviarSenha">Esqueceu sua senha? clique aqui para reenvia-lá por email.</asp:LinkButton>
		    <br />
            <br />
            <br />
				<asp:Button class="btnLogin" runat="server" Text="Login" OnClick="login" /><br />
		</div>
	    </form>
	</body>
</html>

<script lang="javascript">

function validar()
{	
	if(txtEmail.value.length < 6 || 
	txtEmail.value.indexOf("@") <= 1 ||
    txtEmail.value.indexOf(".") <= 1) 
	{
		alert("Digite um email válido");
		txtEmail.focus();
		return false;
	}

	if(txtSenha.value.length < 6){
		alert("Informe uma senha com ao menos 6 caracteres ou digitos");
		txtSenha.focus();
		return false;
	}
}

</script>

<script lang="javascript" src="jquery-3.3.1.min.js"></script>
<script lang="javascript">
	$("#menu").mouseenter(function(){
		$("#menu .menu1").slideDown(500);
	});
	$("#menu").mouseleave(function(){
		$("#menu .menu1").slideUp(1000);
	});	
	
</script>