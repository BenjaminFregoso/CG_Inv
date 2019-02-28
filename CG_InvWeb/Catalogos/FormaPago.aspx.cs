using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CG_InvWeb.Catalogos
{
    public partial class FormaPago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //ASPxGridView1.GetMasterRowKeyValue();
            //string PerfilValue = e.Values[index].ToString();
            e.NewValues["bancarizado"] = (e.NewValues["bancarizado"] == null) ? 0 : e.NewValues["bancarizado"];
        }

        protected void ASPxGridView1_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["bancarizado"] = (e.NewValues["bancarizado"] == null) ? 0 : e.NewValues["bancarizado"];
        }

        protected void ASPxGridView1_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e)
        {
            if (e.ErrorText.Contains("Cannot insert duplicate key"))
            {
                e.ErrorText = "No es posible duplicar el código";
            }
            if (e.ErrorText.Contains("c_Forma_Pago_forma_pago_key"))
            {
                e.ErrorText = "Ya existe el código de la Forma de Pago que estás tratando de agregar";
            }

        }

    }
}