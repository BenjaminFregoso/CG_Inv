using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;


namespace CG_InvWeb {
    public partial class MainMaster : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e)
        {

           string svIdMenu = System.Web.HttpContext.Current.Session["Perfil"] as String;
           XmlDataSourceLeft.DataFile = "~/App_Data/" + svIdMenu + ".xml";
        }
    }
}