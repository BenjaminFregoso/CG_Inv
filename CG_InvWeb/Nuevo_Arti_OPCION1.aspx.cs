using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CG_InvWeb {
    public partial class Nuevo_Arti_OPCION1 : System.Web.UI.Page
    {
        //public cdatos;
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

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridView2.ExpandAll();            
        }

        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            ASPxGridView2.CollapseAll();
        }

        protected void ASPxButton3_Click(object sender, EventArgs e)
        {
        }

    }
}