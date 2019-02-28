using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

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
}