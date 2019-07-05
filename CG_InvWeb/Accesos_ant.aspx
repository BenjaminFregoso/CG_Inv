<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Accesos_ant.aspx.cs" Inherits="CG_InvWeb.Accesos_ant" %>


<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <%-- DXCOMMENT: Configure ASPxGridView control --%>


<%-- DXCOMMENT: Configure your datasource for ASPxGridView --%>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSourceAccesos" KeyFieldName="index">
        <Settings ShowFilterRow="True" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="index" ReadOnly="True" VisibleIndex="1" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="2">
                <EditItemTemplate>
                    <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SDSourceUsuarios" Text='<%# Bind("Usuario", "{0}") %>' TextField="Usuario" ValueField="Usuario">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Usuario" />
                        </Columns>
                    </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="SDSourceUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Usuario] FROM [Usuarios]"></asp:SqlDataSource>
                </EditItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Obras" VisibleIndex="3">
                <EditItemTemplate>
                    <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" DataSourceID="SDataSourceObras" Text='<%# Bind("Obras", "{0}") %>' TextField="Obras" Value='<%# Eval("Obras") %>' ValueField="Obras">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Obras" />
                        </Columns>
                    </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="SDataSourceObras" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Obras] FROM [Obras]"></asp:SqlDataSource>
                </EditItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Compañias" VisibleIndex="4">
                <EditItemTemplate>
                    <dx:ASPxComboBox ID="ASPxComboBox3" runat="server" DataSourceID="SDSourceCias" Text='<%# Bind("Compañias", "{0}") %>' TextField="Compañia" ValueField="Compañia">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Compañia" />
                        </Columns>
                    </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="SDSourceCias" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Compañia] FROM [Compañias]"></asp:SqlDataSource>
                </EditItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Periodos" VisibleIndex="5">
                <PropertiesCheckEdit ValueChecked="">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SDSourceAccesos" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Accesos] WHERE [index] = @index" InsertCommand="INSERT INTO [Accesos] ([Usuario], [Obras], [Compañias], [Periodos]) VALUES (@Usuario, @Obras, @Compañias, @Periodos)" SelectCommand="SELECT * FROM [Accesos]" UpdateCommand="UPDATE [Accesos] SET [Usuario] = @Usuario, [Obras] = @Obras, [Compañias] = @Compañias, [Periodos] = @Periodos WHERE [index] = @index">
        <DeleteParameters>
            <asp:Parameter Name="index" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Usuario" Type="String" />
            <asp:Parameter Name="Obras" Type="String" />
            <asp:Parameter Name="Compañias" Type="String" />
            <asp:Parameter Name="Periodos" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Usuario" Type="String" />
            <asp:Parameter Name="Obras" Type="String" />
            <asp:Parameter Name="Compañias" Type="String" />
            <asp:Parameter Name="Periodos" Type="Boolean" />
            <asp:Parameter Name="index" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>