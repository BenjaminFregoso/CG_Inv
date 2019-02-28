<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ImportaXML.aspx.cs" Inherits="CG_InvWeb.ImportaXML" %>

<%--<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

.dxeTrackBar_BlackGlass, 
.dxeIRadioButton_BlackGlass, 
.dxeButtonEdit_BlackGlass, 
.dxeTextBox_BlackGlass, 
.dxeRadioButtonList_BlackGlass, 
.dxeCheckBoxList_BlackGlass, 
.dxeMemo_BlackGlass, 
.dxeListBox_BlackGlass, 
.dxeCalendar_BlackGlass, 
.dxeColorTable_BlackGlass
{
	-webkit-tap-highlight-color: rgba(0,0,0,0);
}

.dxeListBox_BlackGlass
{
	background-color: white;
	border: 1px solid #A0A0A0;
	color: Black;
	font: 12px Tahoma, Geneva, sans-serif;
	}

.dxlbd { /*Bootstrap correction*/
    -webkit-box-sizing: content-box;
    -moz-box-sizing: content-box;
    box-sizing: content-box;
}

.dxeListBoxItemRow_BlackGlass
{
	cursor: default;
}
.dxeListBoxItemSelected_BlackGlass     
{
	background-color: #e0eaec;
}
.dxeListBoxItem_BlackGlass
{
	border: 1px solid white;
	padding: 2px 2px 3px 3px;
	white-space: nowrap;
	text-align: left;
}
        </style>
</head>
<body>
<form id="form1" runat="server">--%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="Principal">    
        <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="Ejecutar" Theme="iOS" Width="458px">
        </dx:ASPxButton>
        <br />
        <br />
        <dx:ASPxButton ID="ASPxButton2" runat="server" OnClick="ASPxButton2_Click" Text="Limpiar" Theme="iOS" Width="459px">
        </dx:ASPxButton>
        <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSourceAchivosXML" EnableTheming="True" Theme="Glass">
            <Settings ShowFilterRow="True" />
            <SettingsSearchPanel Visible="True" />
            <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true"  ConfirmDelete="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ReceptorNombre" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EmisorNombre" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NumSeguridadSocial" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaPago" VisibleIndex="4">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="NumDiasPagados" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn FieldName="ArchivoXML" VisibleIndex="1">
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SDSourceAchivosXML" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [ArchivosXML]" ProviderName="System.Data.SqlClient">
        </asp:SqlDataSource>
        <br />
        <br />
    </div>
</asp:Content>
<%--</form>
</body>
</html>--%>
