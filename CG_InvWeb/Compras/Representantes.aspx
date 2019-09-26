<%@ Page Title="Representantes" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Representantes.aspx.cs" Inherits="CG_InvWeb.Compras.Representantes" %>

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
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Representantes" EnableTheming="True" KeyFieldName="key_representantes" Theme="MaterialCompact" KeyboardSupport="True" Width="100%" OnRowInserted="ASPxGridView1_RowInserted" OnBeforeGetCallbackResult="ASPxGridView1_BeforeGetCallbackResult">                    

                    <EditFormLayoutProperties ColCount="1">
                        <Items>                            
                            <dx:GridViewTabbedLayoutGroup Width="100%" ColSpan="1" TabAlign="Justify">
                                <Items>
                                    <dx:GridViewLayoutGroup Caption="Datos Generales" ColSpan="2" ColCount="2" ColumnCount="2">
                                        <Items>
                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="representante" ColumnSpan="2">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="correo" ColumnSpan="2">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="telefono">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="extension">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="celular">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="telefono_adicional">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="observaciones" ColumnSpan="2">
                                            </dx:GridViewColumnLayoutItem>
                                        </Items>
                                    </dx:GridViewLayoutGroup>
                                    <dx:GridViewLayoutGroup Caption="Domicilio" ColSpan="2" ColCount="2" ColumnCount="2">
                                        <Items>
                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="calle" ColumnSpan="2">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="num_exterior">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="num_interior">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="colonia" ColumnSpan="2">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="cp">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="ciudad">
                                            </dx:GridViewColumnLayoutItem>
                                        </Items>
                                    </dx:GridViewLayoutGroup>
                                </Items>
                            </dx:GridViewTabbedLayoutGroup>
                        <dx:EditModeCommandLayoutItem ColSpan="1" HorizontalAlign="Right" ColumnSpan="1">
                        </dx:EditModeCommandLayoutItem>
                        </Items>
                        <SettingsItemCaptions AllowWrapCaption="True" Location="Top" />
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="key_representantes" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Código" ReadOnly="True" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataMemoColumn Caption="Representante de marca" FieldName="representante" ShowInCustomizationForm="True" VisibleIndex="1">
                            <PropertiesMemoEdit NullText="Nombre del representante" Rows="2">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_16x16">
                                    </ErrorImage>
                                    <RequiredField ErrorText="Representante es requerido" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesMemoEdit>
                        </dx:GridViewDataMemoColumn>

                        <dx:GridViewDataTextColumn FieldName="telefono" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Teléfono">
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

                       <dx:GridViewDataTextColumn FieldName="extension" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Núm. de Extensión">
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

                       <dx:GridViewDataTextColumn FieldName="celular" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Celular">
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

                       <dx:GridViewDataTextColumn FieldName="telefono_adicional" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Teléfono adicional">
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

                       <dx:GridViewDataTextColumn FieldName="calle" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Calle">
                            <PropertiesTextEdit NullText="" MaxLength="100">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="False" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                       <dx:GridViewDataTextColumn FieldName="num_exterior" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Núm. Exterior">
                            <PropertiesTextEdit NullText="" MaxLength="50">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="False" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                       <dx:GridViewDataTextColumn FieldName="num_interior" ShowInCustomizationForm="True" VisibleIndex="13" Caption="Núm. Interior">
                            <PropertiesTextEdit NullText="" MaxLength="50">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="False" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                       <dx:GridViewDataTextColumn FieldName="colonia" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Colonia">
                            <PropertiesTextEdit NullText="" MaxLength="100">
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

                        <dx:GridViewDataComboBoxColumn Caption="Ciudad" FieldName="ciudad" ShowInCustomizationForm="True" VisibleIndex="9">
                            <PropertiesComboBox DataSourceID="SDS_Ciudades" NullText="Ciudad" TextField="descrip" ValueField="key_ciudad">
                                <InvalidStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="1px">
                                </InvalidStyle>
                                <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                    <RegularExpression ValidationExpression="\d+" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataTextColumn FieldName="correo" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Correo para envío de órdenes de compra">
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

                        <dx:GridViewDataMemoColumn Caption="Observaciones" FieldName="observaciones" ShowInCustomizationForm="True" VisibleIndex="15" CellRowSpan="4">
                            <PropertiesMemoEdit NullText="Comentarios del proveedor..." MaxLength="200" Rows="4">
                                <ValidationSettings SetFocusOnError="True">
                                </ValidationSettings>
                            </PropertiesMemoEdit>
                        </dx:GridViewDataMemoColumn>

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
                <asp:SqlDataSource ID="SDS_Representantes" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
                    DeleteCommand="DELETE FROM &quot;Representantes&quot; WHERE key_representantes = ?" 
                    InsertCommand="INSERT INTO &quot;Representantes&quot; (representante, telefono, extension, celular, telefono_adicional, calle, num_exterior, num_interior, colonia, ciudad, cp, observaciones, correo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_representantes, representante, telefono, extension, celular, telefono_adicional, calle, num_exterior, num_interior, colonia, ciudad, cp, observaciones, correo FROM &quot;Representantes&quot; ORDER BY key_representantes DESC" 
                    UpdateCommand="UPDATE &quot;Representantes&quot; SET representante=?, telefono=?, extension=?, celular=?, telefono_adicional=?, calle=?, num_exterior=?, num_interior=?, colonia=?, ciudad=?, cp=?, observaciones=?, correo=? WHERE key_representantes = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_representantes" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="representante" Type="String" />
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
                        <asp:Parameter Name="correo" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="representante" Type="String" />
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
                        <asp:Parameter Name="correo" Type="String" />
                        <asp:Parameter Name="key_representantes" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                                
                <asp:SqlDataSource ID="SDS_Ciudades" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_ciudad, descrip, estado, pais FROM &quot;c_Ciudades&quot; ORDER BY descrip"></asp:SqlDataSource>
                
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
</asp:Content>

