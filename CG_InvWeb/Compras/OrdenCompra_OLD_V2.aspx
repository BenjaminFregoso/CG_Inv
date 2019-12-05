<%@ Page Title="Orden de Compra" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="OrdenCompra.aspx.cs" Inherits="CG_InvWeb.Compras.OrdenCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">

    var curentEditingIndex;
    var lastPAIS = null;
    var lastCmb = null;
    var isCustomCascadingCallback = false;
    var isCustomCascadingCallbackTallas = false;

    function OnSelectedIndexChanged(s, e) {
        lastPAIS = s.GetValue();
        isCustomCascadingCallback = true;
        isCustomCascadingCallbackTallas = true;
        RefreshDataColor(lastPAIS);
        RefreshDataTallas(lastPAIS);
    }
    function ColorCombo_EndCallback(s, e) {

        if (isCustomCascadingCallback) {
            if (s.GetItemCount() > 0)
                ASPxGridView2.batchEditApi.SetCellValue(curentEditingIndex, "fkey_articulos_color", s.GetItem(0).value);
            isCustomCascadingCallback = false;
        }
        else {
            ASPxGridView2.batchEditApi.StartEdit(curentEditingIndex, grdCliente.GetColumnByField("fkey_articulos_color").index);
        }
    }
    function TallasCombo_EndCallback(s, e) {
        if (isCustomCascadingCallbackTallas) {
            if (s.GetItemCount() > 0)
                ASPxGridView2.batchEditApi.SetCellValue(curentEditingIndex, "fkey_articulos_tallas", s.GetItem(0).value);
            isCustomCascadingCallbackTallas = false;
        }
        else {
            ASPxGridView2.batchEditApi.StartEdit(curentEditingIndex, grdCliente.GetColumnByField("fkey_articulos_tallas").index);
        }
    }

    function OnBatchEditStartEditing(s, e) {
        curentEditingIndex = e.visibleIndex;
        var currentPAIS = grdCliente.batchEditApi.GetCellValue(curentEditingIndex, "fkey_articulo");
        if ((currentPAIS != lastPAIS || lastCmb == "fkey_articulos_tallas") && e.focusedColumn.fieldName == "fkey_articulos_color" && currentPAIS != null) {
            e.cancel = true;
            lastPAIS = currentPAIS;
            lastCmb = "fkey_articulos_color";
            RefreshDataColor(currentPAIS);
        }
        if ((currentPAIS != lastPAIS || lastCmb == "fkey_articulos_color") && e.focusedColumn.fieldName == "fkey_articulos_tallas" && currentPAIS != null) {
            e.cancel = true;
            lastPAIS = currentPAIS;
            lastCmb = "fkey_articulos_tallas";
            RefreshDataTallas(currentPAIS);
        }
    }
    function RefreshDataColor(currentPAIS) {
        ASPxGridView2.GetEditor("fkey_articulos_color").PerformCallback(currentPAIS);
    }
    function RefreshDataTallas(currentPAIS) {
        ASPxGridView2.GetEditor("fkey_articulos_tallas").PerformCallback(currentPAIS);
    }
    </script>
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
<%--    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Orden de Compra" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Compras/OrdenCompra.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Orden_compra" EnableTheming="True" KeyFieldName="key_centrocostos; key_orden_compra" Theme="MaterialCompact" KeyboardSupport="True" Width="100%" OnBeforeGetCallbackResult="ASPxGridView1_BeforeGetCallbackResult" OnInitNewRow="ASPxGridView1_InitNewRow" OnRowInserting="ASPxGridView1_RowInserting" OnRowInserted="ASPxGridView1_RowInserted">
                    <SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True" />
                    
                    <Templates>                        
                        <DetailRow>                         
                        </DetailRow>
                    </Templates>

                    <EditFormLayoutProperties ColCount="2" ColumnCount="2">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="oc">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fecha">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="fkey_proveedores" ColumnSpan="2">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="key_centrocostos">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fkey_compradores">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="solicita">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="autoriza">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="tipo">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="lugar_entrega">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="2" ColumnSpan="2" HorizontalAlign="Right">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                        <SettingsItemCaptions Location="Top" />
                    </EditFormLayoutProperties>

                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="key_orden_compra" ShowInCustomizationForm="True" VisibleIndex="13" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn FieldName="oc" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Número" ReadOnly="True" Width="50px">
                            <PropertiesTextEdit>
                                <ReadOnlyStyle BackColor="#D1D1D1">
                                </ReadOnlyStyle>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataDateColumn FieldName="fecha_autoriza" ShowInCustomizationForm="True" VisibleIndex="19" Visible="False">
                        </dx:GridViewDataDateColumn>

                        <dx:GridViewDataDateColumn FieldName="fecha" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Fecha" ReadOnly="True" Width="60px">
                            <PropertiesDateEdit DisplayFormatInEditMode="True" DisplayFormatString="dd MMM yy">
                                <ReadOnlyStyle BackColor="#D1D1D1">
                                </ReadOnlyStyle>
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>

                       <dx:GridViewDataTextColumn FieldName="porcentaje_iva" ShowInCustomizationForm="True" VisibleIndex="20" Visible="False">
                        </dx:GridViewDataTextColumn>

                       <dx:GridViewDataTextColumn FieldName="sub_total" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False" Width="100px">
                        </dx:GridViewDataTextColumn>

                       <dx:GridViewDataTextColumn FieldName="iva" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False" Width="100px">
                        </dx:GridViewDataTextColumn>

                       <dx:GridViewDataTextColumn FieldName="total" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Total" Width="100px">
                        </dx:GridViewDataTextColumn>


                        <dx:GridViewDataTextColumn FieldName="recibido_sub_total" ShowInCustomizationForm="True" VisibleIndex="21" Visible="False">
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn FieldName="recibido_iva" ShowInCustomizationForm="True" VisibleIndex="22" Visible="False">
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn FieldName="recibido_total" ShowInCustomizationForm="True" VisibleIndex="23" Visible="False">
                        </dx:GridViewDataTextColumn>
                        
                        <dx:GridViewDataTextColumn FieldName="ajuste_sub_total" ShowInCustomizationForm="True" Visible="False" VisibleIndex="24">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ajuste_iva" ShowInCustomizationForm="True" Visible="False" VisibleIndex="25">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ajuste_total" ShowInCustomizationForm="True" VisibleIndex="26" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="cancela_sub_total" ShowInCustomizationForm="True" Visible="False" VisibleIndex="27">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="cancela_iva" ShowInCustomizationForm="True" Visible="False" VisibleIndex="28">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="cancela_total" ShowInCustomizationForm="True" VisibleIndex="29" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="total_facturado" ShowInCustomizationForm="True" VisibleIndex="30" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="total_pagado" ShowInCustomizationForm="True" VisibleIndex="31" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="estatus_recibido" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Recibido" Width="50px">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="estatus_impresa" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Comprador" FieldName="fkey_compradores" ShowInCustomizationForm="True" VisibleIndex="15" Visible="False">
                            <PropertiesComboBox DataSourceID="SDS_Compradores" TextField="nombre" ValueField="key_compradores" SelectInputTextOnClick="true" TextFormatString="{0} | {1}" ValueType="System.Int32">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Nombre" FieldName="nombre" Name="nombre">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Usuario" FieldName="usuario" Name="usuario">
                                    </dx:ListBoxColumn>
                                </Columns>
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RequiredField ErrorText="Comprador es requerido" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataComboBoxColumn Name="key_centrocostos" Caption="Centro de Costos" FieldName="key_centrocostos" ShowInCustomizationForm="True" VisibleIndex="14" Visible="False">
                            <PropertiesComboBox DataSourceID="SDS_Centrocostos" TextField="centrocostos" ValueField="key_centrocostos" SelectInputTextOnClick="true" TextFormatString="{0} | {1}" ValueType="System.Int32">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Centro de Costos" FieldName="centrocostos" Name="centrocostos">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Código" FieldName="key_centrocostos" Name="key_centrocostos">
                                    </dx:ListBoxColumn>
                                </Columns>
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RequiredField ErrorText="Centro de Costos es requerido" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataComboBoxColumn Caption="Solicita" FieldName="solicita" ShowInCustomizationForm="True" Visible="False" VisibleIndex="17">
                            <PropertiesComboBox DataSourceID="SDS_Usuarios" TextField="nombre" TextFormatString="{0} | {1}" SelectInputTextOnClick="true" ValueField="key_usuario" ValueType="System.Int32">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Nombre" FieldName="nombre" Name="nombre">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Usuario" FieldName="usuario" Name="usuario">
                                    </dx:ListBoxColumn>
                                </Columns>
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RequiredField ErrorText="Solicita es requerido" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                    

                        <dx:GridViewDataComboBoxColumn Caption="Autoriza" FieldName="autoriza" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">                                                
                            <PropertiesComboBox DataSourceID="SDS_Usuarios" ValueField="key_usuario" TextFormatString="{0} | {1}" SelectInputTextOnClick="true" ValueType="System.Int32" TextField="nombre">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Nombre" FieldName="nombre" Name="nombre">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Usuario" FieldName="usuario" Name="usuario">
                                    </dx:ListBoxColumn>
                                </Columns>
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RequiredField ErrorText="Autoriza es requerido" IsRequired="True" />
                                </ValidationSettings>

                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataComboBoxColumn Caption="Proveedor | Nombre Comercial | Representante | Número de Proveedor" FieldName="fkey_proveedores" ShowInCustomizationForm="True" VisibleIndex="16" Visible="False">
                            <PropertiesComboBox DataSourceID="SDS_Proveedores" NullValueItemDisplayText="{1}" TextFormatString="{0} | {1} | {2} | {3}" SelectInputTextOnClick="true" DisplayFormatInEditMode="true" TextField="proveedor"  ValueField="key_proveedores" ValueType="System.Int32">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Nombre" FieldName="proveedor" Name="proveedor" Width ="200px">                                        
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Nombre Comercial" FieldName="nombre_comercial" Name="nombre_comercial">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Representante" FieldName="representante" Name="representante">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn  Caption="Núm." FieldName="key_proveedores" Name="key_proveedores" Width="20px">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Tel. Prov." FieldName="telefono" Name="telefono">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Cel. Repr." FieldName="celular_representante" Name="celular_representante">
                                    </dx:ListBoxColumn>
                                </Columns>
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RequiredField ErrorText="Proveedor es requerido" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataComboBoxColumn Caption="Tipo" FieldName="tipo" ShowInCustomizationForm="True" VisibleIndex="4" Width="50px">
                            <PropertiesComboBox DataSourceID="SDS_Tipo_orden_compra" SelectInputTextOnClick="true" TextField="tipo_oc" ValueField="key_orden_compra_tipo" ValueType="System.Int32" ImageUrlField="imagen">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RequiredField ErrorText="Tipo es requerido" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataComboBoxColumn  Caption="Lugar de entrega" FieldName="lugar_entrega" ShowInCustomizationForm="True" VisibleIndex="5" Width="50px">
                            <PropertiesComboBox DataSourceID="SDS_Entrega" SelectInputTextOnClick="true" TextField="entrega" ValueField="key_orden_compra_entrega" ValueType="System.Int32">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RequiredField ErrorText="Lugar de entrega es requerido" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataComboBoxColumn Caption="Centro de Costos" FieldName="key_centrocostos" Name="key_centrocostos_column" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                            <PropertiesComboBox DataSourceID="SDS_Centrocostos" TextField="centrocostos" ValueField="key_centrocostos">
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Proveedor" FieldName="fkey_proveedores" Name="fkey_proveedores_column" ShowInCustomizationForm="True" VisibleIndex="3" Width="150px">
                            <PropertiesComboBox DataSourceID="SDS_Proveedores" TextField="proveedor" ValueField="key_proveedores">
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Comprador" FieldName="fkey_compradores" Name="fkey_compradores_column" ShowInCustomizationForm="True" VisibleIndex="9">
                            <PropertiesComboBox DataSourceID="SDS_Compradores" TextField="nombre" ValueField="key_compradores">
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataTextColumn Caption="Descuento Global" FieldName="descuento_global" Name="descuento_global" ShowInCustomizationForm="True" Visible="False" VisibleIndex="32">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Descuento Nota de Crédito" FieldName="descuento_notcred" Name="descuento_notcred" ShowInCustomizationForm="True" Visible="False" VisibleIndex="33">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Descuento Precio Unitario" FieldName="descuento_unitario" Name="descuento_unitario" ShowInCustomizationForm="True" Visible="False" VisibleIndex="34">
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataCheckColumn Caption="Autorizada" FieldName="estatus_autoriza" ShowInCustomizationForm="True" VisibleIndex="6" Width="50px">
                            <PropertiesCheckEdit ValueChecked="1" ValueType="System.Int32" ValueUnchecked="0">
                                <DisplayImageChecked IconID="conditionalformatting_iconsetsigns3_16x16">
                                </DisplayImageChecked>
                                <DisplayImageUnchecked IconID="conditionalformatting_iconsetredtoblack4_16x16">
                                </DisplayImageUnchecked>
                            </PropertiesCheckEdit>
                        </dx:GridViewDataCheckColumn>

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

                    <SettingsBehavior AllowFocusedRow="true" ConfirmDelete="True" AllowEllipsisInText="True" />

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
                </dx:ASPxGridView>--%>

                <dx:ASPxGridView ID="ASPxGridView2" ClientInstanceName="ASPxGridView2" OnCellEditorInitialize="ASPxGridView2_CellEditorInitialize" runat="server" AutoGenerateColumns="False" DataSourceID="Orden_compra_det" KeyFieldName="key_orden_compra_det" EnableTheming="True" >
                <SettingsEditing Mode="Batch">
                    <BatchEditSettings ShowConfirmOnLosingChanges="true" EditMode="Cell" />
                </SettingsEditing>
                <ClientSideEvents BatchEditStartEditing="OnBatchEditStartEditing" />
                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="key_orden_compra_det" ReadOnly="True" VisibleIndex="1">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="cantidad" VisibleIndex="5" Visible="False">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="costo_unitario" VisibleIndex="6" Visible="False">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn SettingsHeaderFilter-ListBoxSearchUISettings-EnableAnimation ="true" FieldName="fkey_articulo" VisibleIndex="2" Name="fkey_articulo">
                        <PropertiesComboBox DataSourceID="SDS_Articulos" TextField="descripcion" ValueField="key_articulo">
                            <ClientSideEvents SelectedIndexChanged ="OnSelectedIndexChanged" />
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Name="fkey_articulos_color" FieldName="fkey_articulos_color" VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="SDS_Colores" TextField="descrip" ValueField="key_color" TextFormatString="{0} | {1}" DisplayFormatInEditMode="True" SelectInputTextOnClick="True" ValueType="System.Int32">                            
                            <Columns>
                                <dx:ListBoxColumn Caption="Codigo" FieldName="color" Name="color">
                                </dx:ListBoxColumn>
                                <dx:ListBoxColumn Caption="Color" FieldName="descrip" Name="descrip">
                                </dx:ListBoxColumn>
                            </Columns>
                            <ClientSideEvents EndCallback ="ColorCombo_EndCallback"  />
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="fkey_articulos_tallas" VisibleIndex="4">
                        <PropertiesComboBox DataSourceID="SDS_Tallas" TextField="descrip" ValueField="key_tallas" TextFormatString="{0} | {1}" DisplayFormatInEditMode="True" SelectInputTextOnClick="True" ValueType="System.Int32">
                            <Columns>
                                <dx:ListBoxColumn Caption="Codigo" FieldName="tallas" Name="tallas">
                                </dx:ListBoxColumn>
                                <dx:ListBoxColumn Caption="Talla" FieldName="descrip" Name="descrip">
                                </dx:ListBoxColumn>
                            </Columns>
                            <ClientSideEvents EndCallback ="TallasCombo_EndCallback"  />
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                </Columns>
            </dx:ASPxGridView>              


<%--                <br />
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>--%>
</div>

                <asp:SqlDataSource ID="SDS_Orden_compra" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
                    DeleteCommand="DELETE FROM &quot;Orden_compra&quot; WHERE key_orden_compra = ?" 
                    InsertCommand="INSERT INTO &quot;Orden_compra&quot; (key_centrocostos, fkey_compradores, oc, solicita, autoriza, fkey_proveedores, fecha, tipo, lugar_entrega,descuento_unitario, descuento_global, descuento_notcred ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_orden_compra, key_centrocostos, fkey_compradores, oc, solicita, autoriza, fecha_autoriza, fkey_proveedores, fecha, tipo, lugar_entrega, porcentaje_iva, sub_total, iva, total, recibido_sub_total, recibido_iva, recibido_total, ajuste_sub_total, ajuste_iva, ajuste_total, cancela_sub_total, cancela_iva, cancela_total, total_facturado, total_pagado, estatus_recibido, estatus_autoriza, estatus_impresa, descuento_unitario, descuento_global, descuento_notcred  FROM &quot;Orden_compra&quot; ORDER BY key_orden_compra DESC" 
                    UpdateCommand="UPDATE &quot;Orden_compra&quot; SET key_centrocostos=?, fkey_compradores=?, oc=?, solicita=?, autoriza=?, fkey_proveedores=?, fecha=?, tipo=?, lugar_entrega=?, descuento_unitario=?, descuento_global=?, descuento_notcred=? WHERE key_orden_compra = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_orden_compra" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>    
                        <asp:Parameter Name="key_centrocostos" Type="Int32" />
                        <asp:Parameter Name="fkey_compradores" Type="Int32" />
                        <asp:Parameter Name="oc" Type="Int32" />
                        <asp:Parameter Name="solicita" Type="Int32" />
                        <asp:Parameter Name="autoriza" Type="Int32" />
                        <asp:Parameter Name="fkey_proveedores"  Type="Int32" />
                        <asp:Parameter Name="fecha" Type="DateTime" />
                        <asp:Parameter Name="tipo"  Type="Int32" />
                        <asp:Parameter Name="lugar_entrega" Type="Int32" />
                        <asp:Parameter Name="descuento_unitario" Type="Int32" />
                        <asp:Parameter Name="descuento_global" Type="Int32" />
                        <asp:Parameter Name="descuento_notcred" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="key_centrocostos" Type="Int64" />
                        <asp:Parameter Name="fkey_compradores" Type="Int64" />
                        <asp:Parameter Name="oc" Type="Int64" />
                        <asp:Parameter Name="solicita" Type="Int64" />
                        <asp:Parameter Name="autoriza" Type="Int64" />                        
                        <asp:Parameter Name="fkey_proveedores"  Type="Int64" />
                        <asp:Parameter Name="fecha" Type="DateTime" />
                        <asp:Parameter Name="tipo"  Type="Int64" />
                        <asp:Parameter Name="lugar_entrega" Type="Int64" />
                        <asp:Parameter Name="descuento_unitario" Type="Int32" />
                        <asp:Parameter Name="descuento_global" Type="Int32" />
                        <asp:Parameter Name="descuento_notcred" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_Proveedores" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="select key_proveedores, proveedor, telefono, extension,celular, nombre_comercial, ( select representante as representante from &quot;Representantes&quot;  where key_representantes = ( select fkey_representantes from &quot;Proveedores_representantes&quot; where fkey_proveedores = &quot;Proveedores&quot;.key_proveedores  order by fecha desc LIMIT 1) ), ( select celular as celular_representante from &quot;Representantes&quot;  where key_representantes = ( select fkey_representantes from &quot;Proveedores_representantes&quot; where fkey_proveedores = &quot;Proveedores&quot;.key_proveedores  order by fecha desc LIMIT 1) ) from &quot;Proveedores&quot; ">
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_Compradores" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="select key_compradores,fkey_usuario,&quot;Usuarios&quot;.usuario,&quot;Usuarios&quot;.nombre from &quot;Compradores&quot;,&quot;Usuarios&quot; where (&quot;Usuarios&quot;.key_usuario = &quot;Compradores&quot;.fkey_usuario) and usuario = ? limit 1">
                    <SelectParameters>
                        <asp:SessionParameter Name="?" Type="String" SessionField="usuario" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_Centrocostos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="select key_centrocostos,centrocostos from &quot;CentroCostos&quot; where key_centrocostos in ( select fkey_centrocostos from &quot;Compradores&quot; where fkey_usuario = ( select key_usuario from &quot;Usuarios&quot; where usuario = ?))">
                    <SelectParameters>
                        <asp:SessionParameter Name="?" Type="String" SessionField="usuario" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_Usuarios" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_usuario, usuario, nombre FROM &quot;Usuarios&quot; ORDER BY nombre"></asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_Tipo_orden_compra" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_orden_compra_tipo,tipo_oc,imagen FROM &quot;Orden_compra_tipo&quot;">
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_Entrega" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_orden_compra_entrega, entrega FROM &quot;Orden_compra_entrega&quot;"></asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_Orden_compra_det" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
                    DeleteCommand="DELETE FROM &quot;Orden_compra_det&quot; WHERE key_orden_compra_det = ?" 
                    InsertCommand="INSERT INTO &quot;Orden_compra_det&quot; (fkey_orden_compra, fkey_centrocostos, partida, fkey_articulo, fkey_articulos_color, fkey_articulos_tallas, fecha_entrega, cantidad, costo_unitario, costo_unitario_neto, descuento_unitario_porc, descuento_global_porc, descuento_notcred_porc, descuento_unitario, descuento_global, descuento_notcred, importe, ajuste_cantidad, ajuste_importe, recibido_cantidad, recibido_importe, cancela_cantidad, cancela_importe, porcentaje_iva, iva) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_orden_compra_det, fkey_orden_compra, fkey_centrocostos, partida, fkey_articulo, fkey_articulos_color, fkey_articulos_tallas, fecha_entrega, cantidad, costo_unitario, costo_unitario_neto, descuento_unitario_porc, descuento_global_porc, descuento_notcred_porc, descuento_unitario, descuento_global, descuento_notcred, importe, ajuste_cantidad, ajuste_importe, recibido_cantidad, recibido_importe, cancela_cantidad, cancela_importe, porcentaje_iva, iva FROM &quot;Orden_compra_det&quot; WHERE fkey_centrocostos = ? and fkey_orden_compra = ?" 
                    UpdateCommand="UPDATE &quot;Orden_compra_det&quot; SET fkey_orden_compra=?, fkey_centrocostos=?, partida=?, fkey_articulo=?, fkey_articulos_color=?, fkey_articulos_tallas=?, fecha_entrega=?, cantidad=?, costo_unitario=?, costo_unitario_neto=?, descuento_unitario_porc=?, descuento_global_porc=?, descuento_notcred_porc=?, descuento_unitario=?, descuento_global=?, descuento_notcred=?, importe=?, ajuste_cantidad=?, ajuste_importe=?, recibido_cantidad=?, recibido_importe=?, cancela_cantidad=?, cancela_importe=?, porcentaje_iva=?, iva=? WHERE key_orden_compra_det =?">
                    <SelectParameters>
                        <asp:SessionParameter Name="fkey_centrocostos" SessionField="session_key_centrocostos"/>
                        <asp:SessionParameter Name="fkey_orden_compra" SessionField="session_key_orden_compra"/>                        
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="key_orden_compra_det" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>                            
                        <asp:Parameter Name="fkey_orden_compra" Type="Int64" />
                        <asp:Parameter Name="fkey_centrocostos" Type="Int64" />
                        <asp:Parameter Name="partida" Type="Int32" />
                        <asp:Parameter Name="fkey_articulo" Type="Int64" />
                        <asp:Parameter Name="fkey_articulos_color" Type="Int64" />
                        <asp:Parameter Name="fkey_articulos_tallas" Type="Int64" />
                        <asp:Parameter Name="fecha_entrega" Type="DateTime" />
                        <asp:Parameter Name="cantidad" Type="Int32" />
                        <asp:Parameter Name="costo_unitario" Type="Decimal" />
                        <asp:Parameter Name="costo_unitario_neto" Type="Decimal" />
                        <asp:Parameter Name="descuento_unitario_porc" Type="Decimal" />
                        <asp:Parameter Name="descuento_global_porc" Type="Decimal" />
                        <asp:Parameter Name="descuento_notcred_porc" Type="Decimal" />
                        <asp:Parameter Name="descuento_unitario" Type="Decimal" />
                        <asp:Parameter Name="descuento_global" Type="Decimal" />
                        <asp:Parameter Name="descuento_notcred" Type="Decimal" />
                        <asp:Parameter Name="importe" Type="Decimal" />
                        <asp:Parameter Name="ajuste_cantidad" Type="Int32" />
                        <asp:Parameter Name="ajuste_importe" Type="Decimal" />
                        <asp:Parameter Name="recibido_cantidad" Type="Int32" />
                        <asp:Parameter Name="recibido_importe" Type="Decimal" />
                        <asp:Parameter Name="cancela_cantidad" Type="Int32" />
                        <asp:Parameter Name="cancela_importe" Type="Decimal" />
                        <asp:Parameter Name="porcentaje_iva" Type="Decimal" />
                        <asp:Parameter Name="iva" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="fkey_orden_compra" Type="Int64" />
                        <asp:Parameter Name="fkey_centrocostos" Type="Int64" />
                        <asp:Parameter Name="partida" Type="Int32" />
                        <asp:Parameter Name="fkey_articulo" Type="Int64" />
                        <asp:Parameter Name="fkey_articulos_color" Type="Int64" />
                        <asp:Parameter Name="fkey_articulos_tallas" Type="Int64" />
                        <asp:Parameter Name="fecha_entrega" Type="DateTime" />
                        <asp:Parameter Name="cantidad" Type="Int32" />
                        <asp:Parameter Name="costo_unitario" Type="Decimal" />
                        <asp:Parameter Name="costo_unitario_neto" Type="Decimal" />
                        <asp:Parameter Name="descuento_unitario_porc" Type="Decimal" />
                        <asp:Parameter Name="descuento_global_porc" Type="Decimal" />
                        <asp:Parameter Name="descuento_notcred_porc" Type="Decimal" />
                        <asp:Parameter Name="descuento_unitario" Type="Decimal" />
                        <asp:Parameter Name="descuento_global" Type="Decimal" />
                        <asp:Parameter Name="descuento_notcred" Type="Decimal" />
                        <asp:Parameter Name="importe" Type="Decimal" />
                        <asp:Parameter Name="ajuste_cantidad" Type="Int32" />
                        <asp:Parameter Name="ajuste_importe" Type="Decimal" />
                        <asp:Parameter Name="recibido_cantidad" Type="Int32" />
                        <asp:Parameter Name="recibido_importe" Type="Decimal" />
                        <asp:Parameter Name="cancela_cantidad" Type="Int32" />
                        <asp:Parameter Name="cancela_importe" Type="Decimal" />
                        <asp:Parameter Name="porcentaje_iva" Type="Decimal" />
                        <asp:Parameter Name="iva" Type="Decimal" />
                        <asp:Parameter Name="key_orden_compra_det" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="Orden_compra_det" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                        SelectCommand="SELECT key_orden_compra_det,fkey_centrocostos,fkey_orden_compra, fkey_articulo, fkey_articulos_color, fkey_articulos_tallas, cantidad, costo_unitario FROM &quot;Orden_compra_det&quot; ORDER BY key_orden_compra_det DESC" 
                        DeleteCommand="DELETE FROM &quot;Orden_compra_det&quot; WHERE key_orden_compra_det = ?" 
                        InsertCommand="INSERT INTO &quot;Orden_compra_det&quot; ( fkey_articulo, fkey_articulos_color, fkey_articulos_tallas) VALUES (?, ?, ?)" 
                        UpdateCommand="UPDATE &quot;Orden_compra_det&quot; SET fkey_articulo = ?, fkey_articulos_color = ?, fkey_articulos_tallas = ? WHERE key_orden_compra_det = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_orden_compra_det" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="fkey_articulo" Type="Int64" />
                        <asp:Parameter Name="fkey_articulos_color" Type="Int64" />
                        <asp:Parameter Name="fkey_articulos_tallas" Type="Int64" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="fkey_articulo" Type="Int64" />
                        <asp:Parameter Name="fkey_articulos_color" Type="Int64" />
                        <asp:Parameter Name="fkey_articulos_tallas" Type="Int64" />
                        <asp:Parameter Name="key_orden_compra_det" Type="Int64" />
                    </UpdateParameters>
                    </asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_Tallas" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_tallas, right(tallas,2) as tallas, descrip, fkey_articulo, fkey_rango FROM &quot;Articulos_tallas&quot;"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SDS_Colores" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_color, right(color,2) as color, descrip, fkey_articulo FROM &quot;Articulos_color&quot;"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SDS_Articulos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_articulo, descripcion FROM &quot;Articulos&quot;"></asp:SqlDataSource>

</asp:Content>

