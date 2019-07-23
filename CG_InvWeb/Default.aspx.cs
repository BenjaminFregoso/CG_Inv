using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using DevExpress.Web;
using Npgsql;

namespace CG_InvWeb
{
    public partial class Default : System.Web.UI.Page
    {
        private string Usuario;
        private string Contraseña;
        private string Compañia;
        private string Obra;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            Usuario = ASPxComboUsu.SelectedItem.Text;
            Contraseña = ASPxTextPass.Text;

            //BITACORA #######################
            GlobalHandler objeto = new GlobalHandler();
            //TERMINA BITACORA #######################
            string ip = Request.UserHostAddress.ToString();


            //AQUI NO SIRVE 
            using (NpgsqlConnection sqlConnection1 = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ServerPostgreSql"].ConnectionString.ToString()))
            //using (SqlConnection sqlConnection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString()))
            {
                sqlConnection1.Open();
                NpgsqlCommand cmd = new NpgsqlCommand();
                NpgsqlDataReader reader;

                //BUSCA EN CLIENTES
                cmd.CommandText = "SELECT * FROM \"Usuarios\" WHERE usuario = '"+ Usuario + "' AND contrasena = '"+Contraseña+"'"; 
                cmd.CommandType = CommandType.Text;
                cmd.Connection = sqlConnection1;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    //BITACORA #######################
                    objeto.Bitacora("LOG IN", "", "EXITOSO", Usuario, ip, "Usuarios");
                    //TERMINA BITACORA #######################
                    reader.Read();
                    System.Web.HttpContext.Current.Session.Timeout = 300; //Tiempo de sesion 
                    System.Web.HttpContext.Current.Session["Perfil"] = reader["Perfil"].ToString();
                    System.Web.HttpContext.Current.Session["Usuario"] = Usuario;
                    Response.Redirect("Inicio.aspx?Usuario=" + Usuario);
                    
                }
                else
                {
                    ASPxMensaje.Visible = true;
                    ASPxMensaje.Text = "Usuario y/o contraseña sin acceso";
                    reader.Close();
                    //BITACORA #######################
                    objeto.Bitacora("LOG IN", "", "FALLIDO", Usuario, ip, "Usuarios");
                    //TERMINA BITACORA #######################
                }
            }
        }

        protected void ASPxComboUsu_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}