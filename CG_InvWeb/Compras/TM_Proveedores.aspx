<%@ Page Title="Tipos de Movimiento" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="TM_Proveedores.aspx.cs" Inherits="CG_InvWeb.Compras.TM_Proveedores" %>

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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Representantes" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Compras/Representantes.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">

                <%--key_tm_proveedores, tm_proveedores, tm_proveedores_numero--%>
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_TM_Proveedores" EnableTheming="True" KeyFieldName="key_tm_proveedores" Theme="MaterialCompact" KeyboardSupport="True" Width="100%" OnRowInserted="ASPxGridView1_RowInserted" OnBeforeGetCallbackResult="ASPxGridView1_BeforeGetCallbackResult">                    

                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="key_tm_proveedores" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Código" ReadOnly="True" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataMemoColumn Caption="Tipo de Movimiento" FieldName="tm_proveedores" ShowInCustomizationForm="True" VisibleIndex="2">
                            <PropertiesMemoEdit NullText="Nombre del representante" Rows="2">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RequiredField ErrorText="Tipo de Movimiento es requerido" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesMemoEdit>
                        </dx:GridViewDataMemoColumn>

                        <dx:GridViewDataTextColumn FieldName="tm_proveedores_numero" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Número de Tipo de Movimiento">
                            <PropertiesTextEdit>
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
<%--                                <MaskSettings Mask="0000000000" PromptChar=" " ErrorText="Número no válido" />--%>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RegularExpression ErrorText="Número no válido (entre el 1 y 399)" ValidationExpression="^([1-9]|[1-9][0-9]|[1-3][0-9][0-9])$" />
                                    <RequiredField ErrorText="Número es requerido" IsRequired="False" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
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

                    <SettingsEditing Mode="Batch">
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
                <asp:SqlDataSource ID="SDS_TM_Proveedores" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
                    DeleteCommand="DELETE FROM &quot;TM_Proveedores&quot; WHERE key_tm_proveedores = ?" 
                    InsertCommand="INSERT INTO &quot;TM_Proveedores&quot; (tm_proveedores, tm_proveedores_numero) VALUES (?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_tm_proveedores, tm_proveedores, tm_proveedores_numero FROM &quot;TM_Proveedores&quot; ORDER BY key_tm_proveedores DESC" 
                    UpdateCommand="UPDATE &quot;TM_Proveedores&quot; SET tm_proveedores=?, tm_proveedores_numero=? WHERE key_tm_proveedores = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_tm_proveedores" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="tm_proveedores" Type="String" />
                        <asp:Parameter Name="tm_proveedores_numero" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="tm_proveedores" Type="String" />
                        <asp:Parameter Name="tm_proveedores_numero" Type="Int32" />
                        <asp:Parameter Name="key_tm_proveedores" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                                                
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
</asp:Content>

