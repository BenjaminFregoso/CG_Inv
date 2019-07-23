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


namespace CG_InvWeb.Articulos
{
    public partial class Familias : System.Web.UI.Page
    {
        public Int64 nDepartamento = 0;
        public Int64 nClasificacion = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void ASPxGridView1_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e)
        {
            if (e.ErrorText.Contains("fkey_departamento"))
            {
                e.ErrorText = "No se ha seleccionado Departamento | Clasificaci�n | Familia";
            }
        }



        protected void ASPxGridView1_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {

            ((ASPxGridView)sender).EditFormLayoutProperties.FindColumnItem("departamento").Visible = false;
            ((ASPxGridView)sender).EditFormLayoutProperties.FindColumnItem("clasificacion").Visible = false;

        }



        protected void ASPxGridView1_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            ((ASPxGridView)sender).EditFormLayoutProperties.FindColumnItem("fkey_clasificacion").Visible = false;
        }

        protected void ASPxGridLookup1_ValueChanged(object sender, EventArgs e)
        {
            nClasificacion = Convert.ToInt64(((ASPxGridLookup)sender).Value.ToString());

            using (NpgsqlConnection sqlConnection1 = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ServerPostgreSql"].ConnectionString.ToString()))
            {
                sqlConnection1.Open();
                NpgsqlCommand cmd = new NpgsqlCommand();
                NpgsqlDataReader reader;

                //BUSCA CLASIFICACI�N SELECCIONADA PARA OBTENER EL DEPARTAMENTO 
                cmd.CommandText = "Select key_clasificacion,fkey_departamento from \"Clasificacion\" where key_clasificacion = @sParamClasificacion";
                cmd.CommandType = CommandType.Text;
                NpgsqlParameter Param1;
                Param1 = new NpgsqlParameter();
                Param1.ParameterName = "sParamClasificacion";
                Param1.NpgsqlDbType = NpgsqlDbType.Bigint;
                Param1.Value = nClasificacion;
                cmd.Parameters.Add(Param1);
                cmd.Connection = sqlConnection1;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    nDepartamento = Convert.ToInt64(reader["fkey_departamento"].ToString());
                }
                else
                {
                    nDepartamento = 0;
                }
                reader.Close();
                sqlConnection1.Close();
            }

            HttpContext.Current.Session["session_departamento"] = nDepartamento;
            HttpContext.Current.Session["session_clasificacion"] = nClasificacion;
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
            objeto.Bitacora("DELETE", e.Values["familia"].ToString() + " -- " + e.Values["fkey_clasificacion"].ToString() + " -- " + e.Values["fkey_departamento"].ToString(),"", usuario, "", "Familia");
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
            objeto.Bitacora("INSERT", "", e.NewValues["familia"].ToString() + " -- " + e.NewValues["fkey_clasificacion"].ToString() + " -- " + e.NewValues["fkey_departamento"].ToString(), usuario, "", "Familia");
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
            objeto.Bitacora("INSERT", e.OldValues["familia"].ToString() + " -- " + e.OldValues["fkey_clasificacion"].ToString() + " -- " + e.OldValues["fkey_departamento"].ToString(), e.NewValues["familia"].ToString() + " -- " + e.NewValues["fkey_clasificacion"].ToString() + " -- " + e.NewValues["fkey_departamento"].ToString(), usuario, "", "Familia");
            //TERMINA BITACORA #######################
        }
    }


}