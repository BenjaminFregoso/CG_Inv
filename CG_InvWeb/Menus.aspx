<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Menus.aspx.cs" Inherits="CG_InvWeb.Menus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
        Principal{
        width:80%;
        margin-top:20px;
        padding-left:20px;
        padding-top:20px;
    }
    .auto-style1 {
        margin-left: 0px;
        vertical-align:text-top;
        text-align:left;
    }
</style> 
<div class="Principal">          
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Asigna accesos" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" AllowCollapsingByHeaderClick="True" HeaderNavigateUrl="~/Menus.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDataSourceMenus" KeyFieldName="Index" OnRowDeleted="ASPxGridView1_RowDeleted" OnRowInserted="ASPxGridView1_RowInserted" OnRowUpdated="ASPxGridView1_RowUpdated" OnCustomErrorText="ASPxGridView1_CustomErrorText" style="margin-left: 0px" Theme="Glass" Width="100%" Font-Names="Century Gothic">
                    <ClientSideEvents BatchEditEndEditing="function(s, e) {
                        var capa = document.getElementById(&quot;BtnGuardar&quot;); &nbsp; 
                        capa.click();
                        alert(&quot;aaa&quot;);
                        }" BatchEditRowValidating="function(s, e) {
	                        var capa = document.getElementById(&quot;BtnGuardar&quot;); &nbsp; 
                        capa.click();
                        alert(&quot;aaa&quot;);
                        }" />
                    <SettingsPager PageSize="25">
                    </SettingsPager>
                    <SettingsEditing Mode="PopupEditForm">
                    </SettingsEditing>
                    <Settings ShowFilterRow="True" />
                    <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true"  ConfirmDelete="True" />
                    <SettingsPopup>
                        <EditForm AllowResize="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </SettingsPopup>
                    <SettingsSearchPanel Visible="True" />
                    <EditFormLayoutProperties ColCount="2" RequiredMarkDisplayMode="Auto" ShowItemCaptionColon="False">
                        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" />
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonType="Image">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="menup" VisibleIndex="1" SortIndex="1" SortOrder="Ascending" Caption="MenuP">
                            <PropertiesTextEdit MaxLength="20">
                            </PropertiesTextEdit>
                            <EditCellStyle Font-Names="Century Gothic">
                            </EditCellStyle>
                            <EditFormCaptionStyle Font-Names="Century Gothic">
                            </EditFormCaptionStyle>
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox3" runat="server" Text='<%# Bind("MenuP", "{0}") %>' OnSelectedIndexChanged="ASPxComboBox3_SelectedIndexChanged" Value='<%# Eval("MenuP") %>'  Font-Names="Century Gothic" Theme="iOS">
                                    <Items>
                                        <dx:ListEditItem Text="Catalogos" Value="0" />
                                        <dx:ListEditItem Text="Procesos" Value="1" />
                                        <dx:ListEditItem Text="Reportes" Value="3" />
                                        <dx:ListEditItem Text="Configuracion" Value="2" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </EditItemTemplate>
                            <HeaderStyle Font-Names="Century Gothic" />
                            <CellStyle Font-Names="Century Gothic">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="menu" VisibleIndex="2" SortIndex="2" SortOrder="Ascending" Caption="Menu" >
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ruta" VisibleIndex="3" Caption="Ruta">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="perfil" VisibleIndex="4" SortIndex="0" SortOrder="Ascending" Caption="Perfil">
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" DataSourceID="SqlDataSourcePerfil" Text='<%# Bind("perfil", "{0}") %>' TextField="Perfil" ValueField="Perfil"  Font-Names="Century Gothic" Theme="iOS">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SqlDataSourcePerfil" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" SelectCommand="SELECT &quot;Perfil&quot; FROM &quot;Perfil&quot;" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <EditCellStyle Font-Names="Century Gothic">
                            </EditCellStyle>
                            <EditFormCaptionStyle Font-Names="Century Gothic">
                            </EditFormCaptionStyle>
                            <HeaderStyle Font-Names="Century Gothic" />
                            <CellStyle Font-Names="Century Gothic">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn FieldName="activo" VisibleIndex="5" Caption="Activo">
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataTextColumn FieldName="key_menu" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False" Caption="key_menu">
                        </dx:GridViewDataTextColumn>
                </Columns>
                    <SettingsCommandButton>
                        <NewButton>
                            <Image ToolTip="Nuevo registro" Url="Images/nuevo.png" />
                        </NewButton>
                        <EditButton>
                            <Image ToolTip="Modificar registro" Url="Images/edit.png" />
                        </EditButton>
                        <DeleteButton>
                            <Image ToolTip="Borrar registro" Url="Images/eliminar.png"/>
                        </DeleteButton>
                        <UpdateButton ButtonType="Image">
                            <Image ToolTip="Actualizar registro" Url="Images/guardar.png" />
                        </UpdateButton>
                        <CancelButton ButtonType="Image">
                            <Image ToolTip="Deshacer cambios" Url="Images/cancel.png" />
                        </CancelButton>
                    </SettingsCommandButton>
            </dx:ASPxGridView>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <asp:SqlDataSource ID="SDataSourceMenus" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" DeleteCommand="DELETE FROM &quot;Menus&quot; WHERE &quot;key_menu&quot; = @key_menu" InsertCommand="INSERT INTO &quot;Menus&quot; (&quot;menup&quot;, &quot;menu&quot;, &quot;ruta&quot;, &quot;activo&quot;, &quot;perfil&quot;) VALUES (@menup, @menu, @ruta, @activo, @perfil)" SelectCommand="SELECT * FROM &quot;Menus&quot;" UpdateCommand="UPDATE &quot;Menus&quot; SET &quot;menup&quot; = @menup, &quot;menu&quot; = @menu, &quot;ruta&quot; = @ruta, &quot;activo&quot; = @activo, &quot;perfil&quot; = @perfil WHERE &quot;key_menu&quot; = @key_menu" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>">
        <DeleteParameters>
            <asp:Parameter Name="key_menu" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="menum" Type="String" />
            <asp:Parameter Name="menu" Type="String" />
            <asp:Parameter Name="ruta" Type="String" />
            <asp:Parameter Name="activo" Type="Boolean" />
            <asp:Parameter Name="perfil" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="menup" Type="String" />
            <asp:Parameter Name="menu" Type="String" />
            <asp:Parameter Name="ruta" Type="String" />
            <asp:Parameter Name="activo" Type="Boolean" />
            <asp:Parameter Name="perfil" Type="String" />
            <asp:Parameter Name="key_menu" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
</div>
</asp:Content>
