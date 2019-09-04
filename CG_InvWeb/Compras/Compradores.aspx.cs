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
    
    public partial class Compradores : System.Web.UI.Page
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

        protected void ASPxGridView1_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            

            using (NpgsqlConnection sqlConnection1 = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ServerPostgreSql"].ConnectionString.ToString()))
            {
                sqlConnection1.Open();
                NpgsqlCommand cmd = new NpgsqlCommand();
                NpgsqlDataReader reader;
                
                //BUSCA ARTICULO para traer el codigo_articulo
                cmd.CommandText = "Select key_compradores from \"Compradores\" where fkey_usuario = @sParamfkey_usuario and fkey_centrocostos = @sParamfkey_centrocostos";
                cmd.CommandType = CommandType.Text;

                NpgsqlParameter Param1;
                Param1 = new NpgsqlParameter();
                Param1.ParameterName = "sParamfkey_usuario";
                Param1.NpgsqlDbType = NpgsqlDbType.Bigint;
                Param1.Value = Convert.ToInt64(e.NewValues["fkey_usuario"].ToString());
                cmd.Parameters.Add(Param1);

                NpgsqlParameter Param2;
                Param2 = new NpgsqlParameter();
                Param2.ParameterName = "sParamfkey_centrocostos";
                Param2.NpgsqlDbType = NpgsqlDbType.Bigint;
                Param2.Value = Convert.ToInt64(e.NewValues["fkey_centrocostos"].ToString());
                cmd.Parameters.Add(Param2);

                cmd.Connection = sqlConnection1;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    nKey_compradores = Convert.ToInt64(reader["key_compradores"].ToString());
                }
                reader.Close();
                sqlConnection1.Close();
            }


            using (NpgsqlConnection sqlConnection1 = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ServerPostgreSql"].ConnectionString.ToString()))
            {
                sqlConnection1.Open();
                NpgsqlCommand cmd = new NpgsqlCommand();

                cmd.CommandText = "INSERT INTO \"Compradores_det\" (fkey_compradores, fkey_departamento) SELECT @sParamfkey_compradores,key_departamento from \"Departamento\" ";
                cmd.CommandType = CommandType.Text;

                NpgsqlParameter Param1;
                Param1 = new NpgsqlParameter();
                Param1.ParameterName = "sParamfkey_compradores";
                Param1.NpgsqlDbType = NpgsqlDbType.Bigint;
                Param1.Value = nKey_compradores;
                cmd.Parameters.Add(Param1);

                cmd.Connection = sqlConnection1;
                cmd.ExecuteNonQuery();
                sqlConnection1.Close();

            }


        }

        protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["session_key_compradores"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void ASPxGridView2_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "fkey_departamento")
            {
                e.Editor.Enabled = false;
                e.Editor.ReadOnly = true;
            }

        }
    }
}