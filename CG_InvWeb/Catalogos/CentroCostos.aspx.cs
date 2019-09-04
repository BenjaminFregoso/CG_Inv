using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CG_InvWeb.Catalogos
{
    public partial class CentroCostos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //ASPxGridView1.GetMasterRowKeyValue();
            //string PerfilValue = e.Values[index].ToString();
            //e.NewValues["fisica"] = (e.NewValues["fisica"] == null) ? 0 : e.NewValues["fisica"];
            //e.NewValues["moral"] = (e.NewValues["moral"] == null) ? 0: e.NewValues["moral"];
        }

        protected void ASPxGridView1_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            //e.NewValues["fisica"] = (e.NewValues["fisica"] == null) ? 0 : e.NewValues["fisica"];
            //e.NewValues["moral"] = (e.NewValues["moral"] == null) ? 0 : e.NewValues["moral"];
            //e.NewValues["fecha_ini"] = DateTime.Today;

        }

        protected void ASPxGridView1_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e)
        {
            if (e.ErrorText.Contains("Cannot insert duplicate key"))
            {
                e.ErrorText = "No es posible duplicar el registro";
            }
            if (e.ErrorText.Contains("c_Regimen_Fiscal_codigo_regimen_fiscal_key"))
            {
                e.ErrorText = "Ya existe el código del régimen fiscal que estás tratando de agregar";
            }
        }

        protected void ASPxGridView1_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //BITACORA #######################
            string usuario = "";
            try
            {
                usuario = System.Web.HttpContext.Current.Session["Usuario"].ToString();
            }
            catch (Exception err)
            {
                usuario = err.ToString();
            }

            GlobalHandler objeto = new GlobalHandler();
            objeto.Bitacora("UPDATE", e.OldValues["centrocostos"].ToString(), e.NewValues["centrocostos"].ToString(), usuario, "", "CentroCostos");
            //TERMINA BITACORA #######################
        }

        protected void ASPxGridView1_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //BITACORA #######################
            string usuario = "";
            try
            {
                usuario = System.Web.HttpContext.Current.Session["Usuario"].ToString();
            }
            catch (Exception err)
            {
                usuario = err.ToString();
            }

            GlobalHandler objeto = new GlobalHandler();
            objeto.Bitacora("INSERT", "", e.NewValues["centrocostos"].ToString(), usuario, "", "CentroCostos");
            //TERMINA BITACORA #######################
        }

        protected void ASPxGridView1_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //BITACORA #######################
            string usuario = "";
            try
            {
                usuario = System.Web.HttpContext.Current.Session["Usuario"].ToString();
            }
            catch (Exception err)
            {
                usuario = err.ToString();
            }

            GlobalHandler objeto = new GlobalHandler();
            objeto.Bitacora("UPDATE", e.Values["centrocostos"].ToString() , "", usuario, "", "CentroCostos");
            //TERMINA BITACORA #######################
        }
    }
}