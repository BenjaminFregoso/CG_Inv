<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="CG_InvWeb.Catalogos.Proveedores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" CssClass="auto-style1" HeaderNavigateUrl="~/Catalogos/Proveedores.aspx" HeaderText="Proveedores" Height="100%" HorizontalAlign="Left" ShowCollapseButton="true" Theme="iOS" Width="100%">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Theme="Glass" Width="100%">
                    <Settings ShowFilterRow="True" />
                    <SettingsSearchPanel Visible="True" />
                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="Cuenta" ShowInCustomizationForm="True" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;c_Proveedores&quot; WHERE ((&quot;Cuenta&quot; = ?) OR (&quot;Cuenta&quot; IS NULL AND ? IS NULL)) AND &quot;key_proveedores&quot; = ?" InsertCommand="INSERT INTO &quot;c_Proveedores&quot; (&quot;Cuenta&quot;, &quot;Nombre&quot;, &quot;key_proveedores&quot;) VALUES (?, ?, ?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;Cuenta&quot;, &quot;Nombre&quot; FROM &quot;c_Proveedores&quot;" UpdateCommand="UPDATE &quot;c_Proveedores&quot; SET &quot;Nombre&quot; = ? WHERE ((&quot;Cuenta&quot; = ?) OR (&quot;Cuenta&quot; IS NULL AND ? IS NULL)) AND &quot;key_proveedores&quot; = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="cuenta" Type="String" />
                        <asp:Parameter Name="key_proveedores" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="cuenta" Type="String" />
                        <asp:Parameter Name="nombre" Type="String" />
                        <asp:Parameter Name="key_proveedores" Type="Int64" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="nombre" Type="String" />
                        <asp:Parameter Name="cuenta" Type="String" />
                        <asp:Parameter Name="key_proveedores" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>

</asp:Content>