using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web;
using System.Windows.Forms;

namespace CG_InvWeb
{
    public partial class Entradas_Inv : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void ASPxGridView1_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {

            // TextBox t = this.ASPxGridView1.FindControl("Mes") as TextBox;

        }

        protected void ASPxGridView1_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            if (e.ErrorText.Contains("Cannot insert duplicate key"))

            {
                e.ErrorText = "Ya existe esta obra";
            }


        }

        protected void ASPxGridView1_CustomErrorText1(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            if (e.ErrorText.Contains("Cannot insert duplicate key"))
            {
                e.ErrorText = "Ya existe este Perfil";
            }
        }

        protected void ASPxGridView1_CustomErrorText2(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            if (e.ErrorText.Contains("Cannot insert duplicate key"))
            {
                e.ErrorText = "Ya existe la Compañia";
            }
        }

        protected void ASPxGridView1_CustomErrorText3(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            if (e.ErrorText.Contains("Cannot insert duplicate key"))
            {
                e.ErrorText = "Ya existe un usuario con el mismo perfil";
            }
        }

    }
}