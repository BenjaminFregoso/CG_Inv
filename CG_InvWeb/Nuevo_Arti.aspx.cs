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
        public Int32 nCodigo = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


    protected void ASPxGridView1_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e)
        {
            if (e.ErrorText.Contains("Cannot insert duplicate key"))
            {
                e.ErrorText = "Ya existe un perfil con el mismo nombre";
            }
        }

        protected void ASPxGridView1_FocusedRowChanged(object sender, EventArgs e)
        {
                //int IndexRow = Convert.ToInt32(ASPxGridView1.FocusedRowIndex.ToString());
                //if (IndexRow < 0)
                //    return;

                //object values = ASPxGridView1.GetRowValues(IndexRow, "descripcion") as object;
                //string sDescripcion = values.ToString();
        }

        protected void ASPxGridView1_BeforePerformDataSelect(object sender, EventArgs e)
        {
            {
                Session["fkey_familia"] = (sender as ASPxGridView).GetMasterRowKeyValue();
            }
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


        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Funciones_globales objetoFunGlobal = new Funciones_globales();
            var conexion = objetoFunGlobal.ConectarPostgresql();

            NpgsqlCommand cmd = new NpgsqlCommand();
            NpgsqlDataReader reader;

                //BUSCA ULTIMO CODIGO 
                cmd.CommandText = "Select codigo_articulo from \"Articulos\" order by codigo_articulo desc limit 1";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conexion;
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
                conexion.Close();
            

            nCodigo = Convert.ToInt32(cCodigo) + 1;
            cCodigo = "";
            cCodigo = String.Format("{0}{1}", cCodigo.PadLeft(9 - nCodigo.ToString().Length, '0'), nCodigo.ToString());
            e.NewValues["codigo_articulo"] = cCodigo;

            //BITACORA || NOTA: HACERLO MAS GENERAL
            Funciones_globales jobj = new Funciones_globales();
            jobj.Bitacora("INSERT ARTICULO", "", "codigo_articulo: "+cCodigo.ToString(), System.Web.HttpContext.Current.Session["Usuario"].ToString(), "");
            
        }



    }


}