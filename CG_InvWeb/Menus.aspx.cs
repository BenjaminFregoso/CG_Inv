using System;
using System.Xml.Linq;
using System.Xml;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using DevExpress.Web;

namespace CG_InvWeb
{
    public partial class Menus : System.Web.UI.Page
    {
        private DataTable dataTableb = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            int index = ASPxGridView1.AllColumns["perfil"].Index -2;
            string PerfilValue = e.NewValues[index].ToString();

            GenerMenuXML(PerfilValue);
        }

        private void GenerMenuXML(string PerfilValue)
        {
            //string connString = @"your connection string here";
            string query = "Select rtrim(ltrim(menu)) menu,rtrim(ltrim(menup)) menup,rtrim(ltrim(ruta)) ruta from menus where perfil ='" + PerfilValue + "'";

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString());
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();

            // create data adapter
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            // this will query your database and return the result to your datatable
            da.Fill(dataTableb);
            conn.Close();
            da.Dispose();

            // DataRow row = dataTableb.Rows[0];

            // TxtNombre.Text = row["Menup"].ToString();

            XDocument documeto = new XDocument(
                  new XDeclaration("1.0", "utf-8", null),
            new XElement("menu",

            new XElement("group", new XAttribute("Text", "Catálogos"),
                from p in dataTableb.AsEnumerable()
                where p.Field<string>("Menup").Trim() == "Catálogos"
                select new XElement("item",
                    new XAttribute("Text", p["menu"]), new XAttribute("NavigateUrl", p["Ruta"]))),

            new XElement("group", new XAttribute("Text", "Procesos"),
                from p in dataTableb.AsEnumerable()
                where p.Field<string>("Menup") == "Procesos"
                select new XElement("item",
                    new XAttribute("Text", p["menu"]), new XAttribute("NavigateUrl", p["Ruta"]))),

             new XElement("group", new XAttribute("Text", "Consultas"),
                from p in dataTableb.AsEnumerable()
                where p.Field<string>("Menup") == "Consultas"
                select new XElement("item",
                    new XAttribute("Text", p["menu"]), new XAttribute("NavigateUrl", p["Ruta"]))),


              new XElement("group", new XAttribute("Text", "Configuración"),
                from p in dataTableb.AsEnumerable()
                where p.Field<string>("Menup") == "Configuración"
                select new XElement("item",
                    new XAttribute("Text", p["menu"]), new XAttribute("NavigateUrl", p["Ruta"])))

                    ));

            documeto.Save(@"App_Data\"+ PerfilValue +".xml");
            
        }

        protected void ASPxGridView1_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //GridViewDataColumn col = ((ASPxGridView)sender).Columns["perfil"] as DevExpress.Web.GridViewDataColumn;
            //col.EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.True;
            //int index = col.VisibleIndex;

            int index = ASPxGridView1.AllColumns["perfil"].Index - 3;
            string PerfilValue = e.NewValues[index].ToString();

            GenerMenuXML(PerfilValue);
        }

        protected void ASPxGridView1_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            

            int index = ASPxGridView1.AllColumns["perfil"].Index - 1;
            string PerfilValue = e.Values[index].ToString();

            GenerMenuXML(PerfilValue);
        }

        protected void ASPxComboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            if (e.ErrorText.Contains("Cannot insert duplicate key"))
            {
                e.ErrorText = "Ya existe un menu con el mismo perfil";
            }
        }
    }
}