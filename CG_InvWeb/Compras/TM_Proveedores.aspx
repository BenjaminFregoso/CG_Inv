<%@ Page Title="TM Proveedores" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="TM_Proveedores.aspx.cs" Inherits="CG_InvWeb.Compras.TM_Proveedores" %>

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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="TM Proveedores" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Compras/Representantes.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">

                <%--key_tm_proveedores, tm_proveedores, tm_proveedores_numero--%>
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_TM_Proveedores" EnableTheming="True" KeyFieldName="key_tm_proveedores" Theme="MaterialCompact" KeyboardSupport="True" Width="100%" OnBeforeGetCallbackResult="ASPxGridView1_BeforeGetCallbackResult" OnInitNewRow="ASPxGridView1_InitNewRow">

                    <EditFormLayoutProperties ColCount="2" ColumnCount="2">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="tm_proveedores_numero">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fkey_tm_naturaleza">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="tm_proveedores" ColumnSpan="2">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="es_factura">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fkey_tm_bancos">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="obliga_oc">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fkey_tm_pagos">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewLayoutGroup Caption="Obliga CFDI" ColSpan="1">
                                <Items>
                                    <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="obliga_cfdi_captura">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="obliga_cfdi_autoriza">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="obliga_cfdi_pago">
                                    </dx:GridViewColumnLayoutItem>
                                </Items>
                            </dx:GridViewLayoutGroup>
                            <dx:GridViewLayoutGroup Caption="Valida Recepción" ColSpan="1">
                                <Items>
                                    <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="valida_recibido_captura">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="valida_recibido_autoriza">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="valida_recibido_pago">
                                    </dx:GridViewColumnLayoutItem>
                                </Items>
                            </dx:GridViewLayoutGroup>
                            <dx:EditModeCommandLayoutItem ColSpan="2" ColumnSpan="2" HorizontalAlign="Right">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                        <SettingsItemCaptions Location="Top" />
                    </EditFormLayoutProperties>

                    <Columns> 
                        <dx:GridViewDataTextColumn FieldName="key_tm_proveedores" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Código" ReadOnly="True" Visible="False" Width="150px">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn Caption="TM" FieldName="tm_proveedores_numero" ShowInCustomizationForm="True" VisibleIndex="2" FixedStyle="Left" Width="80px">
                            <PropertiesTextEdit>
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RegularExpression ErrorText="Número no válido (entre el 1 y 399)" ValidationExpression="^([1-9]|[1-9][0-9]|[1-3][0-9][0-9])$" />
                                    <RequiredField ErrorText="Número es requerido" IsRequired="true" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                            <HeaderStyle Wrap="True" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataMemoColumn Caption="Descripción" FieldName="tm_proveedores" ShowInCustomizationForm="True" VisibleIndex="3" FixedStyle="Left" Width="300px">
                            <CellStyle>
                                <BorderRight BorderColor="#666666" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                            <PropertiesMemoEdit NullText="TM" Rows="2">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RequiredField ErrorText="Tipo de Movimiento es requerido" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesMemoEdit>
                        </dx:GridViewDataMemoColumn>

                        <dx:GridViewDataComboBoxColumn Caption="Naturaleza" FieldName="fkey_tm_naturaleza" ShowInCustomizationForm="True" VisibleIndex="4">
                            <PropertiesComboBox DataSourceID="SDS_TM_Naturaleza" TextField="naturaleza" ValueField="key_tm_naturaleza">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RequiredField ErrorText="La Naturaleza es requerida" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataCheckColumn Caption="Es factura" FieldName="es_factura" ShowInCustomizationForm="True" VisibleIndex="5">
                            <HeaderStyle Wrap="True"></HeaderStyle>
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataCheckColumn Caption="Obliga Orden de Compra" FieldName="obliga_oc" ShowInCustomizationForm="True" VisibleIndex="6">
                            <HeaderStyle Wrap="True"></HeaderStyle>
                        </dx:GridViewDataCheckColumn>

                        <dx:GridViewDataComboBoxColumn Caption="TM Bancos" FieldName="fkey_tm_bancos" ShowInCustomizationForm="True" VisibleIndex="7" Width="200px">
                            <PropertiesComboBox DataSourceID="SDS_TM_Bancos" TextField="tm_bancos" ValueField="key_tm_bancos">
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="TM Pagos Proveedor" FieldName="fkey_tm_pagos" ShowInCustomizationForm="True" VisibleIndex="8" Width="200px">
                            <PropertiesComboBox DataSourceID="SDS_TM_Pagos" TextField="tm_proveedores" ValueField="key_tm_proveedores">
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>


                        <dx:GridViewBandColumn Caption="Obliga CFDI" ShowInCustomizationForm="True" VisibleIndex="9">
                            <HeaderStyle BackColor="#D7F9C7" />
                            <Columns>
                                <dx:GridViewDataCheckColumn Caption="Captura" FieldName="obliga_cfdi_captura" ShowInCustomizationForm="True" VisibleIndex="0">
                                    <HeaderStyle BackColor="#D7F9C7" />
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataCheckColumn Caption="Autorización" FieldName="obliga_cfdi_autoriza" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <HeaderStyle BackColor="#D7F9C7" />
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataCheckColumn Caption="Pago" FieldName="obliga_cfdi_pago" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <HeaderStyle BackColor="#D7F9C7" />
                                </dx:GridViewDataCheckColumn>
                            </Columns>
                        </dx:GridViewBandColumn>

                        <dx:GridViewBandColumn Caption="Valida Recepción" ShowInCustomizationForm="True" VisibleIndex="10">
                            <HeaderStyle BackColor="#99CCFF" />
                            <Columns>
                                <dx:GridViewDataCheckColumn Caption="Captura" FieldName="valida_recibido_captura" ShowInCustomizationForm="True" VisibleIndex="0">
                                    <HeaderStyle BackColor="#99CCFF" />
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataCheckColumn Caption="Autorización" FieldName="valida_recibido_autoriza" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <HeaderStyle BackColor="#99CCFF" />
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataCheckColumn Caption="Pago" FieldName="valida_recibido_pago" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <HeaderStyle BackColor="#99CCFF" />
                                </dx:GridViewDataCheckColumn>
                            </Columns>
                        </dx:GridViewBandColumn>

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

                    <Settings ShowHeaderFilterButton="True" ShowHeaderFilterBlankItems="false" ShowGroupedColumns="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollBarStyle="VirtualSmooth" VerticalScrollableHeight="500" />

                    <SettingsBehavior ConfirmDelete="True" AllowEllipsisInText="True" />
                    <SettingsResizing ColumnResizeMode="Control" />
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
                    InsertCommand="INSERT INTO &quot;TM_Proveedores&quot; (tm_proveedores, tm_proveedores_numero, obliga_cfdi_captura, obliga_cfdi_autoriza, obliga_cfdi_pago, es_factura, fkey_tm_naturaleza, valida_recibido_captura, valida_recibido_autoriza, valida_recibido_pago,fkey_tm_bancos, fkey_tm_pagos, obliga_oc ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_tm_proveedores, tm_proveedores, tm_proveedores_numero, obliga_cfdi_captura, obliga_cfdi_autoriza, obliga_cfdi_pago, es_factura, fkey_tm_naturaleza, valida_recibido_captura, valida_recibido_autoriza, valida_recibido_pago, fkey_tm_bancos, fkey_tm_pagos, obliga_oc FROM &quot;TM_Proveedores&quot; ORDER BY key_tm_proveedores DESC" 
                    UpdateCommand="UPDATE &quot;TM_Proveedores&quot; SET tm_proveedores=?, tm_proveedores_numero=?, obliga_cfdi_captura=?, obliga_cfdi_autoriza=?, obliga_cfdi_pago=?, es_factura=?, fkey_tm_naturaleza=?, valida_recibido_captura=?, valida_recibido_autoriza=?, valida_recibido_pago=?, fkey_tm_bancos=?, fkey_tm_pagos=?, obliga_oc=? WHERE key_tm_proveedores = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_tm_proveedores" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="tm_proveedores" Type="String" />
                        <asp:Parameter Name="tm_proveedores_numero" Type="Int32" />
                        <asp:Parameter Name="obliga_cfdi_captura" Type="Int32" />
                        <asp:Parameter Name="obliga_cfdi_autoriza" Type="Int32" />
                        <asp:Parameter Name="obliga_cfdi_pago" Type="Int32" />
                        <asp:Parameter Name="es_factura" Type="Int32" />
                        <asp:Parameter Name="fkey_tm_naturaleza" Type="Int64" />
                        <asp:Parameter Name="valida_recibido_captura" Type="Int32" />
                        <asp:Parameter Name="valida_recibido_autoriza" Type="Int32" />
                        <asp:Parameter Name="valida_recibido_pago" Type="Int32" />
                        <asp:Parameter Name="fkey_tm_bancos" Type="Int64" />
                        <asp:Parameter Name="fkey_tm_pagos" Type="Int64" />
                        <asp:Parameter Name="obliga_oc" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="tm_proveedores" Type="String" />
                        <asp:Parameter Name="tm_proveedores_numero" Type="Int32" />
                        <asp:Parameter Name="obliga_cfdi_captura" Type="Int32" />
                        <asp:Parameter Name="obliga_cfdi_autoriza" Type="Int32" />
                        <asp:Parameter Name="obliga_cfdi_pago" Type="Int32" />
                        <asp:Parameter Name="es_factura" Type="Int32" />
                        <asp:Parameter Name="fkey_tm_naturaleza" Type="Int64" />
                        <asp:Parameter Name="valida_recibido_captura" Type="Int32" />
                        <asp:Parameter Name="valida_recibido_autoriza" Type="Int32" />
                        <asp:Parameter Name="valida_recibido_pago" Type="Int32" />
                        <asp:Parameter Name="fkey_tm_bancos" Type="Int64" />
                        <asp:Parameter Name="fkey_tm_pagos" Type="Int64" />
                        <asp:Parameter Name="obliga_oc" Type="Int32" />
                        <asp:Parameter Name="key_tm_proveedores" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                                                
                <asp:SqlDataSource ID="SDS_TM_Naturaleza" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_tm_naturaleza, naturaleza FROM &quot;TM_Naturaleza&quot;"></asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_TM_Bancos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_tm_bancos, tm_bancos, tm_bancos_numero FROM &quot;TM_Bancos&quot;"></asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_TM_Pagos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_tm_proveedores, tm_proveedores, tm_proveedores_numero FROM &quot;TM_Proveedores&quot; WHERE tm_proveedores_numero between 201 and 300 order by tm_proveedores"></asp:SqlDataSource>

                                                
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
</asp:Content>

