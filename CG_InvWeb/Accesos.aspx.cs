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
            objeto.Bitacora("DELETE", e.Values["Usuario"].ToString() + " -- " + e.Values["Empresa"].ToString() + " -- " + e.Values["Periodos"].ToString(), "", usuario, "", "Accesos");
            //TERMINA BITACORA #######################
        }

        protected void ASPxGridView1_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //Accesos&quot; (&quot;Usuario&quot;, &quot;Empresa&quot;, &quot;Periodos&quot;)
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
            objeto.Bitacora("INSERT", "", e.NewValues["Usuario"].ToString() + " -- " + e.NewValues["Empresa"].ToString() + " -- " + e.NewValues["Periodos"].ToString(), usuario, "", "Accesos");
            //TERMINA BITACORA #######################
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
            objeto.Bitacora("UPDATE", e.OldValues["Usuario"].ToString() + " -- " + e.OldValues["Empresa"].ToString() + " -- " + e.OldValues["Periodos"].ToString(), e.NewValues["Usuario"].ToString() + " -- " + e.NewValues["Empresa"].ToString() + " -- " + e.NewValues["Periodos"].ToString(), usuario, "", "Accesos");
            //TERMINA BITACORA #######################
        }
    }
}