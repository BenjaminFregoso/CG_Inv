using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CG_InvWeb
{
    public partial class Accesos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["Periodos"] = (e.NewValues["Periodos"] == null) ? false : e.NewValues["Periodos"];
        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Periodos"] = (e.NewValues["Periodos"] == null) ? true : e.NewValues["Periodos"];
        }

        protected void ASPxGridView1_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e)
        {
            if (e.ErrorText.Contains("Cannot insert duplicate key"))
            {
                e.ErrorText = "Ya exixte un usuario con los mismos accesos";
            }
        }

    }
}