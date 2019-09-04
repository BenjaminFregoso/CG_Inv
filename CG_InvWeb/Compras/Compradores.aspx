<%@ Page Title="Compradores" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Compradores.aspx.cs" Inherits="CG_InvWeb.Compras.Compradores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        Principal{
        width:80%;
        margin-top:20px;
        padding-left:20px;
        padding-top:20px;
        font-family :'Open Sans';
    }
    .auto-style1 {
        margin-left: 0px;
        vertical-align:text-top;
        text-align:left;
        font-family :'Open Sans';
    }
</style> 
<div class="Principal">          
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Compradores" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Compras/Compradores.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Compradores" EnableTheming="True" KeyFieldName="key_compradores" Theme="MaterialCompact" KeyboardSupport="True" Width="100%" OnRowInserted="ASPxGridView1_RowInserted">
                    <SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True" />


                    <Templates>                        
                        <DetailRow>
                            <dx:ASPxPageControl BackColor="#CCCCCC" ID="ASPxPageControl1" runat="server" ActiveTabIndex="3" EnableTabScrolling="True" Theme="MaterialCompact" Width="100%">
                                <TabPages>
                                    <dx:TabPage Name="Deptos" Text="Acceso a los siguientes departamentos">
                                        <ActiveTabImage IconID="spreadsheet_tableconverttorange_svg_16x16">
                                        </ActiveTabImage>
                                        <TabImage IconID="spreadsheet_multiplesheet_svg_16x16">
                                        </TabImage>
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Compradores_det" KeyFieldName="key_compradores_det" Theme="Glass" Width="100%" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect" KeyboardSupport="True" OnCellEditorInitialize="ASPxGridView2_CellEditorInitialize">
                                                    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
                                                    <SettingsPager Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Batch">
                                                    </SettingsEditing>
                                                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                                    <Settings ShowHeaderFilterButton="True" ShowHeaderFilterBlankItems="false" ShowGroupedColumns="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" />

                                                    <SettingsCommandButton>
                                                        <NewButton Text="Nuevo">
                                                            <Image IconID="actions_add_16x16gray">
                                                            </Image>
                                                        </NewButton>
                                                        <HidePreviewButton Text="Todos">
                                                            <Image IconID="other_all_borders_16x16gray">
                                                            </Image>
                                                        </HidePreviewButton>
                                                        <PreviewChangesButton Text="Cambios">
                                                            <Image IconID="edit_edit_16x16gray">
                                                            </Image>
                                                        </PreviewChangesButton>
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
                                                    </SettingsCommandButton>


                                                    <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />


                                                    <Columns>
                                                        <dx:GridViewCommandColumn Width="50px" ButtonRenderMode="Image" ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn FieldName="key_compradores_det" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="fkey_compradores" ShowInCustomizationForm="True" VisibleIndex="3" Visible="False" Caption="fkey_articulo" Name="fkey_articulo">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="Departamento" FieldName="fkey_departamento" ShowInCustomizationForm="True" VisibleIndex="2" ReadOnly="True">
                                                            <PropertiesComboBox DataSourceID="SDS_Departamentos" TextField="departamento" ValueField="key_departamento">
                                                            </PropertiesComboBox>
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataComboBoxColumn>
                                                        <dx:GridViewDataCheckColumn Caption="Acceso" FieldName="acceso" Name="acceso" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            <PropertiesCheckEdit ValueChecked="1" ValueType="System.Int32" ValueUnchecked="0">
                                                            </PropertiesCheckEdit>
                                                        </dx:GridViewDataCheckColumn>
                                                    </Columns>
                                                    <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="True">
                                                        <AdaptiveDetailLayoutProperties ShowItemCaptionColon="False">
                                                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="800">
                                                            </SettingsAdaptivity>                    
                                                            <SettingsItemCaptions Location="Top" />
                                                        </AdaptiveDetailLayoutProperties>
                                                    </SettingsAdaptivity>


                                                </dx:ASPxGridView>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                </TabPages>
                            </dx:ASPxPageControl>
                        </DetailRow>
                    </Templates>


                    <EditFormLayoutProperties ColCount="1">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fkey_usuario">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fkey_centrocostos">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="1" Width="100%" HorizontalAlign="Right">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                        <SettingsItemCaptions Location="Top" />
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="key_compradores" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Código" ReadOnly="True" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Comprador" FieldName="fkey_usuario" ShowInCustomizationForm="True" VisibleIndex="1">
                            <PropertiesComboBox DataSourceID="SDS_Usuarios" TextField="usuario" ValueField="key_usuario">
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Centro de Costos" FieldName="fkey_centrocostos" ShowInCustomizationForm="True" VisibleIndex="2">
                            <PropertiesComboBox DataSourceID="SDS_CentroCostos" TextField="centrocostos" ValueField="key_centrocostos">
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
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
                <asp:SqlDataSource ID="SDS_Compradores" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
                    DeleteCommand="DELETE FROM &quot;Compradores&quot; WHERE &quot;key_compradores&quot; = ?" 
                    InsertCommand="INSERT INTO &quot;Compradores&quot; (fkey_usuario,fkey_centrocostos) VALUES (?,?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_compradores, fkey_usuario, fkey_centrocostos FROM &quot;Compradores&quot; ORDER BY key_compradores DESC" 
                    UpdateCommand="UPDATE &quot;Compradores&quot; SET fkey_usuario = ?,fkey_centrocostos = ? WHERE key_compradores = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_compradores" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="fkey_usuario" Type="Int64" />
                        <asp:Parameter Name="fkey_centrocostos" Type="Int64" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="fkey_usuario" Type="Int64" />
                        <asp:Parameter Name="fkey_centrocostos" Type="Int64" />
                        <asp:Parameter Name="key_compradores" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
                <asp:SqlDataSource ID="SDS_Usuarios" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>"
                    SelectCommand="SELECT key_usuario, usuario FROM &quot;Usuarios&quot; ORDER BY usuario ASC" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>">
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_CentroCostos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
                    SelectCommand="SELECT key_centrocostos, centrocostos FROM &quot;CentroCostos&quot; ORDER BY centrocostos ASC" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>">
                </asp:SqlDataSource>
                
                <asp:SqlDataSource ID="SDS_Compradores_det" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
                    SelectCommand="SELECT key_compradores_det, fkey_compradores, fkey_departamento, acceso FROM &quot;Compradores_det&quot; WHERE fkey_compradores = ? ORDER BY fkey_departamento ASC" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>"
                    UpdateCommand="UPDATE &quot;Compradores_det&quot; SET acceso = ? WHERE key_compradores_det = ?">
                    <SelectParameters>
                        <asp:SessionParameter Name="?" SessionField="session_key_compradores" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="acceso" Type="Int32" />
                        <asp:Parameter Name="key_compradores_det" Type="Int64" />
                    </UpdateParameters>

                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_Departamentos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT &quot;key_departamento&quot;, &quot;departamento&quot; FROM &quot;Departamento&quot;"></asp:SqlDataSource>
                
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
</asp:Content>

