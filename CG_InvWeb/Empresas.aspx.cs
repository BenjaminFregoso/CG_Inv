using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CG_InvWeb
{
    public partial class Empresas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //Empresas&quot; (empresa)
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
            objeto.Bitacora("INSERT", "", e.NewValues["empresa"].ToString(), usuario, "", "Empresas");
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
            objeto.Bitacora("DELETE", e.Values["empresa"].ToString(), "", usuario, "", "Empresas");
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
            objeto.Bitacora("UPDATE", e.OldValues["empresa"].ToString(), e.NewValues["empresa"].ToString(), usuario, "", "Empresas");
            //TERMINA BITACORA #######################
        }
    }
}