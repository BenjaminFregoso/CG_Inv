<%@ Page Title="Familias" Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Familias.aspx.cs" Inherits="CG_InvWeb.Articulos.Familias" %>

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
    <dx:ASPxRoundPanel ID="ASPxRoundPanelPrincipal" HorizontalAlign="Left" runat="server" HeaderText="Familias" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" Height="100%" AllowCollapsingByHeaderClick="True" HeaderNavigateUrl="~/Articulos/Familias.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">               
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Familia" KeyFieldName="key_familia"  EnableTheming="True" Theme="MaterialCompact" KeyboardSupport="True" Width="100%" OnInitNewRow="ASPxGridView1_InitNewRow" OnStartRowEditing="ASPxGridView1_StartRowEditing" OnRowDeleted="ASPxGridView1_RowDeleted" OnRowInserted="ASPxGridView1_RowInserted" OnRowUpdated="ASPxGridView1_RowUpdated">
                    <EditFormLayoutProperties>
                        <Items>
                            <dx:GridViewLayoutGroup ColCount="2" ColSpan="1" ColumnCount="2" Caption="Departamento  |  Clasificación">
                                <Items>
                                    <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="fkey_clasificacion" ColumnSpan="2" Caption="Clasificación" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="departamento">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="clasificacion">
                                    </dx:GridViewColumnLayoutItem>
                                </Items>
                            </dx:GridViewLayoutGroup>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="familia">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="1" HorizontalAlign="Right">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600">
                        </SettingsAdaptivity>
                        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" />
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn VisibleIndex="0" Caption="#" Visible="False">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="key_familia" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1" Name="key_familia">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn  FieldName="familia" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Familia" Name="familia">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn GroupIndex="0" FieldName="departamento" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Departamento" Name="departamento">
                            <PropertiesTextEdit>
                                <ReadOnlyStyle BackColor="#999999" ForeColor="White">
                                </ReadOnlyStyle>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn GroupIndex="1" FieldName="clasificacion" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Clasificación" Name="clasificacion">
                            <PropertiesTextEdit>
                                <ReadOnlyStyle BackColor="#999999" ForeColor="White">
                                </ReadOnlyStyle>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="fkey_clasificacion" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Name="fkey_clasificacion" Visible="False">
                            <PropertiesComboBox DataSourceID="SDS_Clasificacion" TextField="clasificacion" ValueField="key_clasificacion">
                            </PropertiesComboBox>
                            <EditFormSettings Visible="False" />                            
                            <EditItemTemplate>
                                <dx:ASPxGridLookup ID="ASPxGridLookup1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_DepClas" EnableTheming="True" KeyFieldName="key_clasificacion" NullText="Departamento | Clasificación " NullTextDisplayMode="UnfocusedAndFocused" OnValueChanged="ASPxGridLookup1_ValueChanged" TextFormatString="{0}   |   {1}   " Theme="MaterialCompact" ToolTip="Departamento | Clasificación " Width="100%">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowEllipsisInText="True" AllowFocusedRow="True" AllowSelectSingleRowOnly="True" AutoExpandAllGroups="True" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Settings ShowGroupedColumns="True" ShowHeaderFilterBlankItems="False" ShowHeaderFilterButton="True" VerticalScrollBarMode="Auto" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn Width="150px"  Caption="Departamento" FieldName="departamento" ShowInCustomizationForm="True" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Width="150px"  Caption="Clasificación" FieldName="clasificacion" ShowInCustomizationForm="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="fkey_departamento" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="key_clasificacion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <CaptionSettings Position="Top" />
                                </dx:ASPxGridLookup>
                            </EditItemTemplate>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="fkey_departamento" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6" Name="fkey_departamento" Visible="False">
                            <PropertiesComboBox DataSourceID="SDS_Departamentos" TextField="departamento" ValueField="key_departamento">
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

                    <Settings ShowHeaderFilterButton="True" ShowHeaderFilterBlankItems="false" ShowGroupedColumns="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" VerticalScrollBarStyle="VirtualSmooth" VerticalScrollableHeight="570"/>

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

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>



    <asp:SqlDataSource ID="SDS_Familia" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>"
SelectCommand="SELECT key_familia, familia, fkey_clasificacion, &quot;Familia&quot;.fkey_departamento,&quot;Departamento&quot;.departamento, &quot;Clasificacion&quot;.clasificacion 
FROM &quot;Familia&quot;, &quot;Departamento&quot;,&quot;Clasificacion&quot; 
WHERE &quot;Familia&quot;.fkey_departamento = &quot;Departamento&quot;.key_departamento
AND &quot;Familia&quot;.fkey_clasificacion = &quot;Clasificacion&quot;.key_clasificacion" 
DeleteCommand="DELETE FROM &quot;Familia&quot; WHERE key_familia = ?" 
InsertCommand="INSERT INTO &quot;Familia&quot; (familia, fkey_clasificacion, fkey_departamento) VALUES ( ?, ?, ?)" 
UpdateCommand="UPDATE &quot;Familia&quot; SET familia = ?, fkey_clasificacion = ?, fkey_departamento = ? WHERE key_familia = ?">
        <DeleteParameters>
            <asp:Parameter Name="key_familia" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="familia" Type="String" />
            <asp:SessionParameter Name ="fkey_clasificacion" SessionField="session_clasificacion" Type="Int64" />
            <asp:SessionParameter Name ="fkey_departamento" SessionField="session_departamento" Type="Int64" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="familia" Type="String" />
            <asp:Parameter Name="fkey_clasificacion" Type="Int64" />
            <asp:Parameter Name="fkey_departamento" Type="Int64" />
            <asp:Parameter Name="key_familia" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_Departamentos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_departamento, departamento FROM &quot;Departamento&quot;"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SDS_Clasificacion" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_clasificacion, clasificacion, fkey_departamento FROM  &quot;Clasificacion&quot;"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_DepClas" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand=
"SELECT &quot;Departamento&quot;.departamento, &quot;Clasificacion&quot;.clasificacion, &quot;Clasificacion&quot;.key_clasificacion, &quot;Clasificacion&quot;.fkey_departamento
FROM &quot;Departamento&quot;, &quot;Clasificacion&quot; 
WHERE &quot;Departamento&quot;.key_departamento = &quot;Clasificacion&quot;.fkey_departamento 
ORDER BY fkey_departamento,key_clasificacion ASC"></asp:SqlDataSource>


</div>
</asp:Content>