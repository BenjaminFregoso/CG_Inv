﻿<%@ Page Title="Régimen Fiscal" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="RegimenFiscal_New.aspx.cs" Inherits="CG_InvWeb.Catalogos.RegimenFiscal_New" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- ESTILOS DE NUESTRO WEB FORM CORRESPONDIENTES AL PROYECTO -->
    <style>
        Principal{
        width:80%;
        margin-top:20px;
        padding-left:20px;
        padding-top:20px;
        font-family :'Century Gothic';
    }
    .auto-style1 {
        margin-left: 0px;
        vertical-align:text-top;
        text-align:left;
        font-family :'Century Gothic';
    }
</style> 
    <!-- AQUI TERMINA LA SECCION DE ESTILOS -->

<!-- COMIENZA CLASE PRINCIPAL DE NUESTRO ASP WEBFORM -->
<div class="Principal">
    <!-- ELEMENTOS DE NUESTRO MENU DE NAVEGACION ES NECESARIO AGREGARLOS PARA IMPORTAR EL CONTENIDO LATERAL IZQUIERDO Y SUPERIOR DE NUESTRO WEB FORM -->
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Régimen fiscal" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Catalogos/RegimenFiscal_New.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                


                <!-- COMIENZA SECCION DE DATAGRIDVIEW AUTOGENERADO POR LA HERRAMIENTA EN DISEÑO -->
                <!--AQUI DENTRO SE MODIFICARAN LOS PARAMETROS DE NUESTRA TABLA DE DE LOS CATALOGOS LOS CUALES MUESTRAN INFORMACION DE LA TABLA DE REGIMEN FISCAL -->
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="true" KeyFieldName="key_regimen_fiscal" Theme="MaterialCompact" KeyboardSupport="True" Width="100%" OnRowDeleted="ASPxGridView1_RowDeleted" OnRowInserted="ASPxGridView1_RowInserted" OnRowUpdated="ASPxGridView1_RowUpdated">
          

                    <EditFormLayoutProperties ColCount="2" ColumnCount="2" ShowItemCaptionColon="False">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="codigo_regimen_fiscal">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="descrip">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fisica">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="moral">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fecha_ini">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fecha_fin">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="2" ColumnSpan="2" HorizontalAlign="Right">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                        <SettingsItemCaptions Location="Top" />
                    </EditFormLayoutProperties>
          

                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Key De Regime Fiscal" FieldName="key_regimen_fiscal" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Codigo" FieldName="codigo_regimen_fiscal" ShowInCustomizationForm="True" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Descripcion" FieldName="descrip" ShowInCustomizationForm="True" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Fecha Inicial" FieldName="fecha_ini" ShowInCustomizationForm="True" VisibleIndex="5">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn Caption="Fecha Final" FieldName="fecha_fin" ShowInCustomizationForm="True" VisibleIndex="6">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataCheckColumn Caption="Persona Fisica" FieldName="fisica" ShowInCustomizationForm="True" VisibleIndex="3">
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataCheckColumn Caption="Persona Moral" FieldName="moral" ShowInCustomizationForm="True" VisibleIndex="4">
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

                    <SettingsEditing Mode="PopupEditForm">
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
                <!--TERMINA SECCION DE DATAGRIVIEW DE LA HERRAMIENTA DE DISEÑO -->

                <!-- AQUI TENEMOS EL DATASOURCE CORRESPONDIENTE A CADA CATOLOGO ESTE ES UN EJEMPLO TOMADO DE UN CATALOGO EXISTENTE, EN SU DEFECTO PUEDE SER CREADO DESDE CERO -->
                <!-- SI ES MOMENTO DE CREAR ALGUNO DESDE CERO ES RECOMENDABLE PEDIR AYUDA O INVESTIGAR COMO GENERAR UN DATASOURCE A LA MEDIDA -->
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" DeleteCommand="DELETE FROM &quot;c_Regimen_Fiscal&quot; WHERE &quot;key_regimen_fiscal&quot; = ?" InsertCommand="INSERT INTO &quot;c_Regimen_Fiscal&quot; (&quot;codigo_regimen_fiscal&quot;, &quot;descrip&quot;, &quot;fisica&quot;, &quot;moral&quot;, &quot;fecha_ini&quot;, &quot;fecha_fin&quot;) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT &quot;key_regimen_fiscal&quot;, &quot;codigo_regimen_fiscal&quot;, &quot;descrip&quot;, &quot;fisica&quot;, &quot;moral&quot;,&quot;fecha_ini&quot;,&quot;fecha_fin&quot;  FROM &quot;c_Regimen_Fiscal&quot; ORDER BY &quot;codigo_regimen_fiscal&quot;" UpdateCommand="UPDATE &quot;c_Regimen_Fiscal&quot; SET &quot;codigo_regimen_fiscal&quot; = ?, &quot;descrip&quot; = ?, &quot;fisica&quot; = ?, &quot;moral&quot; = ?, &quot;fecha_ini&quot; = ?, &quot;fecha_fin&quot; = ? WHERE &quot;key_regimen_fiscal&quot; = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_regimen_fiscal" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="codigo_regimen_fiscal" Type="Int32" />
                        <asp:Parameter Name="descrip" Type="String" />
                        <asp:Parameter Name="fisica" Type="Int32" />
                        <asp:Parameter Name="moral" Type="Int32" />
                        <asp:Parameter Name="fecha_ini" Type="DateTime" />
                        <asp:Parameter Name="fecha_fin" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="codigo_regimen_fiscal" Type="Int32" />
                        <asp:Parameter Name="descrip" Type="String" />
                        <asp:Parameter Name="fisica" Type="Int32" />
                        <asp:Parameter Name="moral" Type="Int32" />
                        <asp:Parameter Name="fecha_ini" Type="DateTime" />
                        <asp:Parameter Name="fecha_fin" Type="DateTime" />
                        <asp:Parameter Name="key_regimen_fiscal" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <!-- AQUI TERMINA LA SECCION QUE CONTIENE EL DATASOURCE -->
            
            
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <!-- TERMINA SECCION DE ELEMENTOS DEL MENU DE NAVEGACION -->

</div>
<!-- TERMINA CLASE PRINCIPAL DEL WEBFORM -->

</asp:Content>
