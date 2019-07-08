using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Configuration;
using Npgsql;

namespace CG_InvWeb {
    public partial class RootMaster : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {
            string svUsuario = System.Web.HttpContext.Current.Session["Usuario"] as String;
            string svNombre = System.Web.HttpContext.Current.Session["Nombre_Completo"] as String;
            //ASPxLabel2.Text = DateTime.Now.Year + Server.HtmlDecode(" &copy; Copyright by [ssc]") + "|    " + " Usuario: " + svUsuario + "|    " + " Nombre del empleado: " + svNombre;
            ASPxLabel1.Text = "Usuario: " + svUsuario;
            ASPxLabel2.Text = svNombre;
        }
    }


    public class Funciones_globales
    {
        public Funciones_globales()
        {

        }

        string servidor = ConfigurationManager.ConnectionStrings["CG_InvWeb.Properties.Settings.ServerPostgreSql"].ConnectionString.ToString();

        //Guardar en la bitacora
        public void Bitacora(string accion_, string dato_anterior_, string dato_nuevo_, string usuario_, string autorizacion_)
        {
            //Al llamar está funcion guardar los datos 
        }

        //Conexion a la base sin odbc
        public NpgsqlConnection ConectarPostgresql()
        {
            NpgsqlConnection conexion = new NpgsqlConnection();

            if (!string.IsNullOrWhiteSpace(servidor))
            {
                try
                {
                    conexion = new NpgsqlConnection(servidor);
                    conexion.Open();

                }catch (Exception e)
                {
                    conexion.Close();
                }
            }

            return conexion;
        }
    }
}