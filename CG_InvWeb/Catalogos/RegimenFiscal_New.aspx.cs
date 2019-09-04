﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CG_InvWeb.Catalogos
{
    public partial class RegimenFiscal_New : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //ASPxGridView1.GetMasterRowKeyValue();
            //string PerfilValue = e.Values[index].ToString();
            e.NewValues["fisica"] = (e.NewValues["fisica"] == null) ? 0 : e.NewValues["fisica"];
            e.NewValues["moral"] = (e.NewValues["moral"] == null) ? 0 : e.NewValues["moral"];
        }

        protected void ASPxGridView1_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["fisica"] = (e.NewValues["fisica"] == null) ? 0 : e.NewValues["fisica"];
            e.NewValues["moral"] = (e.NewValues["moral"] == null) ? 0 : e.NewValues["moral"];
            e.NewValues["fecha_ini"] = DateTime.Today;

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
            objeto.Bitacora("DELETE", e.Values["codigo_regimen_fiscal"].ToString() + " -- " + e.Values["descrip"].ToString() + " -- " + e.Values["fisica"].ToString() + " -- " + e.Values["moral"].ToString(), "", usuario, "", "c_Regimen_Fiscal");
            //TERMINA BITACORA #######################
        }

        protected void ASPxGridView1_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //c_Regimen_Fiscal&quot; (&quot;codigo_regimen_fiscal&quot;, &quot;descrip&quot;, &quot;fisica&quot;, &quot;moral&quot;
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
            objeto.Bitacora("INSERT", "", e.NewValues["codigo_regimen_fiscal"].ToString() + " -- " + e.NewValues["descrip"].ToString() + " -- " + e.NewValues["fisica"].ToString() + " -- " + e.NewValues["moral"].ToString(), usuario, "", "c_Regimen_Fiscal");
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
            objeto.Bitacora("UPDATE", e.OldValues["codigo_regimen_fiscal"].ToString() + " -- " + e.OldValues["descrip"].ToString() + " -- " + e.OldValues["fisica"].ToString() + " -- " + e.OldValues["moral"].ToString(), e.NewValues["codigo_regimen_fiscal"].ToString() + " -- " + e.NewValues["descrip"].ToString() + " -- " + e.NewValues["fisica"].ToString() + " -- " + e.NewValues["moral"].ToString(), usuario, "", "c_Regimen_Fiscal");
            //TERMINA BITACORA #######################
        }
    }
}