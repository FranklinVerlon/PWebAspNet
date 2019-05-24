using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using MySql.Data.MySqlClient;
using System.Data;

namespace PW2018_P2
{
    public partial class CRUD : System.Web.UI.Page
    {
        String sc = "Server=localhost;Database=server;Uid=root;Pwd=;";
        protected void Page_Load(object sender, EventArgs e)
        {
            string a = txtCodigo.Text.ToString();
            if (IsPostBack == false)
            {
                var x = Convert.ToInt64(Request["txtCodigo"]);
                if (x > 0)
                {
                    Session["txtCodigo"] = Convert.ToInt64(Request["txtCodigo"]);
                    txtCodigo.Text = Session["txtCodigo"].ToString();
                    detalhes();
                }
            }
            carregar();
        }
        private void carregar()
        {
            DataSet ds = new DataSet();
            MySqlConnection conexao = new MySqlConnection(sc);
            conexao.Open();
            String sql = "select * from uf order by estado";
            MySqlDataAdapter conversor1 = new MySqlDataAdapter(sql, conexao);
            conversor1.Fill(ds, "todos");
            conexao.Close();
            txtUf.DataSource = ds.Tables["todos"];
            txtUf.DataValueField = "codigo";
            txtUf.DataTextField = "estado";
            txtUf.DataBind();
        }

        private void limpar()
        {
            txtCodigo.Text = "";
            txtNome.Value = "";
            txtData.Value = "";
            txtCPF.Value = "";
            txtCidade.Value = "";
            txtFone.Value = "";
            txtCel.Value = "";
            txtEmail2.Value = "";
            txtSenha1.Value = "";
            txtSenha2.Value= "";
        }

        protected void cadastrar(object sender, EventArgs e)
        {
            if (txtNome.Value.Length < 3)
            {
                txtLbl.Text = "Por favor informe um nome válido";
                txtNome.Focus();
            }
            else if (txtCPF.Value.Length != 11)
            {
                txtLbl.Text = "Por favor informe um cpf válido";
                txtCPF.Focus();
            }
            else if (txtFone.Value.Length != 13)
            {
                txtLbl.Text = "Por favor informe um número de telefone válido";
                txtFone.Focus();
            }
            else if (txtEmail2.Value.Length < 6 || txtEmail2.Value.IndexOf("@") <= 1 || txtEmail2.Value.IndexOf(".") <= 1)
            {
                txtLbl.Text = "Por favor informe um email válido";
                txtEmail2.Focus();
            }
            else if (txtSenha1.Value.Length < 6)
            {
                txtLbl.Text = "Por favor informe uma senha com no minimo 6 caracteres";
                txtSenha1.Focus();
            }
            else if (txtSenha1.Value.Length != txtSenha2.Value.Length)
            { 
                txtLbl.Text = "As duas senhas informadas não coincidem";
                txtSenha1.Focus();
            }
            else
            {
                MySqlConnection conexao = new MySqlConnection(sc);
                conexao.Open();
                String sql = "insert into cliente(nome, dt_nascto, cpf, cidade, uf, telefone, celular, email, senha, conf_senha)" +
                "values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}', '{8}','{9}')";
                sql = String.Format(sql, txtNome.Value, txtData.Value, txtCPF.Value, txtCidade.Value,
               txtUf.SelectedItem, txtFone.Value, txtCel.Value, txtEmail2.Value, txtSenha1.Value, txtSenha2.Value);
                MySqlCommand comando = new MySqlCommand(sql, conexao);
                String sql1 = "insert into usuario(nome, email, senha)" +
                        "values('{0}','{1}','{2}')";
                sql1 = String.Format(sql1, txtNome.Value, txtEmail2.Value, txtSenha1.Value);
                MySqlCommand comando1 = new MySqlCommand(sql1, conexao);
                try
                {
                    comando1.ExecuteNonQuery();
                    comando.ExecuteNonQuery();
                    txtLbl.Text = "Cliente cadastrado com sucesso";
                }
                catch
                {
                    txtLbl.Text = "Falha ao cadastrar cliente";
                }
                conexao.Close();
                limpar();
            }
        }

        protected void detalhes()
        {
            MySqlConnection conexao = new MySqlConnection(sc);
            conexao.Open();
            String sql = "select * from cliente where codigo=" + txtCodigo.Text;
            MySqlCommand comando = new MySqlCommand(sql, conexao);
            try
            {
                MySqlDataReader registro = comando.ExecuteReader();
                if (registro.Read())
                {
                    txtNome.Value = registro["nome"].ToString();
                    txtData.Value = registro["dt_nascto"].ToString();
                    txtCPF.Value = registro["cpf"].ToString();
                    txtCidade.Value = registro["cidade"].ToString();
                    txtUf.SelectedItem.Value = registro["uf"].ToString();
                    txtFone.Value = registro["telefone"].ToString();
                    txtCel.Value = registro["celular"].ToString();
                    txtEmail2.Value = registro["email"].ToString();
                    txtSenha1.Attributes.Add("Value", "aaa");
                    txtSenha2.Value = registro["conf_senha"].ToString();
                    txtLbl.Text = "Dados do cliente carregados com sucesso";
                }
            }
            catch
            {
                txtLbl.Text= "Falha ao tentar carregar cadastro do cliente";
            }
            conexao.Close();
        }
        protected void pesquisar(object sender, EventArgs e)
        {
            MySqlConnection conexao = new MySqlConnection(sc);
            conexao.Open();
            String sql = "select * from cliente where codigo=" + txtCodigo.Text;
            MySqlCommand comando = new MySqlCommand(sql, conexao);
            try
            {
                MySqlDataReader registro = comando.ExecuteReader();
                if (registro.Read())
                {
                    txtNome.Value = registro["nome"].ToString();
                    txtData.Value = registro["dt_nascto"].ToString();
                    txtCPF.Value = registro["cpf"].ToString();
                    txtCidade.Value = registro["cidade"].ToString();
                    txtUf.SelectedItem.Value = registro["uf"].ToString();
                    txtFone.Value = registro["telefone"].ToString();
                    txtCel.Value = registro["celular"].ToString();
                    txtEmail2.Value = registro["email"].ToString();
                    txtSenha1.Value = registro["senha"].ToString();
                    txtSenha2.Value = registro["conf_senha"].ToString();
                    txtLbl.Text = "Dados do cliente carregados com sucesso";
                }
                else
                {
                    txtLbl.Text = "Cliente inexistente";
                    limpar();
                }
            }
            catch
            {
                txtLbl.Text = "Falha ao carregar dados do cliente";
            }
            conexao.Close();
        }
        protected void alterar(object sender, EventArgs e)
        {
                        if (txtNome.Value.Length < 3)
                        {
                            txtLbl.Text = "Por favor informe um nome válido";
                            txtNome.Focus();
                        }
                        else if (txtCPF.Value.Length != 11)
                        {
                            txtLbl.Text = "Por favor informe um cpf válido";
                            txtCPF.Focus();
                        }
                        else if (txtFone.Value.Length != 13)
                        {
                            txtLbl.Text = "Por favor informe um número de telefone válido";
                            txtFone.Focus();
                        }
                        else if (txtEmail2.Value.Length < 6 || txtEmail2.Value.IndexOf("@") <= 1 || txtEmail2.Value.IndexOf(".") <= 1)
                        {
                            txtLbl.Text = "Por favor informe um email válido";
                            txtEmail2.Focus();           
                        }
                        else if (txtSenha1.Value.Length < 6)
                        {
                            txtLbl.Text = "Por favor informe uma senha com no minimo 6 caracteres";
                            txtSenha1.Focus();
                        }
                        else if (txtSenha1.Value.Length != txtSenha2.Value.Length)
                        {
                            txtLbl.Text = "As duas senhas informadas não coincidem";
                            txtSenha1.Focus();
                        }
                        else
                        {
                            MySqlConnection conexao = new MySqlConnection(sc);
                            conexao.Open();
                            try
                            {
                                String sql = "update cliente set nome='{0}', dt_nascto='{1}', cpf='{2}', cidade='{3}', " +
                               "uf='{4}', telefone='{5}', celular='{6}', email='{7}', senha='{8}', conf_senha='{9}' where codigo='{10}'";
                                sql = String.Format(sql, txtNome.Value, txtData.Value, txtCPF.Value, txtCidade.Value,
                                txtUf.SelectedItem, txtFone.Value, txtCel.Value, txtEmail2.Value, txtSenha1.Value, txtSenha2.Value, txtCodigo.Text);
                                MySqlCommand comando = new MySqlCommand(sql, conexao);
                                String sql1 = "update usuario set nome='{0}', email='{1}', senha='{2}' where codigo='{3}'";
                                sql1 = String.Format(sql1, txtNome.Value, txtEmail2.Value, txtSenha1.Value, txtCodigo.Text);
                                MySqlCommand comando1 = new MySqlCommand(sql1, conexao);
                                comando.ExecuteNonQuery();
                                comando1.ExecuteNonQuery();
                                txtLbl.Text = "Cadastro do cliente alterado com sucesso";
                            }
                            catch
                            {
                                txtLbl.Text = "Falha ao alterar cadastro do cliente";
                            }
                            conexao.Close();
                            limpar();
                       }
            
        }

        protected void excluir(object sender, EventArgs e)
        {
            MySqlConnection conexao = new MySqlConnection(sc);
            conexao.Open();
            try
            {
                    String sql = "delete from cliente where codigo=" + txtCodigo.Text;
                    MySqlCommand comando = new MySqlCommand(sql, conexao);
                    String sql1 = "delete from usuario where codigo=" + txtCodigo.Text;
                    MySqlCommand comando1 = new MySqlCommand(sql1, conexao);
                    comando.ExecuteNonQuery();
                    comando1.ExecuteNonQuery();
                    txtLbl.Text = "Cadastro do cliente excluido com sucesso";
            }
            catch
            {
                txtLbl.Text = "Falha ao excluir cadastro do cliente";
            }
            conexao.Close();
            limpar();
        }

    }
}