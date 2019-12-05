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
using System.Media;

namespace CG_InvWeb
{
    public partial class PruebasOC : System.Web.UI.Page
    {
        public Int64 iCC=0;
        public Int64 iOC=0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["fecha"] = DateTime.Today;
            e.NewValues["tipo"] = 1;
            e.NewValues["lugar_entrega"] = 1;
        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Int64 ioc = 0;
            Int64 iCC = 0;
            Decimal iDescto_unitario = 0;
            Decimal iDescto_global = 0;
            Decimal iDescto_notcred = 0;

            iCC = Convert.ToInt64(e.NewValues["key_centrocostos"].ToString());

            using (NpgsqlConnection sqlConnection1 = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ServerPostgreSql"].ConnectionString.ToString()))
            {
                sqlConnection1.Open();
                NpgsqlCommand cmd = new NpgsqlCommand();
                NpgsqlDataReader reader;

                //BUSCA ULTIMA OC de CC seleccionado
                cmd.CommandText = "Select oc from \"Orden_compra\" WHERE key_centrocostos = @iCC ORDER BY oc DESC limit 1 ";
                cmd.CommandType = CommandType.Text;
                NpgsqlParameter Param1;
                Param1 = new NpgsqlParameter();
                Param1.ParameterName = "iCC";
                Param1.NpgsqlDbType = NpgsqlDbType.Bigint;
                Param1.Value = iCC;
                cmd.Parameters.Add(Param1);
                cmd.Connection = sqlConnection1;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    ioc = Convert.ToInt64(reader["oc"].ToString());
                }
                else
                {
                    ioc = 0;
                }
                ioc++;
                e.NewValues["oc"] = ioc;
                reader.Close();
                cmd.Connection.Close();

                cmd.Connection.Open();
                cmd.CommandText = "Select descuento_unitario, descuento_global, descuento_notcred from \"Proveedores_condiciones\" WHERE fkey_proveedores = @fkey_proveedores ORDER BY fecha DESC limit 1 ";
                NpgsqlParameter Param2;
                Param2 = new NpgsqlParameter
                {
                    ParameterName = "fkey_proveedores",
                    NpgsqlDbType = NpgsqlDbType.Bigint,
                    Value = Convert.ToInt64(e.NewValues["fkey_proveedores"].ToString())
                };
                cmd.Parameters.Add(Param2);
                cmd.Connection = sqlConnection1;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    iDescto_unitario = Convert.ToDecimal(reader["descuento_unitario"].ToString());
                    iDescto_global = Convert.ToDecimal(reader["descuento_global"].ToString());
                    iDescto_notcred = Convert.ToDecimal(reader["descuento_notcred"].ToString());
                }
                else
                {
                    iDescto_unitario = 0;
                    iDescto_global = 0;
                    iDescto_notcred = 0;
                }
                reader.Close();
                sqlConnection1.Close();
                e.NewValues["descuento_unitario"] = iDescto_unitario;
                e.NewValues["descuento_global"] = iDescto_global;
                e.NewValues["descuento_notcred"] = iDescto_notcred;
            }

        }

        protected void ASPxGridView1_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //ASPxGridView1.FocusedRowIndex = 0;
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
                grid.SettingsText.PopupEditFormCaption = "Agregar || Orden de Compra";
            else
                grid.SettingsText.PopupEditFormCaption = "Editar  || Orden de Compra";

        }

        private void MsgBox(string sMessage)
        {
            string msg = "<script language=\"javascript\">";
            msg += "alert('" + sMessage + "');";
            msg += "</script>";
            Response.Write(msg);
        }

        protected void grdCliente_BeforePerformDataSelect(object sender, EventArgs e)
        {
            String sMasterKey = (sender as ASPxGridView).GetMasterRowKeyValue().ToString();
            Session["session_key_centrocostos"] = sMasterKey.Substring(0, sMasterKey.IndexOf("|"));
            Session["session_key_orden_compra"] = sMasterKey.Substring(sMasterKey.IndexOf("|") + 1, sMasterKey.Length - (sMasterKey.IndexOf("|") + 1));
            iCC = Convert.ToInt64(sMasterKey.Substring(0, sMasterKey.IndexOf("|")));
            iOC = Convert.ToInt64(sMasterKey.Substring(sMasterKey.IndexOf("|") + 1, sMasterKey.Length - (sMasterKey.IndexOf("|") + 1)));

        }

        protected void grdCliente_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            try
            {
                if (e.Column.FieldName == "fkey_articulos_color")
                {
                    var cmbCombo = (ASPxComboBox)e.Editor;
                    cmbCombo.Callback += CmbCombo_Callback;
                }

                if (e.Column.FieldName == "fkey_articulos_tallas")
                {
                    var tallacmbCombo = (ASPxComboBox)e.Editor;
                    tallacmbCombo.Callback += TallaCmbCombo_Callback;
                }


            }
            catch (Exception)
            {

                throw;
            }
        }

        private void CmbCombo_Callback(object sender, CallbackEventArgsBase e)
        {
            var varPais = -1;
            Int32.TryParse(e.Parameter, out varPais);
            SDS_Colores.FilterExpression = string.Format("fkey_articulo = {0}", varPais);
            ASPxComboBox cmbCombo = sender as ASPxComboBox;
            cmbCombo.DataSourceID = "SDS_Colores";
            cmbCombo.DataBind();
        }
        private void TallaCmbCombo_Callback(object sender, CallbackEventArgsBase e)
        {
            var varPais = -1;
            Int32.TryParse(e.Parameter, out varPais);
            SDS_Tallas.FilterExpression = string.Format("fkey_articulo = {0}", varPais);
            ASPxComboBox tallacmbCombo = sender as ASPxComboBox;
            tallacmbCombo.DataSourceID = "SDS_Tallas";
            tallacmbCombo.DataBind();
        }
        protected void grdCliente_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["fecha_entrega"] = DateTime.Today.AddDays(10);
            e.NewValues["partida"] = 0;
        }

        protected void grdCliente_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["fkey_centrocostos"] = iCC;
            e.NewValues["fkey_orden_compra"] = iOC;

            using (NpgsqlConnection sqlConnection1 = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ServerPostgreSql"].ConnectionString.ToString()))
            {
                sqlConnection1.Open();
                NpgsqlCommand cmd = new NpgsqlCommand();
                NpgsqlDataReader reader;

                //BUSCA ULTIMA OC de CC seleccionado
                cmd.CommandText = "Select max(partida) as partida from \"Orden_compra_det\" WHERE fkey_centrocostos = @iCC and fkey_orden_compra = @iOC";
                cmd.CommandType = CommandType.Text;
                NpgsqlParameter Param1;
                Param1 = new NpgsqlParameter();
                Param1.ParameterName = "iCC";
                Param1.NpgsqlDbType = NpgsqlDbType.Bigint;
                Param1.Value = iCC;
                cmd.Parameters.Add(Param1);
                NpgsqlParameter Param2;
                Param2 = new NpgsqlParameter();
                Param2.ParameterName = "iOC";
                Param2.NpgsqlDbType = NpgsqlDbType.Bigint;
                Param2.Value = iOC;
                cmd.Parameters.Add(Param2);
                cmd.Connection = sqlConnection1;
                reader = cmd.ExecuteReader();
                

                if (reader.HasRows) 
                {
                    reader.Read();                    
                    e.NewValues["partida"] = (string.IsNullOrEmpty(reader["partida"].ToString()) ? 1 : Convert.ToInt32(reader["partida"]) + 1);
                }
                else
                {
                    e.NewValues["partida"] = 1;
                }
                reader.Close();
                cmd.Connection.Close();
                sqlConnection1.Close();
            }
        }
    }
}