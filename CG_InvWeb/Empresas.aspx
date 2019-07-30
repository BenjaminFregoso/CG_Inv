<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Empresas.aspx.cs" Inherits="CG_InvWeb.Empresas" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanelPrincipal" HorizontalAlign="Left" runat="server" HeaderText="Catálogo de empresas" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" Height="100%" AllowCollapsingByHeaderClick="True" HeaderNavigateUrl="~/Usuarios.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSourceCias" EnableTheming="True" KeyFieldName="key_empresa" Theme="MaterialCompact" KeyboardSupport="True" Width="100%" OnRowDeleted="ASPxGridView1_RowDeleted" OnRowInserted="ASPxGridView1_RowInserted" OnRowUpdated="ASPxGridView1_RowUpdated">
                    <SettingsPopup>
                        <EditForm CloseOnEscape="True" AllowResize="True" ShowCollapseButton="True" ShowMaximizeButton="True" ShowPinButton="True" ShowShadow="True" ShowViewportScrollbarWhenModal="True" HorizontalAlign="LeftSides" ShowFooter="True" ShowPageScrollbarWhenModal="True" VerticalAlign="Above">
                            <SettingsAdaptivity Mode="OnWindowInnerWidth" />
                        </EditForm>
                    </SettingsPopup>
                    <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="DataAware" FileName="Empresas">
                    </SettingsExport>
                    <SettingsSearchPanel ShowApplyButton="True" ShowClearButton="True" />
                    <EditFormLayoutProperties>
                        <Items>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="empresa">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="1" HorizontalAlign="Right" Width="100%">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600">
                        </SettingsAdaptivity>
                        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" />
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn VisibleIndex="0" Caption="#" Visible="False">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="key_empresa" ReadOnly="True" VisibleIndex="1" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="empresa" VisibleIndex="2" SortIndex="0" SortOrder="Ascending" Caption="Empresa">
                            <PropertiesTextEdit MaxLength="80">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="True">
                        <AdaptiveDetailLayoutProperties>
                            <Items>
                                <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="empresa">
                                </dx:GridViewColumnLayoutItem>
                            </Items>
                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600">
                            </SettingsAdaptivity>
                            <SettingsItemCaptions HorizontalAlign="Left" Location="Top" />
                        </AdaptiveDetailLayoutProperties>
                    </SettingsAdaptivity>
                    <SettingsPager Mode="ShowPager">
                        <FirstPageButton Visible="True">
                        </FirstPageButton>
                        <LastPageButton Visible="True">
                        </LastPageButton>
                        <NextPageButton Visible="False">
                        </NextPageButton>
                        <PrevPageButton Visible="False">
                        </PrevPageButton>
                        <PageSizeItemSettings Visible="True">
                        </PageSizeItemSettings>
                    </SettingsPager>
                    <SettingsEditing Mode="PopupEditForm" NewItemRowPosition="Bottom">
                    </SettingsEditing>
                    <Settings ShowHeaderFilterButton="True" ShowHeaderFilterBlankItems="false" ShowGroupedColumns="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" />
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

     <asp:SqlDataSource ID="SDSourceCias" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" DeleteCommand="DELETE FROM &quot;Empresas&quot; WHERE key_empresa = ?" InsertCommand="INSERT INTO &quot;Empresas&quot; (empresa) VALUES (?)" SelectCommand="SELECT empresa,key_empresa FROM &quot;Empresas&quot;" UpdateCommand="UPDATE &quot;Empresas&quot; SET &quot;empresa&quot; = ? WHERE &quot;key_empresa&quot; = ?" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>">
        <DeleteParameters>
            <asp:Parameter Name="key_empresa" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="empresa" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="empresa" Type="String" />
            <asp:Parameter Name="key_empresa" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


</asp:Content>