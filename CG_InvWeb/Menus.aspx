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
                        <dx:GridViewDataTextColumn FieldName="Index" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MenuP" VisibleIndex="2" SortIndex="1" SortOrder="Ascending">
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox3" runat="server" Text='<%# Bind("MenuP", "{0}") %>' OnSelectedIndexChanged="ASPxComboBox3_SelectedIndexChanged" Value='<%# Eval("MenuP") %>'  Font-Names="Century Gothic" Theme="iOS">
                                    <Items>
                                        <dx:ListEditItem Text="Catálogos" Value="0" />
                                        <dx:ListEditItem Text="Procesos" Value="1" />
                                        <dx:ListEditItem Text="Reportes" Value="3" />
                                        <dx:ListEditItem Text="Configuracion" Value="2" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </EditItemTemplate>
                            <EditCellStyle Font-Names="Century Gothic">
                            </EditCellStyle>
                            <EditFormCaptionStyle Font-Names="Century Gothic">
                            </EditFormCaptionStyle>
                            <HeaderStyle Font-Names="Century Gothic" />
                            <CellStyle Font-Names="Century Gothic">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Menu" VisibleIndex="3" SortIndex="2" SortOrder="Ascending" >
                            <PropertiesTextEdit MaxLength="20">
                            </PropertiesTextEdit>
                            <EditCellStyle Font-Names="Century Gothic">
                            </EditCellStyle>
                            <EditFormCaptionStyle Font-Names="Century Gothic">
                            </EditFormCaptionStyle>
                            <HeaderStyle Font-Names="Century Gothic" />
                            <CellStyle Font-Names="Century Gothic">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Ruta" VisibleIndex="4">
                            <PropertiesTextEdit MaxLength="50">
                            </PropertiesTextEdit>
                            <EditCellStyle Font-Names="Century Gothic">
                            </EditCellStyle>
                            <EditFormCaptionStyle Font-Names="Century Gothic">
                            </EditFormCaptionStyle>
                            <HeaderStyle Font-Names="Century Gothic" />
                            <CellStyle Font-Names="Century Gothic">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn FieldName="Activo" VisibleIndex="5" Visible="False">
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataTextColumn FieldName="perfil" VisibleIndex="6" SortIndex="0" SortOrder="Ascending">
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" DataSourceID="SqlDataSourcePerfil" Text='<%# Bind("perfil", "{0}") %>' TextField="Perfil" ValueField="Perfil"  Font-Names="Century Gothic" Theme="iOS">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SqlDataSourcePerfil" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Perfil] FROM [Perfil]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <EditCellStyle Font-Names="Century Gothic">
                            </EditCellStyle>
                            <EditFormCaptionStyle Font-Names="Century Gothic">
                            </EditFormCaptionStyle>
                            <HeaderStyle Font-Names="Century Gothic" />
                            <CellStyle Font-Names="Century Gothic">
                            </CellStyle>
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
    <asp:SqlDataSource ID="SDataSourceMenus" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Menus] WHERE [Index] = @Index" InsertCommand="INSERT INTO [Menus] ([MenuP], [Menu], [Ruta], [Activo], [perfil]) VALUES (@MenuP, @Menu, @Ruta, @Activo, @perfil)" SelectCommand="SELECT * FROM [Menus]" UpdateCommand="UPDATE [Menus] SET [MenuP] = @MenuP, [Menu] = @Menu, [Ruta] = @Ruta, [Activo] = @Activo, [perfil] = @perfil WHERE [Index] = @Index">
        <DeleteParameters>
            <asp:Parameter Name="Index" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MenuP" Type="String" />
            <asp:Parameter Name="Menu" Type="String" />
            <asp:Parameter Name="Ruta" Type="String" />
            <asp:Parameter Name="Activo" Type="Boolean" />
            <asp:Parameter Name="perfil" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MenuP" Type="String" />
            <asp:Parameter Name="Menu" Type="String" />
            <asp:Parameter Name="Ruta" Type="String" />
            <asp:Parameter Name="Activo" Type="Boolean" />
            <asp:Parameter Name="perfil" Type="String" />
            <asp:Parameter Name="Index" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
</asp:Content>
