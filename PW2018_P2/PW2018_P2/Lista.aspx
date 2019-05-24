<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lista.aspx.cs" Inherits="PW2018_P2.Lista" %>
<!doctype html>
<html>
	<head runat="server">
		<meta charset="utf8"/>
		<title> Lista - PDM Clã </title>
		<link rel="stylesheet" href="estilo.css" />
		<meta name="description" content="Lista de pessoas cadastradas na PDM Clã"/>
		<meta name="keywords" content="lista,pessoas,informações"/>
		<link rel="shortcut icon" href="folha.png">
	</head>
	<body>
		<form id="form1" runat="server">
		<div id="menu"> 
				<a>Conta</a>
				<div class="menu1">
					<a href="Login.aspx">Login</a><br/>
					<a href="CRUD.aspx">Cadastro</a>
				</div>
				<a href="Lista.aspx">Lista</a>
		</div>
		
		<div id="listaBTN">
			<a href="CRUD.aspx"> <input type="button"  class="btnCadastro" value="+ Cadastrar cliente" /></a>
		</div>
        <div id="listaBTN2">
			<a href="Login.aspx"> <input type="button"  class="btnSair" value="Sair" /></a>
		</div>
		<div id="lista"> <br><br>
		</div>
	        <asp:GridView ID="txtGrid" runat="server" DataKeyNames="codigo" OnSelectedIndexChanged="txtGrid_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField AccessibleHeaderText="Informações" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="txtLb" runat="server" OnClick="detalhes"  CausesValidation="false" CommandName="" Text="Detalhes" ></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </form>
	</body>
</html>


<script lang="javascript" src="jquery-3.3.1.min.js"></script>
<script lang="javascript">
	$("#menu").mouseenter(function(){
		$("#menu .menu1").slideDown(500);
	});
	$("#menu").mouseleave(function(){
		$("#menu .menu1").slideUp(1000);
	});	
</script>