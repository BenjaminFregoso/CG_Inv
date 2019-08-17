using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;
using NpgsqlTypes;
using DevExpress.Web;
using DevExpress.Web.Internal;
using System.Data;
using System.Configuration;

namespace CG_InvWeb.Articulos
{
    public partial class Familias_Caracteristicas : System.Web.UI.Page
    {
        public Int64 nFamilia;

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
            if (e.ErrorText.Contains("fkey_familia"))
            {
                e.ErrorText = "No se ha seleccionado Departamento | Clasificación | Familia";
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
            objeto.Bitacora("UPDATE", e.OldValues["fkey_caracteristicas"].ToString(), e.NewValues["fkey_caracteristicas"].ToString(), usuario, "", "Familia_caracteristicas");
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
            objeto.Bitacora("INSERT", "", e.NewValues["fkey_caracteristicas"].ToString() , usuario, "", "Familia_caracteristicas");
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
            objeto.Bitacora("DELETE", e.Values["fkey_caracteristicas"].ToString(), "", usuario, "", "Familia_caracteristicas");
            //TERMINA BITACORA #######################
        }

        protected void ASPxGridLookup2_ValueChanged(object sender, EventArgs e)
        {
            nFamilia = Convert.ToInt64(((ASPxGridLookup)sender).Value.ToString());
            HttpContext.Current.Session["session_familia"] = nFamilia;

        }

        protected void ASPxGridView1_InitNewRow1(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            ((ASPxGridView)sender).EditFormLayoutProperties.FindColumnItem("departamento").Visible = false;
            ((ASPxGridView)sender).EditFormLayoutProperties.FindColumnItem("clasificacion").Visible = false;
            ((ASPxGridView)sender).EditFormLayoutProperties.FindColumnItem("familia").Visible = false;

        }

        protected void ASPxGridView1_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            ((ASPxGridView)sender).EditFormLayoutProperties.FindColumnItem("fkey_familia").Visible = false;
        }


    }
}