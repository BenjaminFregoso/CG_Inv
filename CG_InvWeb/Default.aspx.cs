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
            //Compañia = ASPxComboCia.SelectedItem.Text;
            //Obra = ASPxListObras.SelectedItem.Text;

            //Compañia = "SSC DESARROLLOS";
            //Obra = "UNICA";


            using (SqlConnection sqlConnection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString()))
            {
                sqlConnection1.Open();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;

                //BUSCA EN CLIENTES
                //cmd.CommandText = "ConsultaLogin '" + Usuario + "','" + Contraseña + "','" + Compañia + "','" + Obra + "' ";
                cmd.CommandText = "ConsultaLogin '" + Usuario + "','" + Contraseña + "' ";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = sqlConnection1;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    System.Web.HttpContext.Current.Session["Perfil"] = reader["Perfil"].ToString();
                    System.Web.HttpContext.Current.Session["Usuario"] = Usuario;
                    System.Web.HttpContext.Current.Session["Nombre_Completo"] = reader["Usuario_Largo"].ToString(); ; 

                    //Response.Redirect("Default.aspx?Usuario=" + Usuario + "&Id=" + reader["Perfil"].ToString() + "&Obra=" + Obra + "&Compañia=" + Compañia);
                    Response.Redirect("Inicio.aspx?Usuario=" + Usuario);
                }
                else
                {
                    ASPxMensaje.Visible = true;
                    ASPxMensaje.Text = "Usuario y/o contraseña sin acceso";
                    reader.Close();
                }
            }
        }

        protected void ASPxComboUsu_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}