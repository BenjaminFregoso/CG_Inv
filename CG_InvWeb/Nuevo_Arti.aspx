<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Nuevo_Arti.aspx.cs" Inherits="CG_InvWeb.Nuevo_Arti" %>


<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        Principal{
        width:80%;
        margin-top:20px;
        padding-left:20px;
        padding-top:20px;
    }
        </style>    
<div class="Principal">
    <dx:ASPxRoundPanel ID="ASPxRoundPanelPrincipal" HorizontalAlign="Left" runat="server" HeaderText="Catálogo de artículos" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" Height="100%" AllowCollapsingByHeaderClick="True" HeaderNavigateUrl="~/Nuevo_Arti.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                
                <dx:ASPxGridView ID="ASPxGridView1" ClientInstanceName="ASPxGridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style3" DataSourceID="SDS_Articulos" EnableTheming="True" KeyFieldName="key_articulo" OnFocusedRowChanged="ASPxGridView1_FocusedRowChanged" Theme="MaterialCompact" SettingsBehavior-ColumnResizeMode="Control" PreviewFieldName="descripcion_larga" OnInitNewRow="ASPxGridView1_InitNewRow">
                    <ClientSideEvents  RowDblClick="function(s, e) {	s.StartEditRow(e.visibleIndex);}" />
                    <SettingsAdaptivity AdaptivityMode="HideDataCells" HideDataCellsAtWindowInnerWidth="400" AllowOnlyOneAdaptiveDetailExpanded="True">
                        <AdaptiveDetailLayoutProperties>
                            <Items>
                                <dx:GridViewColumnLayoutItem ColumnName="codigo_articulo">
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem ColumnName="descripcion">
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem ColumnName="fkey_marca">
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem ColumnName="modelo">
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem ColumnName="descripcion_larga">
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem ColumnName="otra_informacion">
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem ColumnName="cuidado_limpieza">
                                </dx:GridViewColumnLayoutItem>
                            </Items>
                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="400" />
                        </AdaptiveDetailLayoutProperties>
                    </SettingsAdaptivity>
                    <SettingsEditing mode="PopupEditForm" UseFormLayout="true">
                    </SettingsEditing>
                    <Settings ShowHeaderFilterButton="True" ShowGroupedColumns="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" />
                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" ProcessFocusedRowChangedOnServer="True" AllowSelectByRowClick="True" AllowEllipsisInText="True" ProcessColumnMoveOnClient="True" />
                    <SettingsCommandButton>
                        <NewButton Text="Nuevo" RenderMode="Default">
                            <Image IconID ="actions_add_16x16gray">
                            </Image>
                        </NewButton>
                        <UpdateButton Text="Guardar" RenderMode="Default">
                            <Image IconID="actions_refresh_16x16gray" >
                            </Image>
                        </UpdateButton>
                        <CancelButton Text="Cerrar" RenderMode="Default">
                            <Image IconID="history_undo_16x16gray">
                            </Image>
                        </CancelButton>
                        <EditButton Text="Editar" RenderMode="Default">
                            <Image AlternateText="Edit" IconID="edit_edit_16x16gray">
                            </Image>
                        </EditButton>
                        <DeleteButton Text="Borrar" RenderMode="Default">
                            <Image IconID ="edit_delete_16x16gray">
                            </Image>
                        </DeleteButton>
                    </SettingsCommandButton>
                    <SettingsPopup>
                        <EditForm PopupAnimationType="Fade" HorizontalAlign="WindowCenter" ShowCollapseButton="True" ShowMaximizeButton="True" ShowPinButton="True" ShowShadow="True" AllowResize="True" CloseOnEscape="True" MinWidth="400px" Modal="True" VerticalAlign="WindowCenter" />
                    </SettingsPopup>
                    <SettingsExport EnableClientSideExportAPI="True" ExcelExportMode="DataAware" FileName="Articulos">
                    </SettingsExport>
                    <EditFormLayoutProperties ColCount="2">
                        <Items>
                            <dx:GridViewLayoutGroup Caption="Código y fecha" ColCount="2" ColSpan="2">
                                <Items>
                                    <dx:GridViewColumnLayoutItem ColumnName="codigo_articulo" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="fecha_alta" RequiredMarkDisplayMode="Hidden" ShowCaption="False" Caption="Fecha de alta">
                                    </dx:GridViewColumnLayoutItem>
                                </Items>
                            </dx:GridViewLayoutGroup>
                            <dx:GridViewLayoutGroup Caption="Datos Generales" ColCount="2" ColSpan="2" Name="DatosGralesArticulos">
                                <Items>
                                    <dx:GridViewColumnLayoutItem Caption="Departamento" ColumnName="fkey_departamento" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem Caption="Clasificación" ColumnName="fkey_clasificacion" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem Caption="Familia" ColumnName="fkey_familia" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="fkey_marca" RequiredMarkDisplayMode="Hidden" ShowCaption="False" Caption="Marca">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="descripcion" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="Modelo" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="Otra información" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="Cuidados y limpieza" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="descripcion_larga" RequiredMarkDisplayMode="Hidden" RowSpan="2" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                </Items>
                            </dx:GridViewLayoutGroup>
                            <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right" Width="100%">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn Visible="false" ButtonRenderMode="Default" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" ShowClearFilterButton="True">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn Caption="key_articulo" FieldName="key_articulo" Name="key_articulo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Descripción" FieldName="descripcion" Name="descripcion" ShowInCustomizationForm="True" VisibleIndex="6" AdaptivePriority="1" PropertiesTextEdit-NullText="Descripción..." PropertiesTextEdit-NullTextDisplayMode="UnfocusedAndFocused">
                            <PropertiesTextEdit>
                                <ValidationSettings SetFocusOnError="true">
                                    <RequiredField IsRequired ="true" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Modelo" FieldName="modelo" Name="modelo" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False" PropertiesTextEdit-NullText="Modelo..." PropertiesTextEdit-NullTextDisplayMode="UnfocusedAndFocused">
                            <PropertiesTextEdit>
                                <ValidationSettings SetFocusOnError="true">
                                    <RequiredField IsRequired ="true" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Otra información" FieldName="otra_informacion" Name="otra_informacion" ShowInCustomizationForm="True" VisibleIndex="10" AdaptivePriority="3" Visible="False" PropertiesTextEdit-NullText="Otra información..." PropertiesTextEdit-NullTextDisplayMode="UnfocusedAndFocused">
                            <PropertiesTextEdit>
                                <ValidationSettings SetFocusOnError="true">
                                    <RequiredField IsRequired ="true" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Cuidados y limpieza" FieldName="cuidado_limpieza" Name="cuidado_limpieza" ShowInCustomizationForm="True" VisibleIndex="11" AdaptivePriority="5" Visible="False" PropertiesTextEdit-NullText="Cuidados y limpieza..." PropertiesTextEdit-NullTextDisplayMode="UnfocusedAndFocused">
                            <PropertiesTextEdit>
                                <ValidationSettings SetFocusOnError="true">
                                    <RequiredField IsRequired ="true" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Código" FieldName="codigo_articulo" Name="codigo_articulo" ShowInCustomizationForm="True" VisibleIndex="5" PropertiesTextEdit-NullText="Código..." PropertiesTextEdit-NullTextDisplayMode="UnfocusedAndFocused" ReadOnly="True">
                            <PropertiesTextEdit>
                                <ReadOnlyStyle BackColor="Gray" ForeColor="White">
                                </ReadOnlyStyle>
                                <ValidationSettings SetFocusOnError="true">
                                    <RequiredField IsRequired ="false" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn Caption="fkey_departamento" FieldName="fkey_departamento" Name="fkey_departamento" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12" ToolTip="Departamento">
                            <PropertiesComboBox DataSourceID="SDS_Departamentos" TextField="departamento" ValueField="key_departamento" AnimationType="Fade" NullTextDisplayMode="UnfocusedAndFocused" NullText="Departamento...">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />                                    
                                </ValidationSettings>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="fkey_clasificacion" FieldName="fkey_clasificacion" Name="fkey_clasificacion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13" ToolTip="Clasificación">
                            <PropertiesComboBox DataSourceID="SDS_Clasificacion" TextField="clasificacion" ValueField="key_clasificacion" AnimationType="Fade" NullTextDisplayMode="UnfocusedAndFocused" NullText="Clasificación...">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />                                    
                                </ValidationSettings>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="fkey_familia" FieldName="fkey_familia" Name="fkey_familia" ShowInCustomizationForm="True" Visible="False" VisibleIndex="15" ToolTip="Familia">
                            <PropertiesComboBox DataSourceID="SDS_Arbol" TextField="familia" ValueField="key_familia" AnimationType="Fade" NullTextDisplayMode="UnfocusedAndFocused" NullText="Familia...">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />                                    
                                </ValidationSettings>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataDateColumn Caption="fecha_alta" FieldName="fecha_alta" Name="fecha_alta" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14" PropertiesDateEdit-NullText="Fecha de alta..." PropertiesDateEdit-NullTextDisplayMode="UnfocusedAndFocused" ReadOnly="True">
                            <PropertiesDateEdit DisplayFormatString="dd/MMM/yy" DisplayFormatInEditMode="True" >
                                <ReadOnlyStyle BackColor="Gray" ForeColor="White">
                                </ReadOnlyStyle>
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />                                    
                                </ValidationSettings>
                            </PropertiesDateEdit>
                            <SettingsHeaderFilter Mode="DateRangeCalendar">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataMemoColumn AdaptivePriority="4" Caption="Descripción Larga" CellRowSpan="2" FieldName="descripcion_larga" Name="descripcion_larga" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8" PropertiesMemoEdit-NullText="Descripción larga..." PropertiesMemoEdit-NullTextDisplayMode="UnfocusedAndFocused">
                            <PropertiesMemoEdit Rows="4">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />                                    
                                </ValidationSettings>
                            </PropertiesMemoEdit>
                            <EditFormSettings ColumnSpan="2" RowSpan="2" />
                        </dx:GridViewDataMemoColumn>
                        <dx:GridViewDataTextColumn Caption="Departamento" FieldName="departamento" Name="departamento" ShowInCustomizationForm="True" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Clasificación" FieldName="clasificacion" Name="clasificacion" ShowInCustomizationForm="True" VisibleIndex="3">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Familia" FieldName="familia" Name="familia" ShowInCustomizationForm="True" VisibleIndex="4">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn AdaptivePriority="2" Caption="Marca" FieldName="marca" Name="marca" ShowInCustomizationForm="True" VisibleIndex="7">
                            <PropertiesTextEdit NullText="Marca..." NullTextDisplayMode="UnfocusedAndFocused">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn Caption="fkey_marca" FieldName="fkey_marca" Name="fkey_marca" ShowInCustomizationForm="True" VisibleIndex="16" Visible="False">
                            <PropertiesComboBox DataSourceID="SDS_Marca" TextField="marca" ValueField="key_marca" NullText="Marca..." NullTextDisplayMode="UnfocusedAndFocused">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                    </Columns>
                    <Toolbars>
                        <dx:GridViewToolbar>
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

    <asp:SqlDataSource ID="SDS_Articulos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" 
DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulo&quot; = ? AND &quot;codigo_articulo&quot; = ?" 
InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;descripcion&quot;, &quot;modelo&quot;, &quot;descripcion_larga&quot;, &quot;otra_informacion&quot;, &quot;cuidado_limpieza&quot;, &quot;fkey_departamento&quot;, &quot;fkey_clasificacion&quot;, &quot;fkey_familia&quot;, &quot;fkey_marca&quot;, &quot;codigo_articulo&quot;, &quot;fecha_alta&quot; ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" 
SelectCommand="SELECT &quot;key_articulo&quot;, &quot;descripcion&quot;, &quot;modelo&quot;, &quot;descripcion_larga&quot;, &quot;otra_informacion&quot;, &quot;cuidado_limpieza&quot;, &quot;Articulos&quot;.&quot;fkey_departamento&quot;, &quot;Articulos&quot;.&quot;fkey_clasificacion&quot;,&quot;Articulos&quot;.&quot;fkey_familia&quot;, &quot;fkey_marca&quot;, &quot;codigo_articulo&quot;, &quot;fecha_alta&quot;, &quot;usuario_alta&quot;, &quot;Departamento&quot;.&quot;departamento&quot;, &quot;Clasificacion&quot;.&quot;clasificacion&quot;, &quot;Familia&quot;.&quot;familia&quot;, &quot;Articulos_marca&quot;.&quot;marca&quot;
FROM &quot;Articulos&quot;, &quot;Departamento&quot;, &quot;Clasificacion&quot;, &quot;Familia&quot;, &quot;Articulos_marca&quot;
WHERE &quot;Articulos&quot;.&quot;fkey_departamento&quot; = &quot;Departamento&quot;.&quot;key_departamento&quot;
AND &quot;Articulos&quot;.&quot;fkey_clasificacion&quot; = &quot;Clasificacion&quot;.&quot;key_clasificacion&quot;
AND &quot;Articulos&quot;.&quot;fkey_familia&quot; = &quot;Familia&quot;.&quot;key_familia&quot;
AND &quot;Articulos&quot;.&quot;fkey_marca&quot; = &quot;Articulos_marca&quot;.&quot;key_marca&quot;" 
UpdateCommand="UPDATE &quot;Articulos&quot; SET &quot;descripcion&quot; = ?, &quot;modelo&quot; = ?, &quot;descripcion_larga&quot; = ?, &quot;otra_informacion&quot; = ?, &quot;cuidado_limpieza&quot; = ?, &quot;fkey_departamento&quot; = ?, &quot;fkey_clasificacion&quot; = ?, &quot;fkey_familia&quot; = ?, &quot;fkey_marca&quot; = ?,  &quot;fecha_alta&quot; = ?  WHERE &quot;key_articulo&quot; = ?">
        <DeleteParameters>
            <asp:Parameter Name="key_articulo" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="modelo" Type="String" />
            <asp:Parameter Name="descripcion_larga" Type="String" />
            <asp:Parameter Name="otra_informacion" Type="String" />
            <asp:Parameter Name="cuidado_limpieza" Type="String" />
            <asp:Parameter Name="fkey_departamento" Type="Int64" />
            <asp:Parameter Name="fkey_clasificacion" Type="Int64" />
            <asp:Parameter Name="fkey_familia" Type="Int64" />
            <asp:Parameter Name="fkey_marca" Type="Int64" />
            <asp:Parameter Name="codigo_articulo" Type="String" />
            <asp:Parameter Name="fecha_alta" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="modelo" Type="String" />
            <asp:Parameter Name="descripcion_larga" Type="String" />
            <asp:Parameter Name="otra_informacion" Type="String" />
            <asp:Parameter Name="cuidado_limpieza" Type="String" />
            <asp:Parameter Name="fkey_departamento" Type="Int64" />
            <asp:Parameter Name="fkey_clasificacion" Type="Int64" />
            <asp:Parameter Name="fkey_familia" Type="Int64" />
            <asp:Parameter Name="fkey_marca" Type="Int64" />
            <asp:Parameter Name="fecha_alta" Type="DateTime" />
            <asp:Parameter Name="key_articulo" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SDS_Departamentos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;key_departamento&quot;, &quot;departamento&quot; FROM &quot;Departamento&quot;"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SDS_Familia" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;key_familia&quot;, &quot;familia&quot;, &quot;key_clasificacion&quot;, &quot;key_departamento&quot; FROM &quot;Familia&quot;"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_Marca" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;key_marca&quot;, &quot;marca&quot; FROM &quot;Articulos_marca&quot;"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_Clasificacion" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;key_clasificacion&quot;, &quot;clasificacion&quot;, &quot;fkey_departamento&quot; FROM  &quot;Clasificacion&quot;"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_Arbol" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" 
        SelectCommand="SELECT &quot;Familia&quot;.&quot;key_familia&quot;,&quot;Departamento&quot;.&quot;departamento&quot;, &quot;Clasificacion&quot;.&quot;clasificacion&quot;, &quot;Familia&quot;.&quot;familia&quot;, &quot;Familia&quot;.&quot;fkey_clasificacion&quot;, &quot;Familia&quot;.&quot;fkey_departamento&quot;
FROM &quot;Departamento&quot;, &quot;Clasificacion&quot;, &quot;Familia&quot; 
WHERE &quot;Departamento&quot;.&quot;key_departamento&quot; = &quot;Clasificacion&quot;.&quot;fkey_departamento&quot; AND &quot;Clasificacion&quot;.&quot;key_clasificacion&quot; = &quot;Familia&quot;.&quot;fkey_clasificacion&quot;">
    </asp:SqlDataSource>

    
    <asp:SqlDataSource ID="SDS_ArticulosDeptos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;Articulos&quot;.&quot;fkey_departamento&quot;, &quot;Departamento&quot;.&quot;departamento&quot;
FROM &quot;Articulos&quot;, &quot;Departamento&quot;
WHERE &quot;Articulos&quot;.&quot;fkey_departamento&quot; = &quot;Departamento&quot;.&quot;key_departamento&quot;">
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SDS_ArticulosClas" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;Articulos&quot;.&quot;fkey_departamento&quot;, &quot;Articulos&quot;.&quot;fkey_clasificacion&quot;, &quot;Clasificacion&quot;.&quot;clasificacion&quot;, &quot;Departamento&quot;.&quot;departamento&quot;
FROM &quot;Articulos&quot;, &quot;Clasificacion&quot;, &quot;Departamento&quot;
WHERE &quot;Articulos&quot;.&quot;fkey_clasificacion&quot; = &quot;Clasificacion&quot;.&quot;key_clasificacion&quot;
AND &quot;Articulos&quot;.&quot;fkey_departamento&quot; = &quot;Departamento&quot;.&quot;key_departamento&quot;
AND &quot;Departamento&quot;.&quot;departamento&quot; = ?">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="departamento" SessionField="departamento_filter" />
        </SelectParameters>
    </asp:SqlDataSource>

    
    <asp:SqlDataSource ID="SDS_ArticulosFam" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" 
SelectCommand="SELECT DISTINCT &quot;Articulos&quot;.&quot;fkey_clasificacion&quot;, &quot;Articulos&quot;.&quot;fkey_familia&quot;, &quot;Familia&quot;.&quot;familia&quot;
FROM &quot;Articulos&quot;,&quot;Departamento&quot;, &quot;Clasificacion&quot;, &quot;Familia&quot;
WHERE &quot;Articulos&quot;.&quot;fkey_departamento&quot; = &quot;Departamento&quot;.&quot;key_departamento&quot;
AND &quot;Articulos&quot;.&quot;fkey_clasificacion&quot; = &quot;Clasificacion&quot;.&quot;key_clasificacion&quot;
AND &quot;Articulos&quot;.&quot;fkey_familia&quot; = &quot;Familia&quot;.&quot;key_familia&quot;
AND &quot;Clasificacion&quot;.&quot;clasificacion&quot; = ?
AND &quot;Departamento&quot;.&quot;departamento&quot; = ?">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="clasificacion" SessionField="clasificacion_filter" />
            <asp:SessionParameter DefaultValue="" Name="departamento" SessionField="departamento_filter" />
        </SelectParameters>
    </asp:SqlDataSource>


    <dx:ASPxGridLookup ID="ASPxGridLookup2" KeyFieldName="key_familia" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_DepClasFam" EnableTheming="True" Theme="MaterialCompact" Width="40%">
<GridViewProperties>
    <%--<Settings ShowFilterRow="True"  />--%>
    <%--ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" ShowHeaderFilterButton="True"--%>
    <Settings ShowHeaderFilterButton="true"/>
</GridViewProperties>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="key_familia" ReadOnly="True" Visible="False" VisibleIndex="3">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="departamento" ReadOnly="True" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="clasificacion" ReadOnly="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="familia" ReadOnly="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="fkey_clasificacion" ReadOnly="True" Visible="False" VisibleIndex="4">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="fkey_departamento" ReadOnly="True" Visible="False" VisibleIndex="5">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridLookup>

    <asp:SqlDataSource ID="SDS_DepClasFam" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;Familia&quot;.&quot;key_familia&quot;,&quot;Departamento&quot;.&quot;departamento&quot;, &quot;Clasificacion&quot;.&quot;clasificacion&quot;, &quot;Familia&quot;.&quot;familia&quot;, &quot;Familia&quot;.&quot;fkey_clasificacion&quot;, &quot;Familia&quot;.&quot;fkey_departamento&quot;
    FROM &quot;Departamento&quot;, &quot;Clasificacion&quot;, &quot;Familia&quot; 
    WHERE &quot;Departamento&quot;.&quot;key_departamento&quot; = &quot;Clasificacion&quot;.&quot;fkey_departamento&quot; AND &quot;Clasificacion&quot;.&quot;key_clasificacion&quot; = &quot;Familia&quot;.&quot;fkey_clasificacion&quot;"></asp:SqlDataSource>


</div>
</asp:Content>