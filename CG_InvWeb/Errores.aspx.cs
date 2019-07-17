using System;
using System.Xml.Linq;
using System.Xml;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using DevExpress.Web;

namespace CG_InvWeb
{
    public partial class Errores : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            GlobalHandler objeto = new GlobalHandler();

            string usuario = System.Web.HttpContext.Current.Session["Usuario"].ToString();
            
            Label1.Text = objeto.obtenerError()+ " || || "+usuario;
            objeto.guardarLog(usuario); 
        }

    }
}