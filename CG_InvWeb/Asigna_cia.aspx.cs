using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web;
using System.Windows.Forms;

namespace CG_InvWeb
{
    public partial class Asigna_cia : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }
        protected void ASPxGridView1_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            if (e.ErrorText.Contains("Cannot insert duplicate key"))
            {
                e.ErrorText = "Ya existe la Compañia";
            }
        }


    }
}