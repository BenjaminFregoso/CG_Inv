<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Pruebas.aspx.cs" Inherits="CG_InvWeb.Pruebas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="true" Theme="MetropolisBlue" Width="200px" HeaderText="Pruebas">
        <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="key_banco" Theme="iOS">
        <Settings ShowFilterRow="True" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="key_banco" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="banco" ShowInCustomizationForm="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="descrip" ShowInCustomizationForm="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
            </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" DeleteCommand="DELETE FROM &quot;c_Bancos&quot; WHERE &quot;key_banco&quot; = ? AND ((&quot;banco&quot; = ?) OR (&quot;banco&quot; IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO &quot;c_Bancos&quot; (&quot;key_banco&quot;, &quot;banco&quot;, &quot;descrip&quot;) VALUES (?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT &quot;key_banco&quot;, &quot;banco&quot;, &quot;descrip&quot; FROM &quot;c_Bancos&quot;" UpdateCommand="UPDATE &quot;c_Bancos&quot; SET &quot;descrip&quot; = ? WHERE &quot;key_banco&quot; = ? AND ((&quot;banco&quot; = ?) OR (&quot;banco&quot; IS NULL AND ? IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="key_banco" Type="Int64" />
            <asp:Parameter Name="banco" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="key_banco" Type="Int64" />
            <asp:Parameter Name="banco" Type="String" />
            <asp:Parameter Name="descrip" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="descrip" Type="String" />
            <asp:Parameter Name="key_banco" Type="Int64" />
            <asp:Parameter Name="banco" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

