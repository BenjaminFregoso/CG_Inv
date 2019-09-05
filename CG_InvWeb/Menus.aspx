<%@ Page Title="Accesos por Perfil" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Menus.aspx.cs" Inherits="CG_InvWeb.Menus" %>
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

    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Accesos por Perfil" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Menus.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDataSourceMenus" KeyFieldName="Index" OnRowDeleted="ASPxGridView1_RowDeleted" OnRowInserted="ASPxGridView1_RowInserted" OnRowUpdated="ASPxGridView1_RowUpdated" OnCustomErrorText="ASPxGridView1_CustomErrorText" Theme="MaterialCompact" KeyboardSupport="True" Width="100%" >

                    <Columns>
                        <dx:GridViewCommandColumn Visible="false" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonType="Image">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="MenuP" VisibleIndex="2" SortIndex="1" SortOrder="Ascending">
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox3" runat="server" Text='<%# Bind("MenuP", "{0}") %>' OnSelectedIndexChanged="ASPxComboBox3_SelectedIndexChanged" Value='<%# Eval("MenuP") %>'  Font-Names="Open Sans" Theme="Glass">
                                    <Items>
                                        <dx:ListEditItem Text="Catalogos" Value="0" />
                                        <dx:ListEditItem Text="Procesos" Value="1" />
                                        <dx:ListEditItem Text="Reportes" Value="3" />
                                        <dx:ListEditItem Text="Configuracion" Value="2" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </EditItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="menu" VisibleIndex="2" Caption="Menu" >
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ruta" VisibleIndex="3" Caption="Ruta">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="perfil" VisibleIndex="4" Caption="Perfil">
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" DataSourceID="SqlDataSourcePerfil" Text='<%# Bind("perfil", "{0}") %>' TextField="Perfil" ValueField="Perfil" Theme="MaterialCompact">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SqlDataSourcePerfil" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" SelectCommand="SELECT &quot;Perfil&quot; FROM &quot;Perfil&quot;" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>"></asp:SqlDataSource>
                            </EditItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn FieldName="activo" VisibleIndex="5" Caption="Activo">
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataTextColumn FieldName="key_menu" VisibleIndex="6" Caption="key_menu">
                        </dx:GridViewDataTextColumn>
                </Columns>

                    <SettingsPopup>
                        <EditForm CloseOnEscape="True" AllowResize="True" ShowCollapseButton="True" ShowMaximizeButton="True" ShowPinButton="True" ShowShadow="True" ShowViewportScrollbarWhenModal="True" HorizontalAlign="LeftSides" ShowFooter="True" ShowPageScrollbarWhenModal="True" VerticalAlign="Above">
                            <SettingsAdaptivity Mode="OnWindowInnerWidth" />
                        </EditForm>
                    </SettingsPopup>

                    <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="DataAware" FileName="Empresas">
                    </SettingsExport>

                    <SettingsSearchPanel ShowApplyButton="True" ShowClearButton="True" />

                    <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="True">
                        <AdaptiveDetailLayoutProperties ShowItemCaptionColon="False">
                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="800">
                            </SettingsAdaptivity>                    
                        </AdaptiveDetailLayoutProperties>
                    </SettingsAdaptivity>

                    <SettingsPager Mode="ShowPager" Position ="Top" PageSize="100">
                        <FirstPageButton Visible="True">
                        </FirstPageButton>
                        <LastPageButton Visible="True">
                        </LastPageButton>
                        <NextPageButton Visible="False">
                        </NextPageButton>
                        <PrevPageButton Visible="False">
                        </PrevPageButton>
                        <PageSizeItemSettings Visible="True" Items="10, 50, 100, 200, 500">
                        </PageSizeItemSettings>
                    </SettingsPager>

                    <SettingsEditing Mode="PopupEditForm">
                    </SettingsEditing>

                    <Settings ShowHeaderFilterButton="True" ShowHeaderFilterBlankItems="false" ShowGroupedColumns="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" VerticalScrollBarMode="Auto" VerticalScrollBarStyle="VirtualSmooth" VerticalScrollableHeight="570" />

                    <SettingsBehavior ConfirmDelete="True" AllowEllipsisInText="True" />

                    <SettingsCommandButton >
                        <NewButton  Text="Nuevo">
                            <Image  IconID="actions_add_16x16gray">
                            </Image>
                        </NewButton>
                        <UpdateButton Text="Guardar">
                            <Image IconID="actions_refresh_16x16gray">
                            </Image>
                        </UpdateButton>
                        <CancelButton Text="Cerrar">
                            <Image IconID="history_undo_16x16gray">
                            </Image>
                        </CancelButton>
                        <EditButton Text="Editar">
                            <Image AlternateText="Edit" IconID="edit_edit_16x16gray">
                            </Image>
                        </EditButton>
                        <DeleteButton Text="Borrar">
                            <Image IconID="edit_delete_16x16gray">
                            </Image>
                        </DeleteButton>
                        <SearchPanelApplyButton ButtonType="Image" RenderMode="Image">
                            <Image IconID="find_find_16x16gray" ToolTip="Buscar">
                            </Image>
                        </SearchPanelApplyButton>
                        <SearchPanelClearButton ButtonType="Image" RenderMode="Image">
                            <Image IconID="edit_delete_16x16gray" ToolTip="Vaciar">
                            </Image>
                        </SearchPanelClearButton>
                    </SettingsCommandButton>

                    <Toolbars>
                        <dx:GridViewToolbar >
                            <Items>
                                <dx:GridViewToolbarItem Command="New" Text="Nuevo" ToolTip="Nuevo">
                                </dx:GridViewToolbarItem>
                                <dx:GridViewToolbarItem Command="Edit"  Text="Editar" ToolTip="Editar">
                                </dx:GridViewToolbarItem>
                                <dx:GridViewToolbarItem Command="Delete"  Text="Borrar" ToolTip="Borrar">
                                </dx:GridViewToolbarItem>
                                <dx:GridViewToolbarItem Command="ShowSearchPanel"  Text="Buscar" ToolTip="Panel de búsqueda">
                                </dx:GridViewToolbarItem>
                                <dx:GridViewToolbarItem  Text="Agrupar" Image-IconID="spreadsheet_group_svg_16x16"  >
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ShowGroupPanel" Text="Panel Agrupador" >
                                        </dx:GridViewToolbarItem>
                                        <dx:GridViewToolbarItem Command="FullExpand">
                                        </dx:GridViewToolbarItem>
                                        <dx:GridViewToolbarItem Command="FullCollapse" Text="Contraer">
                                        </dx:GridViewToolbarItem>
                                        <dx:GridViewToolbarItem Command="ClearSorting" Image-IconID="spreadsheet_ungroup_svg_16x16" Text="Quitar Orden o Grupos"><Image IconID="spreadsheet_ungroup_svg_16x16"></Image>
                                        </dx:GridViewToolbarItem>
                                    </Items>
                                    <Image IconID="spreadsheet_group_svg_16x16"></Image>
                                </dx:GridViewToolbarItem>
                                <dx:GridViewToolbarItem  Text="Filtros" Image-IconID="dashboards_multiplemasterfilter_svg_16x16">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ShowFilterRow">
                                        </dx:GridViewToolbarItem>
                                        <dx:GridViewToolbarItem Command="ShowFilterEditor" Text="Filtro Avanzado">
                                        </dx:GridViewToolbarItem>
                                        <dx:GridViewToolbarItem Command="ClearFilter">
                                        </dx:GridViewToolbarItem>
                                    </Items>                                   
                                    <Image IconID="dashboards_multiplemasterfilter_svg_16x16"></Image>
                                </dx:GridViewToolbarItem>
                                <dx:GridViewToolbarItem  Text="Exportar" Image-IconID="export_export_svg_16x16">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ExportToXlsx">
                                        </dx:GridViewToolbarItem>
                                        <dx:GridViewToolbarItem Command="ExportToDocx">
                                        </dx:GridViewToolbarItem>
                                        <dx:GridViewToolbarItem Command="ExportToPdf">
                                        </dx:GridViewToolbarItem>
                                        <dx:GridViewToolbarItem Command="ExportToCsv">
                                        </dx:GridViewToolbarItem>
                                        <dx:GridViewToolbarItem Command="ExportToRtf">
                                        </dx:GridViewToolbarItem>
                                        <dx:GridViewToolbarItem Command="ExportToXls">
                                        </dx:GridViewToolbarItem>
                                    </Items>                                   
                                    <Image IconID="export_export_svg_16x16"></Image>
                                </dx:GridViewToolbarItem>
                                <dx:GridViewToolbarItem Command="Refresh"  Text="Refrescar" ToolTip="Refrescar datos" DisplayMode="Image">
                                </dx:GridViewToolbarItem>
                            </Items>
                        </dx:GridViewToolbar>
                    </Toolbars>


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
</div>
</asp:Content>
