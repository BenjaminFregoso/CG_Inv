<%@ Page Title="Usuarios" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="CG_InvWeb.Usuarios" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanelPrincipal" HorizontalAlign="Left" runat="server" HeaderText="Usuarios" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" Height="100%" AllowCollapsingByHeaderClick="True" HeaderNavigateUrl="~/Usuarios.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Usuarios" EnableTheming="True" KeyFieldName="key_usuario" Theme="MaterialCompact" KeyboardSupport="True" Width="100%" OnRowDeleted="ASPxGridView1_RowDeleted" OnRowInserted="ASPxGridView1_RowInserted" OnRowUpdated="ASPxGridView1_RowUpdated">
                    <SettingsPopup>
                        <EditForm CloseOnEscape="True" AllowResize="True" ShowCollapseButton="True" ShowMaximizeButton="True" ShowPinButton="True" ShowShadow="True" ShowViewportScrollbarWhenModal="True" HorizontalAlign="LeftSides" ShowFooter="True" ShowPageScrollbarWhenModal="True" VerticalAlign="Above">
                            <SettingsAdaptivity Mode="OnWindowInnerWidth" />
                        </EditForm>
                    </SettingsPopup>
                    <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="DataAware" FileName="Empresas">
                    </SettingsExport>
                    <SettingsSearchPanel ShowApplyButton="True" ShowClearButton="True" />
                    <EditFormLayoutProperties ColCount="2" ColumnCount="2">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="usuario">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="contrasena">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="perfil">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fecha_alta">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fecha_baja">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="1" Width="100%">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600">
                        </SettingsAdaptivity>
                        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" />
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn VisibleIndex="0" Caption="#" Visible="False">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn Caption="Usuario" FieldName="usuario" ShowInCustomizationForm="True" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Fecha de Baja" FieldName="fecha_baja" ShowInCustomizationForm="True" VisibleIndex="7">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn Caption="Fecha de Alta" FieldName="fecha_alta" ShowInCustomizationForm="True" VisibleIndex="6">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Perfil" FieldName="perfil" ShowInCustomizationForm="True" VisibleIndex="4">
                            <PropertiesComboBox DataSourceID="SDS_Perfil" TextField="perfil" ValueField="perfil">
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn Caption="Contraseña" FieldName="contrasena" ShowInCustomizationForm="True" VisibleIndex="3">
                            <PropertiesTextEdit Password="True">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="True">
                        <AdaptiveDetailLayoutProperties ShowItemCaptionColon="False">
                            <Items>
                                <dx:GridViewColumnLayoutItem ColSpan="1">
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="usuario">
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="contrasena">
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="perfil">
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fecha_alta">
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fecha_baja">
                                </dx:GridViewColumnLayoutItem>
                            </Items>
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
                    <Settings ShowHeaderFilterButton="True" ShowHeaderFilterBlankItems="false" ShowGroupedColumns="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" VerticalScrollBarStyle="VirtualSmooth" VerticalScrollableHeight="570"/>
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
                                        <dx:GridViewToolbarItem Command="ClearSorting" Image-IconID="spreadsheet_ungroup_svg_16x16" Text="Quitar Orden o Grupos">
            <Image IconID="spreadsheet_ungroup_svg_16x16"></Image>
                                        </dx:GridViewToolbarItem>
                                    </Items>                                   

            <Image IconID="spreadsheet_group_svg_16x16"></Image>
                                </dx:GridViewToolbarItem>


                                <dx:GridViewToolbarItem  Text="Filtros" Image-IconID="dashboards_multiplemasterfilter_svg_16x16">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ShowFilterRow">
                                        </dx:GridViewToolbarItem>
            <%--                                        <dx:GridViewToolbarItem Command="ShowFilterRowMenu" Text="Filtro de Fila Opciones">
                                        </dx:GridViewToolbarItem>--%>
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

    <asp:SqlDataSource ID="SDS_Usuarios" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
        DeleteCommand="DELETE FROM &quot;Usuarios&quot; WHERE key_usuario = ?" 
        InsertCommand="INSERT INTO &quot;Usuarios&quot; (usuario, contrasena, perfil, fecha_baja, fecha_alta) VALUES ( ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
        SelectCommand="SELECT key_usuario, usuario, contrasena, perfil,  fecha_baja, fecha_alta FROM &quot;Usuarios&quot;" 
        UpdateCommand="UPDATE &quot;Usuarios&quot; SET usuario = ?, contrasena = ?, perfil = ?, fecha_baja = ?, fecha_alta = ? WHERE key_usuario = ?">
        <DeleteParameters>
            <asp:Parameter Name="key_usuario" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="usuario" Type="String" />
            <asp:Parameter Name="contrasena" Type="String" />
            <asp:Parameter Name="perfil" Type="String" />
            <asp:Parameter Name="fecha_baja" Type="DateTime" />
            <asp:Parameter Name="fecha_alta" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>                        
            <asp:Parameter Name="usuario" Type="String" />
            <asp:Parameter Name="contrasena" Type="String" />
            <asp:Parameter Name="perfil" Type="String" />
            <asp:Parameter Name="fecha_baja" Type="DateTime" />
            <asp:Parameter Name="fecha_alta" Type="DateTime" />
            <asp:Parameter Name="key_usuario" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_Perfil" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_perfil, perfil FROM &quot;Perfil&quot;">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_empresa, empresa FROM &quot;Empresas&quot;">
    </asp:SqlDataSource>

</asp:Content>