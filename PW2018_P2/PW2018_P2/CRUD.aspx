
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUD.aspx.cs" Inherits="PW2018_P2.CRUD" %>
<!doctype html>
<html>
	<head runat="server">
		<meta charset="utf8"/>
		<title> CRUD - PDM Clã </title>
		<link rel="stylesheet" href="estilo.css" />
		<meta name="description" content="Página para cadastro na rede de vendas PDM Clã"/>
		<meta name="keywords" content="cadastro,dados,identificação,registro"/>
		<link rel="shortcut icon" href="ficha.png">
	    </head>
	    <body>
			<div id="menu"> 
				<a>Conta</a>
				<div class="menu1">
					<a href="Login.aspx">Login</a><br/>
					<a href="CRUD.aspx">Cadastro</a>
				</div>
				<a href="Lista.aspx">Lista</a>
			</div>	
				<form id="form1" runat="server">
                <asp:Button class="btnCadastrar" runat="server" Text="Cadastrar" OnClick="cadastrar" /><br />
                <asp:Button class="btnPesquisar" runat="server" Text="Pesquisar" OnClick="pesquisar" /><br />
                <asp:Button class="btnAlterar" runat="server" Text="Alterar" OnClick="alterar" /><br />
                <asp:Button class="btnExcluir" runat="server" Text="Excluir" OnClick="excluir" /><br />
                <div class="btnSair3">
			        <a href="Login.aspx"> <input type="button"  class="btnSair2" value="Sair" /></a>
	        	</div>
                <div class="caixa2">
				<img src="logo_cadastro.png" width="70px" class="logo"> 
				<h1> CRUD - PDM clã</h1>
				<div class="cab"> Os campos marcados com (*) são obrigatórios.<br /> 
                    </div> 
                     <div class="lbl">
                         <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <asp:Label id="txtLbl" runat="server" Text=""></asp:Label></p>
                    </div>
                    <div id="esp7">
                        <br />
                        <p><asp:Label ID="txtLC" runat="server" Text="Código"></asp:Label></p><br/>
                    </div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:TextBox ID="txtCodigo" runat="server" Width="45px"></asp:TextBox>
                    <br />
                    <br/>
				<div id="lado1"> 
					<p>Nome *</p>
					<input type="text" id="txtNome" placeholder="Informe seu nome completo" size=45 runat="server" >
				</div>
				<div class="esp3">
						<p>Data de nascimento </p>
						<input type="date" id="txtData" runat="server"/><br/><br/>
				</div>
				<div id="lado1">
					<div class="esp5">
						<p>CPF *</p>
						<input type="text" id="txtCPF" maxlength="11" placeholder="Somente números" size=20 runat="server" />
					</div>
				</div>
				<div id="lado3">
					<div class="esp6">
						<p> Cidade </p>
						<input type="text"  maxlength="15" id="txtCidade"  size=15 runat="server" /> 
					</div>
				</div>
				    <div class="esp8">
					    <p>UF</p>
                    <asp:DropDownList ID="txtUf" runat="server" AppendDataBoundItems="True" AutoPostBack="True" CausesValidation="True" EnableTheming="True" Height="21px">
                        <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
				        <br />
				</div>					
				<div id="lado1">	
					<div class="esp7">
						<p>Telefone fixo *</p>
						<input type="tel"  maxlength="13" id="txtFone" placeholder="(00)0000-0000" runat="server"/>
					</div>
				</div>
				<div class="esp9">
					<p>Celular</p>
					<input type="tel"  maxlength="14" id="txtCel" placeholder="(00)00000-0000" runat="server"/><br/><br/>
				</div>
				<div id="lado2">
					<p>Email(será utilizado como login) *</p>
					<input type="text" size=40 id="txtEmail2" runat="server" /><br/> <br/>
				</div>
				
				<div id="lado1">
					<div class="esp10">
						<p>Senha *</p>
						<input type="password" size=25 id="txtSenha1" runat="server" aria-atomic="False"  /><br/><br/>
					</div>
				</div>
					<p>Confirme sua senha *</p>
					<input type="password" size=25 id="txtSenha2" runat="server"  /> <br/><br/>
				
				<div id="lado1">
					<p>Deseja receber novas promoções via email?</p>
				</div>
				<div id="lado1">
					<p><input type="radio" id="txtOPC1" name="OPC" checked="true" value="1" />Sim</p>
				</div>
				<div class="esp11">
					<p><input type="radio" id="txtOPC2" name="OPC" value="2" />Nao</p><br/></br>
				</div>
                </div>
				    <p>
                        &nbsp;</p>
				</form>

	</body>
</html>


<script lang="javascript">
function validar()
{	
	if(txtNome.value.length < 3){
		alert("Informe um nome válido!");
		txtNome.focus();
		return false;	
	}
	if(txtCPF.value.length != 11 || isNaN(txtCPF.value)){
		alert("Informe um CPF válido!");
		txtCPF.focus();
		return false;	
	}
	// (11)2345-1234
	if(txtFone.value.length != 13){
		alert("Informe um número de telefone fixo válido");
		txtFone.focus();
		return false;
	}
	if(txtEmail2.value.length < 6 || 
	txtEmail2.value.indexOf("@") <= 1 ||
    txtEmail2.value.indexOf(".") <= 1) 
	{
		alert("Digite um email válido");
		txtEmail2.focus();
		return false;
	}

	if(txtSenha1.value.length < 6){
		alert("Informe uma senha com ao menos 6 caracteres ou digitos");
		txtSenha1.focus();
		return false;
		
	}
	if(txtSenha1.value.length != txtSenha2.value.length ){
		alert("As senhas não são iguais");
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