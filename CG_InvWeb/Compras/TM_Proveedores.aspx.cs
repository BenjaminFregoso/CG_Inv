using DevExpress.Web;
using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CG_InvWeb.Compras
{
    
    public partial class TM_Proveedores : System.Web.UI.Page
    {
        public Int64 nKey_compradores;
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

            e.NewValues["es_factura"] = 0;
            e.NewValues["obliga_cfdi_captura"] = 0;
            e.NewValues["obliga_cfdi_autoriza"] = 0;
            e.NewValues["obliga_cfdi_pago"] = 0;
            e.NewValues["valida_recibido_captura"] = 0;
            e.NewValues["valida_recibido_autoriza"] = 0;
            e.NewValues["valida_recibido_pago"] = 0;
            e.NewValues["obliga_oc"] = 0;

        }

        protected void ASPxGridView1_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e)
        {
            if (e.ErrorText.Contains("Cannot insert duplicate key"))
            {
                e.ErrorText = "No es posible duplicar el registro";
            }
            if (e.ErrorText.Contains("c_Almacen_almacen_key"))
            {
                e.ErrorText = "Ya existe el código del Almacén que estás tratando de agregar";
            }



        }

        protected void ASPxGridView1_BeforeGetCallbackResult(object sender, EventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            if (grid.IsNewRowEditing)
                grid.SettingsText.PopupEditFormCaption = "Agregar || Representantes";
            else
                grid.SettingsText.PopupEditFormCaption = "Editar  || Representantes";

        }
    }
}