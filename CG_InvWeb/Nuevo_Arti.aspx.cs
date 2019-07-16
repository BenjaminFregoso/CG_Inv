using DevExpress.Web;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Configuration;
using Npgsql;
using NpgsqlTypes;


namespace CG_InvWeb {
    public partial class Nuevo_Arti : System.Web.UI.Page
    {
        public string cCodigo = "";
        public Int32  nCodigo = 0;
        public Int64  nFamilia = 0;
        public Int64 nDepartamento = 0;
        public Int64 nClasificacion = 0;
        public Int64 nKey_articulos = 0;
        public string cTallas = "";
        public Int32 nTallas = 0;
        public string cFolioTalla = "";
        public string cColor = "";
        public Int32 nColor = 0;
        public string cFolioColor = "";

        protected void Page_Load(object sender, EventArgs e)
        {
        }


    protected void ASPxGridView1_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e)
        {
            if (e.ErrorText.Contains("fkey_departamento"))
            {
                e.ErrorText = "No se ha seleccionado Departamento | Clasificación | Familia";
            }
        }

        protected void ASPxGridView1_FocusedRowChanged(object sender, EventArgs e)
        {
            //int IndexRow = Convert.ToInt32(ASPxGridView1.FocusedRowIndex.ToString());
            //if (IndexRow < 0)
            //    return;

            //object values = ASPxGridView1.GetRowValues(IndexRow, "descripcion") as object;
            //string sDescripcion = values.ToString();
            //((ASPxGridView)sender).EditFormLayoutProperties.FindColumnItem("fkey_familia").Index = 43;
                


        }

        protected void ASPxGridView1_ProcessColumnAutoFilter(object sender, ASPxGridViewAutoFilterEventArgs e)
        {


            //if (e.Kind == GridViewAutoFilterEventKind.CreateCriteria && e.Column.FieldName == "departamento")
            //{
            //    string oldValue = Session["departamento_filter"] != null ? (string)Session["departamento_filter"] : string.Empty;
            //    Session["departamento_filter"] = e.Value;
            //    if (!object.Equals(oldValue, e.Value))
            //    {
            //        var ClasificacionColumn = (GridViewDataComboBoxColumn)ASPxGridView1.DataColumns["clasificacion"];
            //        ClasificacionColumn.PropertiesComboBox.RequireDataBinding();
            //        ASPxGridView1.AutoFilterByColumn(ClasificacionColumn, string.Empty);
            //    }
            //}

            //if (e.Kind == GridViewAutoFilterEventKind.CreateCriteria && e.Column.FieldName == "clasificacion")
            //{
            //    string oldValue = Session["clasificacion_filter"] != null ? (string)Session["clasificacion_filter"] : string.Empty;
            //    Session["clasificacion_filter"] = e.Value;
            //    if (!object.Equals(oldValue, e.Value))
            //    {
            //        var FamiliaColumn = (GridViewDataComboBoxColumn)ASPxGridView1.DataColumns["familia"];
            //        FamiliaColumn.PropertiesComboBox.RequireDataBinding();
            //        ASPxGridView1.AutoFilterByColumn(FamiliaColumn, string.Empty);
            //    }
            //}


        }

        protected void ASPxGridView1_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            //e.NewValues["fisica"] = (e.NewValues["fisica"] == null) ? 0 : e.NewValues["fisica"];
            //e.NewValues["moral"] = (e.NewValues["moral"] == null) ? 0 : e.NewValues["moral"];

            e.NewValues["fecha_alta"] = DateTime.Today;
            ((ASPxGridView)sender).EditFormLayoutProperties.FindColumnItem("Departamento").Visible = false;
            ((ASPxGridView)sender).EditFormLayoutProperties.FindColumnItem("Clasificación").Visible = false;
            ((ASPxGridView)sender).EditFormLayoutProperties.FindColumnItem("Familia").Visible = false;

            //((ASPxGridView)sender).EditFormLayoutProperties.Items[1].Visible = false;
            //((ASPxGridView)sender).EditFormLayoutProperties.Items[2].Visible = false;

        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //ASPxGridView1.GetMasterRowKeyValue();
            //string PerfilValue = e.Values[index].ToString();
            //e.NewValues["fisica"] = (e.NewValues["fisica"] == null) ? 0 : e.NewValues["fisica"];
            //e.NewValues["moral"] = (e.NewValues["moral"] == null) ? 0: e.NewValues["moral"];
            using (NpgsqlConnection sqlConnection1 = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ServerPostgreSql"].ConnectionString.ToString()))
            {
                sqlConnection1.Open();
                NpgsqlCommand cmd = new NpgsqlCommand();
                NpgsqlDataReader reader;

                //BUSCA ULTIMO CODIGO 
                cmd.CommandText = "Select codigo_articulo from \"Articulos\" order by codigo_articulo desc limit 1 ";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = sqlConnection1;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    cCodigo = reader["codigo_articulo"].ToString();
                }
                else
                {
                    cCodigo = "000000000";
                }
                reader.Close();
                sqlConnection1.Close();
            }

            nCodigo = Convert.ToInt32(cCodigo) + 1;
            cCodigo = "";
            cCodigo = String.Format("{0}{1}", cCodigo.PadLeft(9 - nCodigo.ToString().Length, '0'), nCodigo.ToString());
            e.NewValues["codigo_articulo"] = cCodigo;
        }

        protected void ASPxGridLookup2_ValueChanged(object sender, EventArgs e)
        {

            nFamilia = Convert.ToInt64(((ASPxGridLookup)sender).Value.ToString());

            using (NpgsqlConnection sqlConnection1 = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ServerPostgreSql"].ConnectionString.ToString()))
            {
                sqlConnection1.Open();
                NpgsqlCommand cmd = new NpgsqlCommand();
                NpgsqlDataReader reader;

                //BUSCA FAMILIA SELECCIONADA PARA OBTENER EL DEPARTAMENTO Y LA CLASIFICACIÓN 
                cmd.CommandText = "Select key_familia,fkey_clasificacion,fkey_departamento from \"Familia\" where key_familia = @sParamFamilia";                
                cmd.CommandType = CommandType.Text;
                NpgsqlParameter Param1;
                Param1 = new NpgsqlParameter();
                Param1.ParameterName = "sParamFamilia";
                Param1.NpgsqlDbType = NpgsqlDbType.Bigint;
                Param1.Value = nFamilia;
                cmd.Parameters.Add(Param1);
                cmd.Connection = sqlConnection1;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    nDepartamento = Convert.ToInt64(reader["fkey_departamento"].ToString());
                    nClasificacion = Convert.ToInt64(reader["fkey_clasificacion"].ToString());
                }
                else
                {
                    nDepartamento = 0;
                    nClasificacion = 0;
                }
                reader.Close();
                sqlConnection1.Close();
            }

            HttpContext.Current.Session["session_departamento"] = nDepartamento;
            HttpContext.Current.Session["session_clasificacion"] = nClasificacion;
            HttpContext.Current.Session["session_familia"] = nFamilia;

            
        }

        protected void ASPxGridView1_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            ((ASPxGridView)sender).EditFormLayoutProperties.FindColumnItem("fkey_familia").Visible = false;
            //((ASPxGridView)sender).EditFormLayoutProperties.Items[0].Visible = false;

        }

        protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["session_key_articulo"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void ASPxGridView2_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            using (NpgsqlConnection sqlConnection1 = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ServerPostgreSql"].ConnectionString.ToString()))
            {
                sqlConnection1.Open();
                NpgsqlCommand cmd = new NpgsqlCommand();
                NpgsqlDataReader reader;

                //BUSCA ARTICULO para traer el codigo_articulo
                cmd.CommandText = "Select tallas from \"Articulos_tallas\" where fkey_articulo = @sParamArticulo order by tallas desc limit 1";
                cmd.CommandType = CommandType.Text;
                NpgsqlParameter Param1;
                Param1 = new NpgsqlParameter();
                Param1.ParameterName = "sParamArticulo";
                Param1.NpgsqlDbType = NpgsqlDbType.Bigint;
                Param1.Value = Session["session_key_articulo"];
                cmd.Parameters.Add(Param1);
                cmd.Connection = sqlConnection1;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    cTallas = reader["tallas"].ToString();
                    
                }
                else
                {
                    reader.Close();
                    //BUSCA ARTICULO en tabla Articulos para traer el codigo_articulo
                    cmd.CommandText = "Select codigo_articulo from \"Articulos\" where key_articulo = @sParamArticulo";
                    cmd.Connection = sqlConnection1;
                    reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();
                        cTallas = reader["codigo_articulo"].ToString();
                    }
                }
                reader.Close();
                sqlConnection1.Close();
            }
            nTallas = cTallas.Length == 9 ? 1 : Convert.ToInt32(cTallas.Substring(cTallas.Length - 2, 2)) + 1;
            cTallas = String.Format("{0}{1}{2}", cTallas.Substring(0, 9), cFolioTalla.PadLeft(2 - nTallas.ToString().Length, '0'), nTallas.ToString());
            e.NewValues["tallas"] = cTallas;
            
        }

        protected void ASPxGridView2_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["fkey_articulo"] = Session["session_key_articulo"];
        }

        protected void ASPxGridView3_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["session_key_articulo"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void ASPxGridView3_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            using (NpgsqlConnection sqlConnection1 = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ServerPostgreSql"].ConnectionString.ToString()))
            {
                sqlConnection1.Open();
                NpgsqlCommand cmd = new NpgsqlCommand();
                NpgsqlDataReader reader;

                //BUSCA ARTICULO para traer el codigo_articulo
                cmd.CommandText = "Select color from \"Articulos_color\" where fkey_articulo = @sParamArticulo order by color desc limit 1";
                cmd.CommandType = CommandType.Text;
                NpgsqlParameter Param1;
                Param1 = new NpgsqlParameter();
                Param1.ParameterName = "sParamArticulo";
                Param1.NpgsqlDbType = NpgsqlDbType.Bigint;
                Param1.Value = Session["session_key_articulo"];
                cmd.Parameters.Add(Param1);
                cmd.Connection = sqlConnection1;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    cColor = reader["color"].ToString();

                }
                else
                {
                    reader.Close();
                    //BUSCA ARTICULO en tabla Articulos para traer el codigo_articulo
                    cmd.CommandText = "Select codigo_articulo from \"Articulos\" where key_articulo = @sParamArticulo";
                    cmd.Connection = sqlConnection1;
                    reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();
                        cColor = reader["codigo_articulo"].ToString();
                    }
                }
                reader.Close();
                sqlConnection1.Close();
            }
            nColor = cColor.Length == 9 ? 1 : Convert.ToInt32(cColor.Substring(cColor.Length - 2, 2)) + 1;
            cColor = String.Format("{0}{1}{2}", cColor.Substring(0, 9), cFolioColor.PadLeft(2 - nColor.ToString().Length, '0'), nColor.ToString());
            e.NewValues["color"] = cColor;
        }

        protected void ASPxGridView3_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["fkey_articulo"] = Session["session_key_articulo"];
        }


        protected void ASPxGridView4_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["fkey_articulo"] = Session["session_key_articulo"];
            //((ASPxGridView)sender).EditFormLayoutProperties.FindColumnItem("caracteristicas_det").Visible = true;
        }

        protected void ASPxGridView4_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["session_key_articulo"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void ASPxGridView4_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {

            if (!(sender as ASPxGridView).IsEditing || e.Column.FieldName != "caracteristica_det") return;
            if (e.KeyValue == DBNull.Value || e.KeyValue == null) return;
            object val = (sender as ASPxGridView).GetRowValuesByKeyValue(e.KeyValue, "caracteristica");
            if (val == DBNull.Value) return;
            string caracteristica = (string)val;
            
            ASPxComboBox combo = e.Editor as ASPxComboBox;
            FillDetalleCombo(combo, caracteristica);

            combo.Callback += new CallbackEventHandlerBase(cmbDetalle_OnCallback);
        }

        protected void FillDetalleCombo(ASPxComboBox cmb, string caracteristica)
        {
            if (string.IsNullOrEmpty(caracteristica)) return;

            List<string> detalle = GetDetalle(caracteristica);
            cmb.Items.Clear();
            foreach (string cDetCaracteristica in detalle)
                cmb.Items.Add(cDetCaracteristica);
        }
        List<string> GetDetalle(string caracteristica)
        {
            List<string> cListaText = new List<string>();
            //List<long> cListaValue = new List<long>();

            //using (var context = new WorldCitiesContext())
            //    return context.Cities.Where(c => c.Country.CountryName == country).OrderBy(c => c.CityName).Select(c => c.CityName).ToList();


            using (NpgsqlConnection sqlConnection1 = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ServerPostgreSql"].ConnectionString.ToString()))
            {
                sqlConnection1.Open();
                NpgsqlCommand cmd = new NpgsqlCommand();
                NpgsqlDataReader reader;

                //BUSCA ARTICULO para traer el codigo_articulo
                cmd.CommandText = "Select caracteristica,descripcion from \"Caracteristicas_det\", \"Caracteristicas\" where \"Caracteristicas_det\".fkey_caracteristicas = \"Caracteristicas\".key_caracteristicas and caracteristica = @sParamCaracteristica";
                cmd.CommandType = CommandType.Text;
                NpgsqlParameter Param1;
                Param1 = new NpgsqlParameter();
                Param1.ParameterName = "sParamCaracteristica";
                Param1.NpgsqlDbType = NpgsqlDbType.Varchar;
                Param1.Value = caracteristica;
                cmd.Parameters.Add(Param1);
                cmd.Connection = sqlConnection1;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        cListaText.Add(reader["descripcion"].ToString());
                        //cListaValue.Add(Convert.ToInt64(reader["key_caracteristicas_det"].ToString()));
                    }                                            
                }
                reader.Close();
                sqlConnection1.Close();
                return cListaText;                
            }
          
        }

        void cmbDetalle_OnCallback(object source, CallbackEventArgsBase e)
        {
            FillDetalleCombo(source as ASPxComboBox, e.Parameter);
        }

        protected void ASPxGridView4_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            //((ASPxGridView)sender).EditFormLayoutProperties.FindColumnItem("caracteristicas_det").Visible = false;
        }
    }


}