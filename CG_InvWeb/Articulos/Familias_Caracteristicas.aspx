<%@ Page Title="Familia -> Características" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Familias_Caracteristicas.aspx.cs" Inherits="CG_InvWeb.Articulos.Familias_Caracteristicas" %>

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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Relación Familia -> Características" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Articulos/Familias_Caracteristicas.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Familia_Caracteristicas" EnableTheming="True" Theme="MaterialCompact" KeyFieldName="key_familia_caracteristicas" KeyboardSupport="True" Width="100%" OnRowDeleted="ASPxGridView1_RowDeleted" OnRowInserted="ASPxGridView1_RowInserted" OnRowUpdated="ASPxGridView1_RowUpdated" OnInitNewRow="ASPxGridView1_InitNewRow1" OnStartRowEditing="ASPxGridView1_StartRowEditing" OnCustomErrorText="ASPxGridView1_CustomErrorText">
                            <EditFormLayoutProperties ColCount="2" ColumnCount="2" ShowItemCaptionColon="False">
                                <Items>
                                    <dx:GridViewLayoutGroup Caption="Departamento    |    Clasificación    |    Familia" ColCount="3" ColSpan="2" ColumnCount="3" ColumnSpan="2">
                                        <Items>
                                            <dx:GridViewColumnLayoutItem ColSpan="3" ColumnName="fkey_familia" ColumnSpan="3" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="departamento" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="clasificacion" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="familia" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                            </dx:GridViewColumnLayoutItem>
                                        </Items>
                                    </dx:GridViewLayoutGroup>
                                    <dx:GridViewLayoutGroup Caption="Datos Generales" ColSpan="2" Name="DatosGralesArticulos">
                                        <Items>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="fkey_caracteristicas">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:EditModeCommandLayoutItem ColSpan="1" HorizontalAlign="Right">
                                            </dx:EditModeCommandLayoutItem>
                                        </Items>
                                    </dx:GridViewLayoutGroup>

                                </Items>
                                <SettingsItemCaptions Location="Top" />
                    </EditFormLayoutProperties>

                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="key_familia_caracteristicas" ShowInCustomizationForm="True" VisibleIndex="0" ReadOnly="True" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="fkey_familia" ShowInCustomizationForm="True" VisibleIndex="1" ReadOnly="True" Visible="False">
                            <PropertiesTextEdit>
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                            <EditFormSettings Visible="False" />
                            <EditItemTemplate>
                                <dx:ASPxGridLookup ID="ASPxGridLookup2" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_DepClasFam" EnableTheming="True" KeyFieldName="key_familia" NullText="Departamento | Clasificación | Familia" NullTextDisplayMode="UnfocusedAndFocused" OnValueChanged="ASPxGridLookup2_ValueChanged" TextFormatString="{1}   |   {2}   |   {3}" Theme="MaterialCompact" ToolTip="Departamento | Clasificación | Familia" Width="100%">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowEllipsisInText="True" AllowFocusedRow="True" AllowSelectSingleRowOnly="True" AutoExpandAllGroups="True" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Settings ShowGroupedColumns="True" ShowHeaderFilterBlankItems="False" ShowHeaderFilterButton="True" VerticalScrollBarMode="Auto" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="key_familia" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="departamento" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="clasificacion" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="familia" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="150px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="fkey_clasificacion" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="fkey_departamento" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
                                        <RegularExpression ValidationExpression="\d+" />
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxGridLookup>
                            </EditItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="departamento" GroupIndex="0" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Departamento">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="clasificacion" GroupIndex="1" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Clasificación">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="familia" GroupIndex="2" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Familia">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="fkey_caracteristicas" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Característica">
                            <PropertiesComboBox DataSourceID="SDS_Caraceristicas" TextField="caracteristica" ValueField="key_caracteristicas">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />                                    
                                </ValidationSettings>
                            </PropertiesComboBox>
                            <EditFormSettings Visible="False" />
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


                            <FormatConditions>
                                <dx:GridViewFormatConditionHighlight FieldName="departamento" Format="YellowFillWithDarkYellowText">
                                </dx:GridViewFormatConditionHighlight>
                            </FormatConditions>


                </dx:ASPxGridView>
<%--                <dx:ASPxGridLookup ID="ASPxGridLookup2" runat="server"></dx:ASPxGridLookup>--%>

                <asp:SqlDataSource ID="SDS_Familia_Caracteristicas" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" 
                    DeleteCommand="DELETE FROM &quot;Familia_caracteristicas&quot; WHERE key_familia_caracteristicas = ?" 
                    InsertCommand="INSERT INTO &quot;Familia_caracteristicas&quot; (&quot;fkey_familia&quot;, &quot;fkey_caracteristicas&quot;) VALUES ( ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT key_familia_caracteristicas, fkey_familia, fkey_caracteristicas , &quot;Departamento&quot;.departamento, &quot;Clasificacion&quot;.clasificacion, &quot;Familia&quot;.familia
                    FROM &quot;Familia_caracteristicas&quot;, &quot;Departamento&quot;, &quot;Clasificacion&quot;, &quot;Familia&quot;
                    WHERE   &quot;Familia_caracteristicas&quot;.fkey_familia = &quot;Familia&quot;.key_familia
                    AND     &quot;Familia&quot;.fkey_clasificacion = &quot;Clasificacion&quot;.key_clasificacion 
                    AND     &quot;Familia&quot;.fkey_departamento = &quot;Departamento&quot;.key_departamento"
                    UpdateCommand="UPDATE &quot;Familia_caracteristicas&quot; SET fkey_familia = ?, fkey_caracteristicas = ? WHERE key_familia_caracteristicas = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_familia_caracteristicas" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name ="fkey_familia" SessionField="session_familia" Type="Int64" />
                        <asp:Parameter Name="fkey_caracteristicas" Type="Int64" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="fkey_familia" Type="Int64" />
                        <asp:Parameter Name="fkey_caracteristicas" Type="Int64" />
                        <asp:Parameter Name="key_familia_caracteristicas" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
                <asp:SqlDataSource ID="SDS_Caraceristicas" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_caracteristicas, caracteristica FROM &quot;Caracteristicas&quot; ORDER BY caracteristica ASC">
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SDS_DepClasFam" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" 
                    SelectCommand="SELECT &quot;Familia&quot;.&quot;key_familia&quot;,&quot;Departamento&quot;.&quot;departamento&quot;, &quot;Clasificacion&quot;.&quot;clasificacion&quot;, &quot;Familia&quot;.&quot;familia&quot;, &quot;Familia&quot;.&quot;fkey_clasificacion&quot;, &quot;Familia&quot;.&quot;fkey_departamento&quot;
                FROM &quot;Departamento&quot;, &quot;Clasificacion&quot;, &quot;Familia&quot; 
                WHERE &quot;Departamento&quot;.&quot;key_departamento&quot; = &quot;Clasificacion&quot;.&quot;fkey_departamento&quot; AND &quot;Clasificacion&quot;.&quot;key_clasificacion&quot; = &quot;Familia&quot;.&quot;fkey_clasificacion&quot;
                ORDER BY fkey_departamento,fkey_clasificacion,key_familia ASC">
                </asp:SqlDataSource>
                
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
</asp:Content>

