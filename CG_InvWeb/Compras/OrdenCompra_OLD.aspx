<%@ Page Title="Orden de Compra" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="OrdenCompra_OLD.aspx.cs" Inherits="CG_InvWeb.Compras.OrdenCompra_OLD" %>

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

        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Orden de Compra" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%">
            <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="1" Width="100%" Theme="iOS">
                        <TabPages>
                            <dx:TabPage Text="Listado"> 
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:ASPxGridView  ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_OrdenCompra" KeyFieldName="key_orden_compra" EnableTheming="True" Theme="MaterialCompact" KeyboardSupport="True" Width="100%" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" OnRowDeleted="ASPxGridView1_RowDeleted" OnRowInserted="ASPxGridView1_RowInserted" OnRowUpdated="ASPxGridView1_RowUpdated" OnBeforeGetCallbackResult="ASPxGridView1_BeforeGetCallbackResult">
                                                    <EditFormLayoutProperties ColCount="1">
                        
                                                        <Items>
                                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fkey_proveedores" >
                                                            </dx:GridViewColumnLayoutItem>
                                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fecha">
                                                            </dx:GridViewColumnLayoutItem>
                                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fkey_centrocostos">
                                                            </dx:GridViewColumnLayoutItem>
                                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fkey_compradores">
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
                                                        <dx:GridViewDataTextColumn FieldName="key_orden_compra" Caption="Orden de Compra" ShowInCustomizationForm="True" VisibleIndex="1" >
                                                            <EditFormSettings Visible="True" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="Proveedor" FieldName="fkey_proveedores" ShowInCustomizationForm="True" VisibleIndex="2">
                                                            <PropertiesComboBox DataSourceID="SDS_Proveedores" TextField="proveedor" ValueField="key_proveedores">
                                                            </PropertiesComboBox>
                                                            <EditFormSettings Visible="True" />
                                                        </dx:GridViewDataComboBoxColumn>
                                                        <dx:GridViewDataDateColumn Caption="Fecha" FieldName="fecha" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            <PropertiesDateEdit DisplayFormatString="">
                                                            </PropertiesDateEdit>
                                                            <EditFormSettings Visible="True" />
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="CC" FieldName="fkey_centrocostos" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            <PropertiesComboBox DataSourceID="SDS_Centrocostos" TextField="centrocostos" ValueField="key_centrocostos">
                                                            </PropertiesComboBox>
                                                            <EditFormSettings Visible="True" />
                                                        </dx:GridViewDataComboBoxColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="Comprador" FieldName="fkey_compradores" ShowInCustomizationForm="True" VisibleIndex="5">
                                                            <PropertiesComboBox DataSourceID="SDS_Compradores" TextField="usuario" ValueField="key_compradores">
                                                            </PropertiesComboBox>
                                                            <EditFormSettings Visible="True" />
                                                        </dx:GridViewDataComboBoxColumn>
                                                    </Columns>

                                                    <SettingsPopup >                        
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

                                                    <Settings ShowHeaderFilterButton="True" ShowHeaderFilterBlankItems="false" ShowGroupedColumns="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" VerticalScrollBarStyle="VirtualSmooth" VerticalScrollableHeight="570" />

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
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Nueva">
                                <ContentCollection>
                                    <dx:ContentControl>
                                    <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" HeaderText="Datos Generales Nueva Orden de Compra" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="200px">
                                        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
                                        <PanelCollection>
                                            <dx:PanelContent>
                                                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="3" ColumnCount="3" DataSourceID="SDS_OrdenCompra" EnableTheming="True" Theme="iOS" Width="100%">                                                    
                                                    <Items>
                                                        <dx:LayoutItem ColSpan="1" Caption="Orden de Compra" FieldName="key_orden_compra">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">                                                                    
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem ColSpan="1" Caption="Centro de Costos" FieldName="fkey_centrocostos">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxComboBox ID="ASPxFormLayout1_E2" runat="server" DataSourceID="SDS_Centrocostos" TextField="centrocostos" Theme="MaterialCompact" ValueField="key_centrocostos" ValueType="System.Int32" Width="100%">
                                                                    </dx:ASPxComboBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem ColSpan="1" Caption="Fecha" FieldName="fecha">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxDateEdit ID="ASPxFormLayout1_E3" runat="server" Theme="MaterialCompact" DisplayFormatString="dd/MMM/yyyy">
                                                                    </dx:ASPxDateEdit>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem ColSpan="1" Caption="Comprador" FieldName="fkey_compradores">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxComboBox ID="ASPxFormLayout1_E6" runat="server" DataSourceID="SDS_Compradores" TextField="usuario" Theme="MaterialCompact" ValueField="key_compradores" ValueType="System.Int32" Width="100%">
                                                                    </dx:ASPxComboBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem ColSpan="2" Caption="Proveedor" FieldName="fkey_proveedores" ColumnSpan="2">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxComboBox ID="ASPxFormLayout1_E5" runat="server" DataSourceID="SDS_Proveedores" ValueField="key_proveedores" TextFormatString="{0} | {1} | {2} | {3} | {4} | {5}" DisplayFormatString="{1}" Theme="MaterialCompact" ValueType="System.Int32" Width="100%">
                                                                        <Columns>
                                                                            <dx:ListBoxColumn Caption="Prov." FieldName="key_proveedores" Name="key_proveedores" Width="15px" >                                                                                
                                                                            </dx:ListBoxColumn>
                                                                            <dx:ListBoxColumn Caption="Nombre" FieldName="proveedor" Name="proveedor" Width="100px">
                                                                            </dx:ListBoxColumn>
                                                                            <dx:ListBoxColumn Caption="Nombre Comercial" FieldName="nombre_comercial" Name="nombre_comercial" Width="55px">
                                                                            </dx:ListBoxColumn>
                                                                            <dx:ListBoxColumn Caption="Tel. Prov." FieldName="telefono" Name="telefono" Width="35px">
                                                                            </dx:ListBoxColumn>
                                                                            <dx:ListBoxColumn Caption="Representante de Marca" FieldName="representante" Name="representante" Width="100px">
                                                                            </dx:ListBoxColumn>
                                                                            <dx:ListBoxColumn Caption="Cel. Repr." FieldName="celular_representante" Name="celular_representante" Width="35px">                                                                                
                                                                            </dx:ListBoxColumn>
                                                                        </Columns>
                                                                    </dx:ASPxComboBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                    </Items>
                                                    <SettingsItemCaptions Location="Left" />
                                                </dx:ASPxFormLayout>

                                            </dx:PanelContent>
                                        </PanelCollection>
                                    </dx:ASPxRoundPanel>
                                    <dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" HeaderText="Detalle de la Orden de Compra" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="340px">
                                        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
                                        <PanelCollection>
                                            <dx:PanelContent>

                                                <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_OrdenCompraDet" KeyFieldName="key_orden_compra_det" Theme="MaterialCompact">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="key_orden_compra_det" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="fkey_orden_compra" ShowInCustomizationForm="True" VisibleIndex="1">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataDateColumn FieldName="fecha" ShowInCustomizationForm="True" VisibleIndex="2">
                                                        </dx:GridViewDataDateColumn>
                                                    </Columns>
                                                </dx:ASPxGridView>

                                            </dx:PanelContent>
                                        </PanelCollection>
                                    </dx:ASPxRoundPanel>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>                                                             
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>


 
    <asp:SqlDataSource ID="SDS_OrdenCompra" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
        DeleteCommand="DELETE FROM &quot;Orden_compra&quot; WHERE key_orden_compra = ?" 
        InsertCommand="INSERT INTO &quot;Orden_compra&quot; (fkey_proveedores , fecha, fkey_centrocostos, fkey_compradores) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
        SelectCommand="SELECT key_orden_compra, fkey_proveedores, fecha, fkey_centrocostos,fkey_compradores FROM &quot;Orden_compra&quot; WHERE key_orden_compra = -1 UNION select null as key_orden_compra, null as fkey_proveedores, null as fecha, null as fkey_centrocostos, null as fkey_compradores" 
        UpdateCommand="UPDATE &quot;Orden_compra&quot; SET fkey_proveedores = ?, fecha = ?, fkey_centrocostos = ?, fkey_compradores = ?  WHERE key_orden_compra = ?">
        <DeleteParameters>
            <asp:Parameter Name="key_orden_compra" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="fkey_proveedores" Type="Int32" />
            <asp:Parameter Name="fecha" Type="DateTime" />
            <asp:Parameter Name="fkey_centrocostos" Type="Int32" />
            <asp:Parameter Name="fkey_compradores" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="fkey_proveedores" Type="Int32" />
            <asp:Parameter Name="fecha" Type="DateTime" />
            <asp:Parameter Name="fkey_centrocostos" Type="Int32" />
            <asp:Parameter Name="fkey_compradores" Type="Int32" />
            <asp:Parameter Name="key_orden_compra" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_Proveedores" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
        SelectCommand="select key_proveedores, proveedor, telefono, extension,celular, nombre_comercial, ( select representante as representante from &quot;Representantes&quot;  where key_representantes = ( select fkey_representantes from &quot;Proveedores_representantes&quot; where fkey_proveedores = &quot;Proveedores&quot;.key_proveedores  order by fecha desc LIMIT 1) ), ( select celular as celular_representante from &quot;Representantes&quot;  where key_representantes = ( select fkey_representantes from &quot;Proveedores_representantes&quot; where fkey_proveedores = &quot;Proveedores&quot;.key_proveedores  order by fecha desc LIMIT 1) ) from &quot;Proveedores&quot; "></asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_Centrocostos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_centrocostos, centrocostos FROM &quot;CentroCostos&quot;"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_Compradores" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
        SelectCommand="SELECT key_compradores, fkey_usuario, fkey_centrocostos , ( select usuario from &quot;Usuarios&quot; where &quot;Usuarios&quot;.key_usuario = &quot;Compradores&quot;.fkey_usuario) as usuario FROM &quot;Compradores&quot;"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SDS_OrdenCompraDet" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
            DeleteCommand="DELETE FROM &quot;Orden_compra_det&quot; WHERE key_orden_compra_det = ?" 
            InsertCommand="INSERT INTO &quot;Orden_compra_det&quot; (key_orden_compra_det, fkey_orden_compra, fecha, oc) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
            SelectCommand="SELECT key_orden_compra_det, fkey_orden_compra, fecha, oc  FROM &quot;Orden_compra_det&quot;" 
            UpdateCommand="UPDATE &quot;Orden_compra_det&quot; SET fkey_orden_compra = ?, fecha = ?, oc = ? WHERE key_orden_compra_det = ?">
            <DeleteParameters>
                <asp:Parameter Name="key_orden_compra_det" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>                
                <asp:Parameter Name="fkey_orden_compra" Type="Int32" />
                <asp:Parameter Name="fecha" Type="DateTime" />
                <asp:Parameter Name="oc" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="fkey_orden_compra" Type="Int32" />
                <asp:Parameter Name="fecha" Type="DateTime" />
                <asp:Parameter Name="oc" Type="Int32" />
                <asp:Parameter Name="key_orden_compra_det" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

</div>
</asp:Content>

