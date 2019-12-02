<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="OrdenCompra.aspx.cs" Inherits="CG_InvWeb.Compras.OrdenCompra" %>

<%@ Register Assembly="DevExpress.Xpo.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Xpo" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">

        var curentEditingIndex;
        var lastPAIS = null;
        var lastCmb = null;
        var isCustomCascadingCallback = false;
        var isCustomCascadingCallbackTallas = false;
        var fieldName;

        function OnSelectedIndexChanged(s, e) {
            lastPAIS = s.GetValue();
            isCustomCascadingCallback = true;
            isCustomCascadingCallbackTallas = true;
            RefreshDataColor(lastPAIS);
            RefreshDataTallas(lastPAIS);
            alert("OnSelectedIndexChange");

        }
        function ColorCombo_EndCallback(s, e) {

            if (isCustomCascadingCallback) {
                if (s.GetItemCount() > 0)
                    grdCliente.batchEditApi.SetCellValue(curentEditingIndex, "fkey_articulos_color", s.GetItem(0).value);
                isCustomCascadingCallback = false;                
            }
            else {
                grdCliente.batchEditApi.SetCellValue(curentEditingIndex, "fkey_articulos_color", s.GetItem(0).value);
                grdCliente.batchEditApi.StartEdit(curentEditingIndex, grdCliente.GetColumnByField("fkey_articulos_color").index);
            }
        }
        function TallasCombo_EndCallback(s, e) {
            if (isCustomCascadingCallbackTallas) {
                if (s.GetItemCount() > 0)
                    grdCliente.batchEditApi.SetCellValue(curentEditingIndex, "fkey_articulos_tallas", s.GetItem(0).value);
                isCustomCascadingCallbackTallas = false;
            }
            else {
                grdCliente.batchEditApi.SetCellValue(curentEditingIndex, "fkey_articulos_tallas", s.GetItem(0).value);
                grdCliente.batchEditApi.StartEdit(curentEditingIndex, grdCliente.GetColumnByField("fkey_articulos_tallas").index);
            }
        }

        function OnBatchEditStartEditing(s, e) {
            fieldName = e.focusedColumn.fieldName;
            curentEditingIndex = e.visibleIndex;
            var currentPAIS = grdCliente.batchEditApi.GetCellValue(curentEditingIndex, "fkey_articulo");
            //grdCliente.batchEditApi.SetCellValue(curentEditingIndex, "fkey_articulos_color", s.GetItem(0).value);
            if ((currentPAIS != lastPAIS || lastCmb == "fkey_articulos_tallas") && e.focusedColumn.fieldName == "fkey_articulos_color" && currentPAIS != null) {
                e.cancel = true;
                lastPAIS = currentPAIS;
                lastCmb = "fkey_articulos_color";
                grdCliente.batchEditApi.SetCellValue(curentEditingIndex, "fkey_articulos_color", "...");
                RefreshDataColor(currentPAIS);
            }
            if ((currentPAIS != lastPAIS || lastCmb == "fkey_articulos_color") && e.focusedColumn.fieldName == "fkey_articulos_tallas" && currentPAIS != null) {
                e.cancel = true;
                lastPAIS = currentPAIS;
                lastCmb = "fkey_articulos_tallas";
                grdCliente.batchEditApi.SetCellValue(curentEditingIndex, "fkey_articulos_tallas", "...");
                RefreshDataTallas(currentPAIS);
            }
        }
        function RefreshDataColor(currentPAIS) {
            grdCliente.GetEditor("fkey_articulos_color").PerformCallback(currentPAIS);
            alert("RefreshDataColor");
        }
        function RefreshDataTallas(currentPAIS) {
            grdCliente.GetEditor("fkey_articulos_tallas").PerformCallback(currentPAIS);
            alert("RefreshDataTallas");

        }

        function OnBatchEditEndEditing(s, e) {
          
            if (fieldName == "costo_unitario" || fieldName == "unitario_descuento_porc" || fieldName == "cantidad" || fieldName == "global_descuento_porc" || fieldName == "notcred_descuento_porc")
            {
                var cUniDesPorc = s.GetColumnByField("unitario_descuento_porc");
                var cUniDesPorc = e.rowValues[cUniDesPorc.index].value;
                var cCosto = s.GetColumnByField("costo_unitario");
                var cCosto = e.rowValues[cCosto.index].value;
                var cCantidad = s.GetColumnByField("cantidad");
                var cCantidad = e.rowValues[cCantidad.index].value;
                var cGloDesPorc = s.GetColumnByField("global_descuento_porc");
                var cGloDesPorc = e.rowValues[cGloDesPorc.index].value;
                var cNotDesPorc = s.GetColumnByField("notcred_descuento_porc");
                var cNotDesPorc = e.rowValues[cNotDesPorc.index].value;

                //var cGloDesPorc = s.batchEditApi.GetCellValue(e.visibleIndex, "global_descuento_porc");
                //var cNotDesPorc = s.batchEditApi.GetCellValue(e.visibleIndex, "notcred_descuento_porc");

                var cUniDes = Math.round(cCosto * cUniDesPorc) / 100;
                var cUniDesImp = cCantidad * cUniDes;
                var cUniCosNet = cCosto - cUniDes;
                var cUniImpTot = cUniCosNet * cCantidad;
                if (cGloDesPorc == 0) {
                    var cGloDes = 0;
                    var cGloDesImp = 0;
                } else {
                    var cGloDes = Math.round(cUniCosNet * cGloDesPorc) / 100;
                    var cGloDesImp = cGloDes * cCantidad;
                }
                var cGloCosNet = cCosto - cUniDes - cGloDes;
                var cGloImpTot = cGloCosNet * cCantidad;

                if (cNotDesPorc == 0) {
                    var cNotDes = 0;
                    var cNotDesImp = 0;
                } else {
                    var cNotDes = Math.round(cGloCosNet * cNotDesPorc) / 100;
                    var cNotDesImp = cNotDes * cCantidad;
                }
                var cNotCosNet = cCosto - cUniDes - cGloDes - cNotDes;
                var cNotImpTot = cNotCosNet * cCantidad;

                s.batchEditApi.SetCellValue(e.visibleIndex, "unitario_descuento", cUniDes, null, false);
                s.batchEditApi.SetCellValue(e.visibleIndex, "unitario_descuento_importe", cUniDesImp, null, false);
                s.batchEditApi.SetCellValue(e.visibleIndex, "unitario_costo_neto", cUniCosNet, null, false);
                s.batchEditApi.SetCellValue(e.visibleIndex, "unitario_importe_total", cUniImpTot, null, false);
                s.batchEditApi.SetCellValue(e.visibleIndex, "global_descuento", cGloDes, null, false);
                s.batchEditApi.SetCellValue(e.visibleIndex, "global_descuento_importe", cGloDesImp, null, false);
                s.batchEditApi.SetCellValue(e.visibleIndex, "global_costo_neto", cGloCosNet, null, false);
                s.batchEditApi.SetCellValue(e.visibleIndex, "global_importe_total", cGloImpTot, null, false);
                s.batchEditApi.SetCellValue(e.visibleIndex, "notcred_descuento", cNotDes, null, false);
                s.batchEditApi.SetCellValue(e.visibleIndex, "notcred_descuento_importe", cNotDesImp, null, false);
                s.batchEditApi.SetCellValue(e.visibleIndex, "notcred_costo_neto", cNotCosNet, null, false);
                s.batchEditApi.SetCellValue(e.visibleIndex, "notcred_importe_total", cNotImpTot, null, false);
            }
        }

    </script>

    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Orden de Compra" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Compras/OrdenCompra.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
        <dx:PanelContent runat="server">
        <div>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Orden_compra" EnableTheming="True" KeyFieldName="key_centrocostos; key_orden_compra" Theme="MaterialCompact" KeyboardSupport="True" Width="100%" OnBeforeGetCallbackResult="ASPxGridView1_BeforeGetCallbackResult" OnInitNewRow="ASPxGridView1_InitNewRow" OnRowInserting="ASPxGridView1_RowInserting" OnRowInserted="ASPxGridView1_RowInserted">
                <SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True" />                    
                <Templates>                        
                    <DetailRow> 
                        <dx:ASPxGridView ID="grdCliente" ClientInstanceName="grdCliente" OnCellEditorInitialize="grdCliente_CellEditorInitialize"  OnBeforePerformDataSelect="grdCliente_BeforePerformDataSelect" runat="server" AutoGenerateColumns="False" DataSourceID="Orden_compra_det" KeyFieldName="key_orden_compra_det" EnableTheming="True" Width="100%" Theme="Glass" KeyboardSupport="True" OnInitNewRow="grdCliente_InitNewRow" OnRowInserting="grdCliente_RowInserting" >
                            <SettingsPager Mode="EndlessPaging" Position ="Top" PageSize="10">
                            </SettingsPager>
                            <ClientSideEvents BatchEditStartEditing="OnBatchEditStartEditing" BatchEditEndEditing="OnBatchEditEndEditing" />
                            <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="True">
                                <AdaptiveDetailLayoutProperties ShowItemCaptionColon="False">
                                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="800">
                                    </SettingsAdaptivity>                    
                                    <SettingsItemCaptions Location="Top" />
                                </AdaptiveDetailLayoutProperties>
                            </SettingsAdaptivity>
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <SettingsEditing Mode="Batch">
                                <BatchEditSettings ShowConfirmOnLosingChanges="true" EditMode="Cell" />
                            </SettingsEditing>
                            <Settings VerticalScrollBarMode="Auto" VerticalScrollBarStyle="VirtualSmooth" VerticalScrollableHeight="240" HorizontalScrollBarMode="Auto" ShowFooter="True" ShowGroupFooter="VisibleAlways"  />
                            <SettingsBehavior AllowSort="false" AllowFocusedRow="True" AllowEllipsisInText="True" ConfirmDelete="True" />
                            <SettingsResizing ColumnResizeMode="Control" />
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
                            <Columns>
                                <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="50px" FixedStyle="Left">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="key_orden_compra_det" ReadOnly="True" VisibleIndex="1" ShowInCustomizationForm="True" Visible="False">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataComboBoxColumn SettingsHeaderFilter-ListBoxSearchUISettings-EnableAnimation ="true" FieldName="fkey_articulo" VisibleIndex="3" Name="fkey_articulo" Caption="Artículo" FixedStyle="Left">
                                    <PropertiesComboBox LoadDropDownOnDemand="true" DataSourceID="SDS_Articulos" TextField="descripcion" ValueField="key_articulo" NullValueItemDisplayText="{0}  |  {1}  |  {2}" TextFormatString="{0}  |  {1}  |  {2}">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Codigo" FieldName="codigo_articulo" Name="codigo_articulo">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Descripción" FieldName="descripcion" Name="descripcion">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Modelo" FieldName="modelo" Name="modelo">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Departamento" FieldName="departamento" Name="departamento">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Clasificación" FieldName="clasificacion" Name="clasificacion">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Familia" FieldName="familia" Name="familia">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                        <ClientSideEvents SelectedIndexChanged ="OnSelectedIndexChanged" />
                                    </PropertiesComboBox>
                                    <CellStyle>
                                        <BorderRight BorderColor="#666666" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Name="fkey_articulos_color" FieldName="fkey_articulos_color" VisibleIndex="4" Caption="Color" >
                                    <PropertiesComboBox LoadDropDownOnDemand="true" DataSourceID="SDS_Colores" TextField="descrip" ValueField="key_color" TextFormatString="{0} | {1}" DisplayFormatInEditMode="True" SelectInputTextOnClick="True" ValueType="System.Int32">                            
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Codigo" FieldName="color" Name="color">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Color" FieldName="descrip" Name="descrip">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                        <ClientSideEvents EndCallback ="ColorCombo_EndCallback"  />
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn FieldName="fkey_articulos_tallas" VisibleIndex="5" Caption="Talla">
                                    <PropertiesComboBox LoadDropDownOnDemand="true" DataSourceID="SDS_Tallas" TextField="descrip" ValueField="key_tallas" TextFormatString="{0} | {1}" DisplayFormatInEditMode="True" SelectInputTextOnClick="True" ValueType="System.Int32">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Codigo" FieldName="tallas" Name="tallas">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Talla" FieldName="descrip" Name="descrip">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                        <ClientSideEvents EndCallback ="TallasCombo_EndCallback"  />
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataTextColumn FieldName="partida" VisibleIndex="2" Caption="Part." ReadOnly="True" Width="40px" FixedStyle="Left">
                                    <PropertiesTextEdit>
                                        <ReadOnlyStyle BackColor="#C0E0E7">
                                        </ReadOnlyStyle>
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataSpinEditColumn Caption="Costo" FieldName="costo_unitario" VisibleIndex="8" Width="100px">
                                    <PropertiesSpinEdit Style-HorizontalAlign="Right" DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="c" MaxValue="9999999999.99" NumberFormat="Currency">
                                        <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                        </SpinButtons>
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                        <Style HorizontalAlign="Right">
                                        </Style>
                                    </PropertiesSpinEdit>
                                </dx:GridViewDataSpinEditColumn>
                                <dx:GridViewDataSpinEditColumn FieldName="cantidad" VisibleIndex="7" Caption="Cantidad" Width="100px">
                                    <PropertiesSpinEdit DisplayFormatInEditMode="True" DisplayFormatString="N0" MaxValue="999999" NumberFormat="Custom" NumberType="Integer" SelectInputTextOnClick="True">
                                        <SpinButtons ClientVisible="False">
                                        </SpinButtons>
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesSpinEdit>
                                </dx:GridViewDataSpinEditColumn>
                                <dx:GridViewDataDateColumn Caption="Fecha de Entrega" FieldName="fecha_entrega" VisibleIndex="6" Width="100px">
                                    <PropertiesDateEdit DisplayFormatString="dd/MMM/yy" SelectInputTextOnClick="True">
                                    </PropertiesDateEdit>
                                    <HeaderStyle Wrap="True" />
                                </dx:GridViewDataDateColumn>

                                <dx:GridViewBandColumn Caption="Descto. Unitario" VisibleIndex="24">
                                    <%--<HeaderStyle  BackColor="#0066FF" />--%>
                                    <Columns>
                                        <dx:GridViewDataSpinEditColumn  Caption="% Descto." FieldName="unitario_descuento_porc" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px">                                           
                                            <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="P2" MaxValue="100.00" NumberFormat="Percent">
                                                <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                </SpinButtons>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <Style HorizontalAlign="Right">
                                                </Style>
                                            </PropertiesSpinEdit>
                                            <HeaderStyle BackColor="#0066FF" />
                                            <CellStyle BackColor="#aefff0">
                                            </CellStyle>
                                        </dx:GridViewDataSpinEditColumn>
                                        <dx:GridViewDataSpinEditColumn ReadOnly="true" Caption="Descuento" FieldName="unitario_descuento" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                            <PropertiesSpinEdit  DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="c" MaxValue="9999999999.99" NumberFormat="Currency">
                                                <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                </SpinButtons>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <Style HorizontalAlign="Right">
                                                </Style>
                                            </PropertiesSpinEdit>
                                            <HeaderStyle BackColor="#0066FF" />
                                        </dx:GridViewDataSpinEditColumn>
                                        <dx:GridViewDataSpinEditColumn ReadOnly="true" Caption="Importe Descto" FieldName="unitario_descuento_importe" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                            <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="c" MaxValue="9999999999.99" NumberFormat="Currency">
                                                <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                </SpinButtons>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <Style HorizontalAlign="Right">
                                                </Style>
                                            </PropertiesSpinEdit>
                                            <HeaderStyle BackColor="#0066FF" />
                                        </dx:GridViewDataSpinEditColumn>
                                        <dx:GridViewDataSpinEditColumn ReadOnly="true" Caption="Costo neto" FieldName="unitario_costo_neto" ShowInCustomizationForm="True" VisibleIndex="3" Width="100px">
                                            <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="c" MaxValue="9999999999.99" NumberFormat="Currency">
                                                <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                </SpinButtons>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <Style HorizontalAlign="Right">
                                                </Style>
                                            </PropertiesSpinEdit>
                                            <HeaderStyle BackColor="#0066FF" />
                                        </dx:GridViewDataSpinEditColumn>
                                        <dx:GridViewDataSpinEditColumn ReadOnly="true" Caption="Importe" FieldName="unitario_importe_total" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                            <PropertiesSpinEdit  DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="c" MaxValue="9999999999.99" NumberFormat="Currency">
                                                <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                </SpinButtons>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <Style HorizontalAlign="Right">
                                                </Style>
                                            </PropertiesSpinEdit>
                                            <HeaderStyle BackColor="#0066FF" />
                                        </dx:GridViewDataSpinEditColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Descto. Global" VisibleIndex="25">
                                    <%--<HeaderStyle BackColor="#339966" />--%>
                                    <Columns>
                                        <dx:GridViewDataSpinEditColumn Caption="% Descto." FieldName="global_descuento_porc" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px">
                                            <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="P2" MaxValue="100.00" NumberFormat="Percent">
                                                <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                </SpinButtons>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <Style HorizontalAlign="Right">
                                                </Style>
                                            </PropertiesSpinEdit>
                                            <HeaderStyle BackColor="#339966" />
                                            <CellStyle BackColor="#9FDFBF">
                                            </CellStyle>
                                        </dx:GridViewDataSpinEditColumn>
                                        <dx:GridViewDataSpinEditColumn ReadOnly="true" Caption="Descuento" FieldName="global_descuento" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                            <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="c" MaxValue="9999999999.99" NumberFormat="Currency">
                                                <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                </SpinButtons>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <Style HorizontalAlign="Right">
                                                </Style>
                                            </PropertiesSpinEdit>
                                            <HeaderStyle BackColor="#339966" />
                                        </dx:GridViewDataSpinEditColumn>
                                        <dx:GridViewDataSpinEditColumn ReadOnly="true" Caption="Importe Descto" FieldName="global_descuento_importe" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                            <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="c" MaxValue="9999999999.99" NumberFormat="Currency">
                                                <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                </SpinButtons>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <Style HorizontalAlign="Right">
                                                </Style>
                                            </PropertiesSpinEdit>
                                            <HeaderStyle BackColor="#339966" />
                                        </dx:GridViewDataSpinEditColumn>
                                        <dx:GridViewDataSpinEditColumn ReadOnly="true" Caption="Costo neto" FieldName="global_costo_neto" ShowInCustomizationForm="True" VisibleIndex="3" Width="100px">
                                            <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="c" MaxValue="9999999999.99" NumberFormat="Currency">
                                                <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                </SpinButtons>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <Style HorizontalAlign="Right">
                                                </Style>
                                            </PropertiesSpinEdit>
                                            <HeaderStyle BackColor="#339966" />
                                        </dx:GridViewDataSpinEditColumn>
                                        <dx:GridViewDataSpinEditColumn ReadOnly="true" Caption="Importe" FieldName="global_importe_total" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                            <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="c" MaxValue="9999999999.99" NumberFormat="Currency">
                                                <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                </SpinButtons>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <Style HorizontalAlign="Right">
                                                </Style>
                                            </PropertiesSpinEdit>
                                            <HeaderStyle BackColor="#339966" />
                                        </dx:GridViewDataSpinEditColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Descto. Nota de Crédito" VisibleIndex="26">
                                    <%--<HeaderStyle BackColor="#FFFF99" />--%>
                                    <Columns>
                                        <dx:GridViewDataSpinEditColumn Caption="% Descto." FieldName="notcred_descuento_porc" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px">
                                            <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="P2" MaxValue="100.00" NumberFormat="Percent">
                                                <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                </SpinButtons>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <Style HorizontalAlign="Right">
                                                </Style>
                                            </PropertiesSpinEdit>
                                            <HeaderStyle BackColor="#FFFF99" />
                                            <CellStyle BackColor="#f0f09c">
                                            </CellStyle>
                                        </dx:GridViewDataSpinEditColumn>
                                        <dx:GridViewDataSpinEditColumn ReadOnly="true" Caption="Descuento" FieldName="notcred_descuento" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                            <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="c" MaxValue="9999999999.99" NumberFormat="Currency">
                                                <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                </SpinButtons>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <Style HorizontalAlign="Right">
                                                </Style>
                                            </PropertiesSpinEdit>
                                            <HeaderStyle BackColor="#FFFF99" />
                                        </dx:GridViewDataSpinEditColumn>
                                        <dx:GridViewDataSpinEditColumn ReadOnly="true" Caption="Importe Descto" FieldName="notcred_descuento_importe" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                            <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="c" MaxValue="9999999999.99" NumberFormat="Currency">
                                                <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                </SpinButtons>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <Style HorizontalAlign="Right">
                                                </Style>
                                            </PropertiesSpinEdit>
                                            <HeaderStyle BackColor="#FFFF99" />
                                        </dx:GridViewDataSpinEditColumn>
                                        <dx:GridViewDataSpinEditColumn ReadOnly="true" Caption="Costo neto" FieldName="notcred_costo_neto" ShowInCustomizationForm="True" VisibleIndex="3" Width="100px">
                                            <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="c" MaxValue="9999999999.99" NumberFormat="Currency">
                                                <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                </SpinButtons>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <Style HorizontalAlign="Right">
                                                </Style>
                                            </PropertiesSpinEdit>
                                            <HeaderStyle BackColor="#FFFF99" />
                                        </dx:GridViewDataSpinEditColumn>
                                        <dx:GridViewDataSpinEditColumn ReadOnly="true" Caption="Importe" FieldName="notcred_importe_total" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                            <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatInEditMode="True" DisplayFormatString="c" MaxValue="9999999999.99" NumberFormat="Currency">
                                                <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                </SpinButtons>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <Style HorizontalAlign="Right">
                                                </Style>
                                            </PropertiesSpinEdit>
                                            <HeaderStyle BackColor="#FFFF99" />
                                        </dx:GridViewDataSpinEditColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>

                            </Columns>
                            <TotalSummary>                                
                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="unitario_importe_total" SummaryType="Sum" ValueDisplayFormat="c2" />
                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="unitario_descuento_importe" SummaryType="Sum" ValueDisplayFormat="c2" />
                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="global_descuento_importe" SummaryType="Sum" ValueDisplayFormat="c2" />
                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="global_importe_total" SummaryType="Sum" ValueDisplayFormat="c2" />
                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="notcred_descuento_importe" SummaryType="Sum" ValueDisplayFormat="c2" />
                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="notcred_importe_total" SummaryType="Sum" ValueDisplayFormat="c2" />
                            </TotalSummary>
                        </dx:ASPxGridView>                            
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
            </dx:ASPxGridView>

           
        </div>
        <br />
        </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>

    <asp:SqlDataSource ID="Orden_compra_det" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
        SelectCommand="SELECT key_orden_compra_det, fkey_centrocostos, fkey_orden_compra, fkey_articulo, fkey_articulos_color, fkey_articulos_tallas, partida, fecha_entrega, cantidad, costo_unitario, unitario_descuento_porc, unitario_descuento, unitario_descuento_importe, unitario_costo_neto, unitario_importe_total, global_descuento_porc, global_descuento, global_descuento_importe, global_costo_neto, global_importe_total, notcred_descuento_porc, notcred_descuento, notcred_descuento_importe, notcred_costo_neto, notcred_importe_total, descuento_neto, descuento_importe, costo_neto, importe_total FROM &quot;Orden_compra_det&quot; WHERE fkey_centrocostos = ? and fkey_orden_compra = ? ORDER BY partida" 
        DeleteCommand="DELETE FROM &quot;Orden_compra_det&quot; WHERE key_orden_compra_det = ?" 
        InsertCommand="INSERT INTO &quot;Orden_compra_det&quot; ( fkey_centrocostos, fkey_orden_compra, fkey_articulo, fkey_articulos_color, fkey_articulos_tallas, partida, fecha_entrega, cantidad, costo_unitario, unitario_descuento_porc, unitario_descuento, unitario_descuento_importe, unitario_costo_neto, unitario_importe_total, global_descuento_porc, global_descuento, global_descuento_importe, global_costo_neto, global_importe_total, notcred_descuento_porc, notcred_descuento, notcred_descuento_importe, notcred_costo_neto, notcred_importe_total, descuento_neto, descuento_importe, costo_neto, importe_total) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        UpdateCommand="UPDATE &quot;Orden_compra_det&quot; SET fkey_articulo = ?, fkey_articulos_color = ?, fkey_articulos_tallas = ?, partida = ?, fecha_entrega = ?, cantidad = ?, costo_unitario = ?, unitario_descuento_porc=?, unitario_descuento=?, unitario_descuento_importe=?, unitario_costo_neto=?, unitario_importe_total=?, global_descuento_porc=?, global_descuento=?, global_descuento_importe=?, global_costo_neto=?, global_importe_total=?, notcred_descuento_porc=?, notcred_descuento=?, notcred_descuento_importe=?, notcred_costo_neto=?, notcred_importe_total=?, descuento_neto=?, descuento_importe=?, costo_neto=?, importe_total=?  WHERE key_orden_compra_det = ?">
        <SelectParameters>
            <asp:SessionParameter Name="fkey_centrocostos" Type="Int64" SessionField="session_key_centrocostos"/>
            <asp:SessionParameter Name="fkey_orden_compra" Type="Int64" SessionField="session_key_orden_compra"/>                        
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="key_orden_compra_det" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="fkey_centrocostos" Type="Int64" SessionField="session_key_centrocostos"/>
            <asp:SessionParameter Name="fkey_orden_compra" Type="Int64" SessionField="session_key_orden_compra"/>
            <asp:Parameter Name="fkey_articulo" Type="Int64" />
            <asp:Parameter Name="fkey_articulos_color" Type="Int64" />
            <asp:Parameter Name="fkey_articulos_tallas" Type="Int64" />
            <asp:Parameter Name="partida" Type="Int32" />
            <asp:Parameter Name="fecha_entrega" Type="DateTime" />
            <asp:Parameter Name="cantidad" Type="Int32" />
            <asp:Parameter Name="costo_unitario" Type="Decimal" />
            <asp:Parameter Name="unitario_descuento_porc" Type="Decimal" />
            <asp:Parameter Name="unitario_descuento" Type="Decimal" />
            <asp:Parameter Name="unitario_descuento_importe" Type="Decimal" />
            <asp:Parameter Name="unitario_costo_neto" Type="Decimal" />
            <asp:Parameter Name="unitario_importe_total" Type="Decimal" />
            <asp:Parameter Name="global_descuento_porc" Type="Decimal" />
            <asp:Parameter Name="global_descuento" Type="Decimal" />
            <asp:Parameter Name="global_descuento_importe" Type="Decimal" />
            <asp:Parameter Name="global_costo_neto" Type="Decimal" />
            <asp:Parameter Name="global_importe_total" Type="Decimal" />
            <asp:Parameter Name="notcred_descuento_porc" Type="Decimal" />
            <asp:Parameter Name="notcred_descuento" Type="Decimal" />
            <asp:Parameter Name="notcred_descuento_importe" Type="Decimal" />
            <asp:Parameter Name="notcred_costo_neto" Type="Decimal" />
            <asp:Parameter Name="notcred_importe_total" Type="Decimal" />
            <asp:Parameter Name="descuento_neto" Type="Decimal" />
            <asp:Parameter Name="descuento_importe" Type="Decimal" />
            <asp:Parameter Name="costo_neto" Type="Decimal" />
            <asp:Parameter Name="importe_total" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="fkey_articulo" Type="Int64" />
            <asp:Parameter Name="fkey_articulos_color" Type="Int64" />
            <asp:Parameter Name="fkey_articulos_tallas" Type="Int64" />
            <asp:Parameter Name="partida" Type="Int32" />
            <asp:Parameter Name="fecha_entrega" Type="DateTime" />
            <asp:Parameter Name="cantidad" Type="Int32" />
            <asp:Parameter Name="costo_unitario" Type="Decimal" />
            <asp:Parameter Name="unitario_descuento_porc" Type="Decimal" />
            <asp:Parameter Name="unitario_descuento" Type="Decimal" />
            <asp:Parameter Name="unitario_descuento_importe" Type="Decimal" />
            <asp:Parameter Name="unitario_costo_neto" Type="Decimal" />
            <asp:Parameter Name="unitario_importe_total" Type="Decimal" />
            <asp:Parameter Name="global_descuento_porc" Type="Decimal" />
            <asp:Parameter Name="global_descuento" Type="Decimal" />
            <asp:Parameter Name="global_descuento_importe" Type="Decimal" />
            <asp:Parameter Name="global_costo_neto" Type="Decimal" />
            <asp:Parameter Name="global_importe_total" Type="Decimal" />
            <asp:Parameter Name="notcred_descuento_porc" Type="Decimal" />
            <asp:Parameter Name="notcred_descuento" Type="Decimal" />
            <asp:Parameter Name="notcred_descuento_importe" Type="Decimal" />
            <asp:Parameter Name="notcred_costo_neto" Type="Decimal" />
            <asp:Parameter Name="notcred_importe_total" Type="Decimal" />
            <asp:Parameter Name="descuento_neto" Type="Decimal" />
            <asp:Parameter Name="descuento_importe" Type="Decimal" />
            <asp:Parameter Name="costo_neto" Type="Decimal" />
            <asp:Parameter Name="importe_total" Type="Decimal" />
            <asp:Parameter Name="key_orden_compra_det" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_Tallas" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_tallas, right(tallas,2) as tallas, descrip, fkey_articulo, fkey_rango FROM &quot;Articulos_tallas&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_Colores" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_color, right(color,2) as color, descrip, fkey_articulo FROM &quot;Articulos_color&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_Articulos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_articulo, descripcion, codigo_articulo, modelo, (select departamento from &quot;Departamento&quot; where key_departamento = &quot;Articulos&quot;.fkey_departamento) as departamento, (select clasificacion from &quot;Clasificacion&quot; where key_clasificacion = &quot;Articulos&quot;.fkey_clasificacion) as clasificacion, (select familia from &quot;Familia&quot; where key_familia = &quot;Articulos&quot;.fkey_familia) as familia FROM &quot;Articulos&quot;"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SDS_Orden_compra" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
                    DeleteCommand="DELETE FROM &quot;Orden_compra&quot; WHERE key_orden_compra = ?" 
                    InsertCommand="INSERT INTO &quot;Orden_compra&quot; (key_centrocostos, fkey_compradores, oc, solicita, autoriza, fkey_proveedores, fecha, tipo, lugar_entrega,descuento_unitario, descuento_global, descuento_notcred ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_orden_compra, key_centrocostos, fkey_compradores, oc, solicita, autoriza, fecha_autoriza, fkey_proveedores, fecha, tipo, lugar_entrega, porcentaje_iva, sub_total, iva, total, recibido_sub_total, recibido_iva, recibido_total, ajuste_sub_total, ajuste_iva, ajuste_total, cancela_sub_total, cancela_iva, cancela_total, total_facturado, total_pagado, estatus_recibido, estatus_autoriza, estatus_impresa, descuento_unitario, descuento_global, descuento_notcred  FROM &quot;Orden_compra&quot;" 
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

                <asp:SqlDataSource ID="SDS_Usuarios" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_usuario, usuario, nombre FROM &quot;Usuarios&quot;"></asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_Tipo_orden_compra" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_orden_compra_tipo,tipo_oc,imagen FROM &quot;Orden_compra_tipo&quot;">
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_Entrega" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_orden_compra_entrega, entrega FROM &quot;Orden_compra_entrega&quot;"></asp:SqlDataSource>
</asp:Content>