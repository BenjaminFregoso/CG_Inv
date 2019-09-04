using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CG_InvWeb
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            objeto.Bitacora("DELETE", e.Values["usuario"].ToString() + " -- " + e.Values["contrasena"].ToString() + " -- " + e.Values["perfil"].ToString(),"", usuario, "", "Usuarios");
            //TERMINA BITACORA #######################
        }

        protected void ASPxGridView1_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //&quot;Usuarios&quot; (usuario, contrasena, perfil, empresa, nombre, fecha_baja, fecha_alta)
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
            objeto.Bitacora("INSERT", "", e.NewValues["usuario"].ToString() + " -- " + e.NewValues["contrasena"].ToString() + " -- " + e.NewValues["perfil"].ToString(), usuario, "", "Usuarios");
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
            //objeto.Bitacora("UPDATE", e.OldValues["departamento"].ToString(), e.NewValues["departamento"].ToString(), usuario, "", "Departamento");

            objeto.Bitacora("UPDATE", e.OldValues["perfil"].ToString() + " -- " + e.OldValues["contrasena"].ToString(), e.NewValues["perfil"].ToString() + " -- " + e.NewValues["contrasena"].ToString(), usuario, "", "Usuarios");
            //TERMINA BITACORA #######################
        }
    }
}