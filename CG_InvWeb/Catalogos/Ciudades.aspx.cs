﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CG_InvWeb.Catalogos
{
    public partial class Ciudades : System.Web.UI.Page
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
            if (e.ErrorText.Contains("c_Ciudades_pkey"))
            {
                e.ErrorText = "Ya existe la ciudad que estás tratando de agregar";
            }
        }

    }
}