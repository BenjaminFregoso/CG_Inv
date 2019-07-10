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

        string servidor = ConfigurationManager.ConnectionStrings["ServerPostgreSql"].ConnectionString.ToString();

        //Guardar en la bitacora
        public void Bitacora(string accion_, string dato_anterior_, string dato_nuevo_, string usuario_, string autorizacion_)
        {
            var conexion = ConectarPostgresql();
            string fecha = "12/12/2018";
            //var fecha = DateTime.Now.ToString("dd-MM-yyyy"); 
            var hora = DateTime.Now.ToString("hh:mm:ss");
            NpgsqlCommand cmd = conexion.CreateCommand();
            cmd.CommandText = "INSERT INTO  \"Bitacora\" (accion, dato_anterior, dato_nuevo, fecha, hora, usuario, autorizacion) VALUES('" + accion_+"','"+dato_anterior_+"','"+dato_nuevo_+"','"+fecha+"','"+hora+"','"+usuario_+"','"+autorizacion_+"')";
            //cmd.Parameters.Add("@FechaHoy", SqlDbType.Date).Value = dateTimePicker1.Value;
            cmd.ExecuteNonQuery();
            conexion.Close();

            //Al llamar está funcion guardar los datos 
        }

        //CONEXION A LA BASE SIN ODBC || Listo 09/07/2019
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