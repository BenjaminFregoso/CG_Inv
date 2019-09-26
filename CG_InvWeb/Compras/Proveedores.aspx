<%@ Page Title="Proveedores" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="CG_InvWeb.Compras.Proveedores" %>

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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Proveedores" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Compras/Compradores.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Proveedores" EnableTheming="True" KeyFieldName="key_proveedores" Theme="MaterialCompact" KeyboardSupport="True" Width="100%" OnRowInserted="ASPxGridView1_RowInserted" OnBeforeGetCallbackResult="ASPxGridView1_BeforeGetCallbackResult">
                    <SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True" />
                    
                    <Templates>                        
                        <DetailRow>
                            <dx:ASPxPageControl BackColor="#CCCCCC" ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" EnableTabScrolling="True" Theme="MaterialCompact" Width="100%">
                                <TabPages>
                                    <dx:TabPage Name="Condiciones" Text="Condiciones">
                                        <ActiveTabImage IconID="spreadsheet_tableconverttorange_svg_16x16">
                                        </ActiveTabImage>
                                        <TabImage IconID="spreadsheet_multiplesheet_svg_16x16">
                                        </TabImage>
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                             <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Proveedores_condiciones" KeyFieldName="key_proveedores_condiciones" Theme="Glass" Width="100%" OnBeforePerformDataSelect="ASPxGridView3_BeforePerformDataSelect" KeyboardSupport="True" OnRowInserting="ASPxGridView3_RowInserting">                                                    
                                                    <SettingsPager Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Batch">
                                                    </SettingsEditing>
                                                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                                    <Settings ShowHeaderFilterButton="True" ShowHeaderFilterBlankItems="false" ShowGroupedColumns="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" VerticalScrollBarMode="Auto" VerticalScrollBarStyle="VirtualSmooth" VerticalScrollableHeight="240"  />

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
                                                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="50px">
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn FieldName="key_proveedores_condiciones" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="fkey_proveedores" ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataDateColumn Caption="Fecha" FieldName="fecha" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            <PropertiesDateEdit DisplayFormatString="dd/MMMM/yy">
                                                            </PropertiesDateEdit>
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataTextColumn Caption="Descuento Unitario" FieldName="descuento_unitario" ShowInCustomizationForm="True" VisibleIndex="4">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Descuento Global" FieldName="descuento_global" ShowInCustomizationForm="True" VisibleIndex="5">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Descuento Nota de Crédito" FieldName="descuento_notcred" ShowInCustomizationForm="True" VisibleIndex="6">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Días De Crédito" FieldName="dias_credito" ShowInCustomizationForm="True" VisibleIndex="7">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataMemoColumn Caption="Observaciones" FieldName="observaciones" ShowInCustomizationForm="True" VisibleIndex="8">
                                                        </dx:GridViewDataMemoColumn>
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

                                    <dx:TabPage Name="Representante" Text="Representante de marca">
                                        <ActiveTabImage IconID="spreadsheet_tableconverttorange_svg_16x16">
                                        </ActiveTabImage>
                                        <TabImage IconID="spreadsheet_multiplesheet_svg_16x16">
                                        </TabImage>
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                             <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Proveedores_representantes" KeyFieldName="key_proveedores_representantes" Theme="Glass" Width="100%" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect" KeyboardSupport="True" OnRowInserting="ASPxGridView2_RowInserting">

                                                    <SettingsPager Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Batch">
                                                    </SettingsEditing>
                                                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                                    <Settings ShowHeaderFilterButton="True" ShowHeaderFilterBlankItems="false" ShowGroupedColumns="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" VerticalScrollBarMode="Auto" VerticalScrollBarStyle="VirtualSmooth" VerticalScrollableHeight="240"  />

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
                                                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="50px">
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn FieldName="key_proveedores_representantes" ReadOnly="True" VisibleIndex="1" Visible="False">
                                                            <PropertiesTextEdit DisplayFormatString="dd/mmm/aa">
                                                            </PropertiesTextEdit>
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="fkey_proveedores" VisibleIndex="2" ReadOnly="True" Visible="False">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="telefono" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Teléfono de oficina">
                                                            <PropertiesTextEdit>
                                                                <ReadOnlyStyle BackColor="#C0E0E7" Border-BorderStyle="None">
                                                                </ReadOnlyStyle>
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="extension" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Número de extensión">
                                                            <PropertiesTextEdit>
                                                                <ReadOnlyStyle BackColor="#C0E0E7" Border-BorderStyle="None">
                                                                </ReadOnlyStyle>
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="celular" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Celular">
                                                            <PropertiesTextEdit>
                                                                <ReadOnlyStyle BackColor="#C0E0E7" Border-BorderStyle="None">
                                                                </ReadOnlyStyle>
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="telefono_adicional" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Teléfono adicional">
                                                            <PropertiesTextEdit>
                                                                <ReadOnlyStyle BackColor="#C0E0E7" Border-BorderStyle="None">
                                                                </ReadOnlyStyle>
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="calle" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Calle">
                                                            <PropertiesTextEdit>
                                                                <ReadOnlyStyle BackColor="#C0E0E7" Border-BorderStyle="None">
                                                                </ReadOnlyStyle>
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="num_exterior" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Número exterior">
                                                            <PropertiesTextEdit>
                                                                <ReadOnlyStyle BackColor="#C0E0E7" Border-BorderStyle="None">
                                                                </ReadOnlyStyle>
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="num_interior" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="13" Caption="Número interior">
                                                            <PropertiesTextEdit>
                                                                <ReadOnlyStyle BackColor="#C0E0E7" Border-BorderStyle="None">
                                                                </ReadOnlyStyle>
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="colonia" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Colonia">
                                                            <PropertiesTextEdit>
                                                                <ReadOnlyStyle BackColor="#C0E0E7" Border-BorderStyle="None">
                                                                </ReadOnlyStyle>
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="cp" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="14" Caption="Código postal">
                                                            <PropertiesTextEdit>
                                                                <ReadOnlyStyle BackColor="#C0E0E7" Border-BorderStyle="None">
                                                                </ReadOnlyStyle>
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="observaciones" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="15" Caption="Observaciones">
                                                            <PropertiesTextEdit>
                                                                <ReadOnlyStyle BackColor="#C0E0E7" Border-BorderStyle="None">
                                                                </ReadOnlyStyle>
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="Ciudad" FieldName="ciudad" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9">
                                                            <PropertiesComboBox DataSourceID="SDS_Ciudades" TextField="descrip" ValueField="key_ciudad">
                                                                <ReadOnlyStyle BackColor="#C0E0E7" Border-BorderStyle="None">
                                                                </ReadOnlyStyle>
                                                            </PropertiesComboBox>
                                                        </dx:GridViewDataComboBoxColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="Representante" FieldName="fkey_representantes" ShowInCustomizationForm="True" VisibleIndex="4">                                                            
                                                            <PropertiesComboBox DataSourceID="SDS_representantes" TextField="representante" ValueField="key_representantes" >
                                                            </PropertiesComboBox>
                                                        </dx:GridViewDataComboBoxColumn>
                                                        <dx:GridViewDataDateColumn Caption="Fecha" FieldName="fecha" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            <PropertiesDateEdit DisplayFormatString="dd/MMMM/yy">
                                                                <ReadOnlyStyle BackColor="#C0E0E7">
                                                                </ReadOnlyStyle>
                                                            </PropertiesDateEdit>
                                                        </dx:GridViewDataDateColumn>
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

                                    <dx:TabPage Name="TM" Text="Relación con Tipos de Movimiento">
                                        <ActiveTabImage IconID="spreadsheet_tableconverttorange_svg_16x16">
                                        </ActiveTabImage>
                                        <TabImage IconID="spreadsheet_multiplesheet_svg_16x16">
                                        </TabImage>
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                             <dx:ASPxGridView ID="ASPxGridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Proveedores_TM" KeyFieldName="key_proveedores_tm" Theme="Glass" Width="100%" OnBeforePerformDataSelect="ASPxGridView4_BeforePerformDataSelect" KeyboardSupport="True" OnRowInserting="ASPxGridView4_RowInserting">                                                    
                                                    <SettingsPager Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Batch">
                                                    </SettingsEditing>
                                                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                                    <Settings ShowHeaderFilterButton="True" ShowHeaderFilterBlankItems="false" ShowGroupedColumns="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" VerticalScrollBarMode="Auto" VerticalScrollBarStyle="VirtualSmooth" VerticalScrollableHeight="240"  />

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
                                                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="50px">
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn FieldName="key_proveedores_tm" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="fkey_proveedores" ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="Tipo de Movimiento" FieldName="fkey_tm_proveedores" ShowInCustomizationForm="True" VisibleIndex="17">
                                                            <PropertiesComboBox DataSourceID="SDS_TM_Proveedores" NullText="" TextField="tm_proveedores" ValueField="key_tm_proveedores">
                                                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16"></ErrorImage>
                                                                    <RequiredField ErrorText="Tipo de movimiento es requerido" IsRequired="True" />                                    
                                                                </ValidationSettings>                                                                
                                                            </PropertiesComboBox>
                                                        </dx:GridViewDataComboBoxColumn>
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

                                       
                    <EditFormLayoutProperties ShowItemCaptionColon="false">
                        <Items>                            
                            <dx:GridViewTabbedLayoutGroup Width="100%" ColSpan="1" TabAlign="Justify">
                                <Items>
                                    <dx:GridViewLayoutGroup Caption="Datos Generales" ColSpan="2" ColCount="2" ColumnCount="2">
                                        <Items>
                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="proveedor" ColumnSpan="2">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="nombre_comercial">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="rfc">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="correo_oc" ColumnSpan="2">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="fkey_tm_proveedores">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="observaciones" ColumnSpan="2">
                                            </dx:GridViewColumnLayoutItem>
                                        </Items>
                                    </dx:GridViewLayoutGroup>
                                    <dx:GridViewLayoutGroup Caption="Teléfonos y Domicilio" ColCount="2" ColSpan="2" ColumnCount="2">
                                        <Items>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="telefono">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="extension">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="celular">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="telefono_adicional">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="calle" ColumnSpan="2">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="num_exterior">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="num_interior">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="colonia" ColumnSpan="2">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="ciudad">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="cp">
                                            </dx:GridViewColumnLayoutItem>
                                        </Items>
                                    </dx:GridViewLayoutGroup>
                                    <dx:GridViewLayoutGroup Caption="Bancarios" ColCount="2" ColSpan="2" ColumnCount="2">
                                        <Items>
                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="banco">                                                 
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="cuenta">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="clabe">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="correo_pagos">
                                            </dx:GridViewColumnLayoutItem>
                                        </Items>
                                    </dx:GridViewLayoutGroup>
                                </Items>
                            </dx:GridViewTabbedLayoutGroup>
                            <dx:EditModeCommandLayoutItem ColSpan="1" HorizontalAlign="Right" Width="100%">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                        <SettingsItemCaptions Location="Top" />                        
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="key_proveedores" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Código" ReadOnly="True" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataMemoColumn Caption="Proveedor" FieldName="proveedor" ShowInCustomizationForm="True" VisibleIndex="1">
                            <PropertiesMemoEdit NullText="Razón social y/o Nombre del Proveedor" Rows="2">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RequiredField ErrorText="Proveedor es requerido" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesMemoEdit>
                        </dx:GridViewDataMemoColumn>

                        <dx:GridViewDataTextColumn FieldName="nombre_comercial" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Nombre Comercial">
                            <PropertiesTextEdit MaxLength="100" NullText="Marca y/o nombre corto">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RequiredField ErrorText="Nombre comercial es requerido" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn FieldName="rfc" ShowInCustomizationForm="True" VisibleIndex="3" Caption="R.F.C.">
                            <PropertiesTextEdit MaxLength="13">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorText="RFC es requerido" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RegularExpression ErrorText="RFC no válido" ValidationExpression="^(([ÑA-Z|ña-z|&amp;]{3}|[A-Z|a-z]{4})\d{2}((0[1-9]|1[012])(0[1-9]|1\d|2[0-8])|(0[13456789]|1[012])(29|30)|(0[13578]|1[02])31)(\w{2})([A|a|0-9]{1}))$|^(([ÑA-Z|ña-z|&amp;]{3}|[A-Z|a-z]{4})([02468][048]|[13579][26])0229)(\w{2})([A|a|0-9]{1})$" />
                                    <RequiredField ErrorText="RFC es requerido" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn FieldName="correo_oc" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Correo para envío de órdenes de compra">
                            <PropertiesTextEdit MaxLength="200" NullText="Ej.: pedidos@proveedor.com.mx">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RequiredField IsRequired="False" />
                                    <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorText="Correo no válido" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataMemoColumn Caption="Observaciones" FieldName="observaciones" ShowInCustomizationForm="True" VisibleIndex="5">
                            <PropertiesMemoEdit NullText="Comentarios del proveedor..." MaxLength="200" Rows="4">
                                <ValidationSettings SetFocusOnError="True">
                                </ValidationSettings>
                            </PropertiesMemoEdit>
                        </dx:GridViewDataMemoColumn>

                        <dx:GridViewDataTextColumn FieldName="telefono" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Teléfono">
                            <PropertiesTextEdit MaxLength="10" DisplayFormatInEditMode="True" DisplayFormatString="00-0000-0000">                                
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
<%--                                <MaskSettings Mask="0000000000" PromptChar=" " ErrorText="Número no válido" />--%>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RegularExpression ErrorText="Número no válido (10 dígitos)" ValidationExpression="\d\d\d\d\d\d\d\d\d\d" />
                                    <RequiredField ErrorText="Número es requerido" IsRequired="False" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                       <dx:GridViewDataTextColumn FieldName="extension" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Número de Extensión">
                            <PropertiesTextEdit MaxLength="5">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <MaskSettings Mask="99999" PromptChar=" " ErrorText="Extensión no válida" />
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RegularExpression ErrorText="dígitos no válidos" ValidationExpression="\d{0,5}" />                                    
                                    <RequiredField ErrorText="Extensión es requerida" IsRequired="False" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                       <dx:GridViewDataTextColumn FieldName="celular" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Celular">
                            <PropertiesTextEdit MaxLength="10" DisplayFormatInEditMode="True" DisplayFormatString="00-0000-0000">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
<%--                                <MaskSettings Mask="0000000000" PromptChar=" " ErrorText="Número no válido" />--%>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RegularExpression ErrorText="Número no válido (10 dígitos)" ValidationExpression="\d\d\d\d\d\d\d\d\d\d" />
                                    <RequiredField ErrorText="Número es requerido" IsRequired="False" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                       <dx:GridViewDataTextColumn FieldName="telefono_adicional" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Teléfono adicional">
                            <PropertiesTextEdit MaxLength="10" DisplayFormatInEditMode="True" DisplayFormatString="00-0000-0000">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
<%--                                <MaskSettings Mask="0000000000" PromptChar=" " ErrorText="Número no válido" />--%>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RegularExpression ErrorText="Número no válido (10 dígitos)" ValidationExpression="\d\d\d\d\d\d\d\d\d\d" />
                                    <RequiredField ErrorText="Número es requerido" IsRequired="False" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                       <dx:GridViewDataTextColumn FieldName="calle" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Calle">
                            <PropertiesTextEdit NullText="">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="False" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                       <dx:GridViewDataTextColumn FieldName="num_exterior" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Núm. Exterior">
                            <PropertiesTextEdit NullText="">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="False" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                       <dx:GridViewDataTextColumn FieldName="num_interior" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Núm. Interior">
                            <PropertiesTextEdit NullText="">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="False" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                       <dx:GridViewDataTextColumn FieldName="colonia" ShowInCustomizationForm="True" VisibleIndex="13" Caption="Colonia">
                            <PropertiesTextEdit NullText="">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="False" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                       <dx:GridViewDataTextColumn FieldName="cp" ShowInCustomizationForm="True" VisibleIndex="14" Caption="C.P.">
                            <PropertiesTextEdit MaxLength="5" SelectInputTextOnClick="True">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <RequiredField IsRequired="False" />
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16"></ErrorImage>
                                    <RegularExpression ErrorText="C.P. no válido (5 dígitos)" ValidationExpression="\d\d\d\d\d" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataComboBoxColumn Caption="Ciudad" FieldName="ciudad" ShowInCustomizationForm="True" VisibleIndex="15">
                            <PropertiesComboBox DataSourceID="SDS_Ciudades" NullText="Ciudad" TextField="descrip" ValueField="key_ciudad">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <RegularExpression ValidationExpression="\d+" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataComboBoxColumn Caption="Banco" FieldName="banco" ShowInCustomizationForm="True" VisibleIndex="16">
                            <PropertiesComboBox DataSourceID="SDS_Bancos" NullText="" TextField="descrip" ValueField="key_banco">
                                <ValidationSettings SetFocusOnError="True">
                                </ValidationSettings>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>


                        <dx:GridViewDataTextColumn FieldName="cuenta" ShowInCustomizationForm="True" VisibleIndex="18" Caption="Cuenta">
                            <PropertiesTextEdit MaxLength="11" DisplayFormatInEditMode="True" >
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <%--<MaskSettings Mask="99-9999-9999" PromptChar=" " ErrorText="Número no válido" />--%>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RegularExpression ErrorText="Cuenta no válida (11 dígitos)" ValidationExpression="\d\d\d\d\d\d\d\d\d\d\d" />
                                    <RequiredField ErrorText="Cuenta  es requerida" IsRequired="False" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn FieldName="clabe" ShowInCustomizationForm="True" VisibleIndex="19" Caption="Cuenta Clabe">
                            <PropertiesTextEdit MaxLength="18" DisplayFormatInEditMode="True" >
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <%--<MaskSettings Mask="99-9999-9999" PromptChar=" " ErrorText="Número no válido" />--%>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RegularExpression ErrorText="Cuenta no válida (18 dígitos)" ValidationExpression="\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d\d" />
                                    <RequiredField ErrorText="Cuenta  es requerida" IsRequired="False" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn FieldName="correo_pagos" ShowInCustomizationForm="True" VisibleIndex="20" Caption="Correo electrónico para notificar pagos">
                            <PropertiesTextEdit MaxLength="200" NullText="Ej.: pedidos@proveedor.com.mx">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RequiredField IsRequired="False" />
                                    <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorText="Correo no válido" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        
                        <dx:GridViewDataComboBoxColumn Caption="Tipo de movimiento predeterminado" FieldName="fkey_tm_proveedores" ShowInCustomizationForm="True" VisibleIndex="17">
                            <PropertiesComboBox DataSourceID="SDS_TM_Proveedores" NullText="" TextField="tm_proveedores" ValueField="key_tm_proveedores">
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16"></ErrorImage>
                                    <RequiredField ErrorText="Tipo de movimiento es requerido" IsRequired="True" />                                    
                                </ValidationSettings>                                                                
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


                <asp:SqlDataSource ID="SDS_Proveedores" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
                    DeleteCommand="DELETE FROM &quot;Proveedores&quot; WHERE key_proveedores = ?" 
                    InsertCommand="INSERT INTO &quot;Proveedores&quot; (proveedor, rfc, nombre_comercial, telefono, extension, celular, telefono_adicional, calle, num_exterior, num_interior, colonia, ciudad, cp, observaciones, banco, cuenta, clabe, correo_oc, correo_pagos, fkey_tm_proveedores) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_proveedores, proveedor, rfc, nombre_comercial, telefono, extension, celular, telefono_adicional, calle, num_exterior, num_interior, colonia, ciudad, cp, observaciones, banco, cuenta, clabe, correo_oc, correo_pagos, fkey_tm_proveedores FROM &quot;Proveedores&quot; ORDER BY key_proveedores DESC" 
                    UpdateCommand="UPDATE &quot;Proveedores&quot; SET proveedor=?, rfc=?, nombre_comercial=?, telefono=?, extension=?, celular=?, telefono_adicional=?, calle=?, num_exterior=?, num_interior=?, colonia=?, ciudad=?, cp=?, observaciones=?, banco=?, cuenta=?, clabe=?, correo_oc=?, correo_pagos=?, fkey_tm_proveedores=? WHERE key_proveedores = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_proveedores" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>                        
                        <asp:Parameter Name="proveedor" Type="String" />
                        <asp:Parameter Name="rfc" Type="String" />
                        <asp:Parameter Name="nombre_comercial" Type="String" />
                        <asp:Parameter Name="telefono" Type="String" />
                        <asp:Parameter Name="extension" Type="String" />
                        <asp:Parameter Name="celular" Type="String" />
                        <asp:Parameter Name="telefono_adicional" Type="String" />
                        <asp:Parameter Name="calle" Type="String" />
                        <asp:Parameter Name="num_exterior" Type="String" />
                        <asp:Parameter Name="num_interior" Type="String" />
                        <asp:Parameter Name="colonia" Type="String" />
                        <asp:Parameter Name="ciudad" Type="Int64" />
                        <asp:Parameter Name="cp" Type="String" />
                        <asp:Parameter Name="observaciones" Type="String" />
                        <asp:Parameter Name="banco" Type="Int64" />
                        <asp:Parameter Name="cuenta" Type="String" />
                        <asp:Parameter Name="clabe" Type="String" />
                        <asp:Parameter Name="correo_oc" Type="String" />
                        <asp:Parameter Name="correo_pagos" Type="String" />
                        <asp:Parameter Name="fkey_tm_proveedores" Type="Int64" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="proveedor" Type="String" />
                        <asp:Parameter Name="rfc" Type="String" />
                        <asp:Parameter Name="nombre_comercial" Type="String" />
                        <asp:Parameter Name="telefono" Type="String" />
                        <asp:Parameter Name="extension" Type="String" />
                        <asp:Parameter Name="celular" Type="String" />
                        <asp:Parameter Name="telefono_adicional" Type="String" />
                        <asp:Parameter Name="calle" Type="String" />
                        <asp:Parameter Name="num_exterior" Type="String" />
                        <asp:Parameter Name="num_interior" Type="String" />
                        <asp:Parameter Name="colonia" Type="String" />
                        <asp:Parameter Name="ciudad" Type="Int64" />
                        <asp:Parameter Name="cp" Type="String" />
                        <asp:Parameter Name="observaciones" Type="String" />
                        <asp:Parameter Name="banco" Type="Int64" />
                        <asp:Parameter Name="cuenta" Type="String" />
                        <asp:Parameter Name="clabe" Type="String" />
                        <asp:Parameter Name="correo_oc" Type="String" />
                        <asp:Parameter Name="correo_pagos" Type="String" />
                        <asp:Parameter Name="fkey_tm_proveedores" Type="Int64" />
                        <asp:Parameter Name="key_proveedores" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_Proveedores_representantes" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
                    DeleteCommand="DELETE FROM &quot;Proveedores_representantes&quot; WHERE key_proveedores_representantes = ?" 
                    InsertCommand="INSERT INTO &quot;Proveedores_representantes&quot; (fkey_proveedores, fkey_representantes) VALUES (?,?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_proveedores_representantes, fkey_proveedores, fkey_representantes,&quot;Representantes&quot;.representante, 
                        &quot;Representantes&quot;.telefono,&quot;Representantes&quot;.extension,&quot;Representantes&quot;.celular,
                        &quot;Representantes&quot;.telefono_adicional, &quot;Representantes&quot;.calle,&quot;Representantes&quot;.num_exterior,
                        &quot;Representantes&quot;.num_interior,&quot;Representantes&quot;.colonia,&quot;Representantes&quot;.ciudad,
                        &quot;Representantes&quot;.cp,&quot;Representantes&quot;.observaciones, &quot;Proveedores_representantes&quot;.fecha
                    FROM &quot;Proveedores_representantes&quot;, &quot;Representantes&quot;
                    WHERE &quot;Proveedores_representantes&quot;.fkey_representantes = &quot;Representantes&quot;.key_representantes and fkey_proveedores = ?  
                    ORDER BY key_proveedores_representantes DESC"
                    UpdateCommand="UPDATE &quot;Proveedores_representantes&quot; SET fkey_proveedores=?, fkey_representantes=? WHERE key_proveedores_representantes = ?">
                    <SelectParameters>
                        <asp:SessionParameter Name="?" SessionField="session_key_proveedores"/>
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="key_proveedores_representantes" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>                           
                        <asp:Parameter Name="fkey_proveedores" Type="Int64" />
                        <asp:Parameter Name="fkey_representantes" Type="Int64" />                        
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="fkey_proveedores" Type="Int64" />
                        <asp:Parameter Name="fkey_representantes" Type="Int64" />
                        <asp:Parameter Name="key_proveedores_representantes" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>                

                <asp:SqlDataSource ID="SDS_representantes" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
                    SelectCommand="SELECT key_representantes, representante FROM &quot;Representantes&quot; ORDER BY representante" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" >
                </asp:SqlDataSource>                

                <asp:SqlDataSource ID="SDS_Proveedores_condiciones" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
                    DeleteCommand="DELETE FROM &quot;Proveedores_condiciones&quot; WHERE key_proveedores_condiciones = ?" 
                    InsertCommand="INSERT INTO &quot;Proveedores_condiciones&quot; (fkey_proveedores, fecha, descuento_unitario, descuento_global, descuento_notcred, observaciones, dias_credito ) VALUES (?,?,?,?,?,?,?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_proveedores_condiciones, fkey_proveedores, fecha, descuento_unitario, descuento_global, descuento_notcred, observaciones, dias_credito FROM &quot;Proveedores_condiciones&quot; WHERE fkey_proveedores = ?  ORDER BY key_proveedores_condiciones DESC" 
                    UpdateCommand="UPDATE &quot;Proveedores_condiciones&quot; SET fkey_proveedores=?, fecha=?, descuento_unitario=?, descuento_global=?, descuento_notcred=?, observaciones=?, dias_credito=? WHERE key_proveedores_condiciones = ?">
                    <SelectParameters>
                        <asp:SessionParameter Name="?" SessionField="session_key_proveedores"/>
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="key_proveedores_condiciones" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>                           
                        <asp:Parameter Name="fkey_proveedores" Type="Int64" />
                        <asp:Parameter Name="fecha" Type="DateTime" />
                        <asp:Parameter Name="descuento_unitario" Type="Decimal" />
                        <asp:Parameter Name="descuento_global" Type="Decimal" />
                        <asp:Parameter Name="descuento_notcred" Type="Decimal" />
                        <asp:Parameter Name="observaciones" Type="String" />
                        <asp:Parameter Name="dias_credito" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="fkey_proveedores" Type="Int64" />
                        <asp:Parameter Name="fecha" Type="DateTime" />
                        <asp:Parameter Name="descuento_unitario" Type="Decimal" />
                        <asp:Parameter Name="descuento_global" Type="Decimal" />
                        <asp:Parameter Name="descuento_notcred" Type="Decimal" />
                        <asp:Parameter Name="observaciones" Type="String" />
                        <asp:Parameter Name="dias_credito" Type="Int32" />
                        <asp:Parameter Name="key_proveedores_condiciones" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>     
                
                <asp:SqlDataSource ID="SDS_Ciudades" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_ciudad, descrip, estado, pais FROM &quot;c_Ciudades&quot; ORDER BY descrip"></asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_Bancos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_banco, banco, descrip FROM &quot;c_Bancos&quot; ORDER BY descrip"></asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_TM_Proveedores" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_tm_proveedores, tm_proveedores, tm_proveedores_numero FROM &quot;TM_Proveedores&quot; ORDER BY tm_proveedores"></asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_Proveedores_TM" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_proveedores_tm, fkey_proveedores, fkey_tm_proveedores FROM &quot;Proveedores_TM&quot; ORDER BY key_proveedores_tm DESC" 
                    DeleteCommand="DELETE FROM &quot;Proveedores_TM&quot; WHERE key_proveedores_tm = ? " 
                    InsertCommand="INSERT INTO &quot;Proveedores_TM&quot; ( fkey_proveedores, fkey_tm_proveedores) VALUES ( ?, ?)" 
                    UpdateCommand="UPDATE public.&quot;Proveedores_TM&quot; SET fkey_proveedores=?, fkey_tm_proveedores=? WHERE key_proveedores_tm=?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_proveedores_tm" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>                        
                        <asp:Parameter Name="fkey_proveedores" Type="Int64" />
                        <asp:Parameter Name="fkey_tm_proveedores" Type="Int64" />
                        <asp:Parameter Name="key_proveedores_tm" Type="Int64" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="fkey_proveedores" Type="Int64" />
                        <asp:Parameter Name="fkey_tm_proveedores" Type="Int64" />
                        <asp:Parameter Name="key_proveedores_tm" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>


            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
</asp:Content>

