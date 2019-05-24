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
    public partial class Login : System.Web.UI.Page
    {
        String sc = "Server=localhost;Database=server;Uid=root;Pwd=;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login(object sender, EventArgs e)
        {
            MySqlConnection conexao = new MySqlConnection(sc);
            conexao.Open();
            String sql = "select * from usuario where email='" + txtEmail.Text + "' and " + "senha='" + txtSenha.Text + "'";
            MySqlCommand comando = new MySqlCommand(sql, conexao);
            MySqlDataReader registro = comando.ExecuteReader();
            if (registro.Read())
            {
                Response.Redirect("Lista.aspx");
            }
            else
            {
                txtLbl2.Text = "Email ou senha incorretos";
            }
            conexao.Close();
        }

        private void limpar()
        {
            txtEmail.Text = "";
            txtSenha.Text = "";
        }

        protected void reenviarSenha(object sender, EventArgs e)
        {
            MySqlConnection conexao = new MySqlConnection(sc);
            conexao.Open();
            String sql = "select * from usuario where email='" + txtEmail.Text + "'";
            MySqlCommand comando = new MySqlCommand(sql, conexao);
            MySqlDataReader registro = comando.ExecuteReader();
            if (registro.Read())
            {
                MailMessage email = new MailMessage();
                email.From = new MailAddress("seu.email@outlook.com");
                email.To.Add(new MailAddress(txtEmail.Text));
                email.Subject = "Recuperação de senha";
                email.Body ="Olá " + registro["nome"].ToString() +  " a senha para a sua conta é: " + registro["senha"].ToString();

                SmtpClient smtp = new SmtpClient("smtp-mail.outlook.com");
                try
                {
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.Credentials = new NetworkCredential("seu.email@outlook.com", "seu senha");
                    smtp.Send(email);
                    txtLbl2.Text =  "Senha  enviada com sucesso para seu email";
                }
                catch
                {
                    txtLbl2.Text = "Erro ao enviar o email";
                }
            }
            else
            {
                txtLbl2.Text = "O email digitado não está cadastrado no sistema";
            }
            limpar();
            conexao.Close();
        }
    }
}