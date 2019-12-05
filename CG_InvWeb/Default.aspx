<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CG_InvWeb.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <style type="text/css">

        .auto-style11 {
            width: 275px;
        }
        .auto-style21 {
            width: 50px;
        }
        .auto-style22 {
            width: 50px;
            height: 60px;
        }
        .auto-style23 {
            height: 60px;
            width: 275px;
        }
        .auto-style26 {
            width: 50px;
            height: 80px;
            vertical-align:bottom;
            padding-top:20px;
        }
        .auto-style27 {
            height: 80px;
            vertical-align:bottom;
            padding-top:20px;
        }
        .auto-style28 {
            width: 275px;
            height: 80px;
            vertical-align:bottom;
            padding-top:20px;
        }
        .auto-style29 {
            width: 50px;
            height: 30px;
        }
        .auto-style30 {
            width: 275px;
            height: 30px;
        }
        </style>
</head>
<body style="background-image: url(../Images/fondo_ingreso.jpg); background-repeat:no-repeat; background-position:top" >
    <p>
        <br />
    </p>
    <form id="form1" runat="server">
    <div style="padding-top:10%; ">    
        <table style="margin:0 auto ; padding-top :20px; padding-left:120px; padding-right:120px; padding-bottom :20px; background-color:white; border-radius: 10px 10px;" > 
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style11"></td>
                <td class="auto-style21"></td>
            </tr>
            <tr>
                <td style="text-align:center; vertical-align:bottom;" class="auto-style27" colspan="3" >
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/ssc_logo.png" />
                </td>
            </tr>
            <tr>
                <td style="text-align:right; vertical-align:bottom;" class="auto-style27" >
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/usuario.png" />
                </td>
                <td style="vertical-align:bottom"; class="auto-style28" >
                    <dx:ASPxComboBox ID="ASPxComboUsu" runat="server" DataSourceID="SDataSourceUsu"  TextField="Usuario" ValueField="Usuario" OnSelectedIndexChanged="ASPxComboUsu_SelectedIndexChanged" style="margin-bottom: 7px" Width="271px" Caption="Usuario" Theme="iOS" Font-Names="Century Gothic" DropDownRows="5">
                        <CaptionSettings Position="Top" RequiredMarkDisplayMode="Required" ShowColon="False" />
                        <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                            <RequiredField ErrorText="Selecciona un usuario" IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style26"></td>
            </tr>
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style11"></td>
                <td class="auto-style21"></td>
            </tr>
            <tr>
                <td style="text-align:right; vertical-align:bottom;">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/password.png" />
                </td>
                <td class="auto-style11">
                    <dx:ASPxTextBox ID="ASPxTextPass" runat="server" Width="271px" Password="True" Caption="Contraseña" MaxLength="15" Theme="iOS" Font-Names="Century Gothic">
                        <CaptionSettings Position="Top" RequiredMarkDisplayMode="Required" ShowColon="False" />
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style21"></td>
            </tr>
            <tr>
                <td class="auto-style29"></td>
                <td class="auto-style30">
                    <dx:ASPxLabel ID="ASPxMensaje" runat="server" Text="Mensaje" Visible="False" ForeColor="#FF5050" Font-Bold="True" Font-Names="Century Gothic" Theme="iOS">
                    </dx:ASPxLabel>
                    <br />
                </td>
                <td class="auto-style29"></td>
            </tr>
            <tr>
                <td class="auto-style22"></td>
                <td style="vertical-align:top" class="auto-style23">
                    <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="Ingresar" Width="271px" AutoPostBack="False" Font-Names="Century Gothic" Height="40px" Theme="Default" Font-Bold="True" Font-Overline="False" Font-Size="Medium" Font-Underline="False"  >
                    </dx:ASPxButton>
                </td>
                <td class="auto-style22"></td>
            </tr>
            </table>
    </div>




    <asp:SqlDataSource ID="SDataSourceUsu" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" SelectCommand="SELECT &quot;usuario&quot; FROM &quot;Usuarios&quot;" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>"></asp:SqlDataSource>
    </form>
</body>
</html>
