<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Perfiles.aspx.cs" Inherits="CG_InvWeb.Perfiles" %>


<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        Principal{
        width:80%;
        margin-top:20px;
        padding-left:20px;
        padding-top:20px;
    }
    .auto-style1 {
        margin-left: 0px;
        vertical-align:text-top;
        text-align:left;
    }
</style>
<div class="Principal">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Perfiles" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" AllowCollapsingByHeaderClick="True" HeaderNavigateUrl="~/Perfiles.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSourcePerfil" KeyFieldName="key_perfil" OnCustomErrorText="ASPxGridView1_CustomErrorText" style="margin-left: 0px" Theme="MaterialCompact" KeyboardSupport="True" Width="100%">
                <Columns>
                    <dx:GridViewCommandColumn VisibleIndex="0" Caption="#" Visible="False">
                    </dx:GridViewCommandColumn>

                    <dx:GridViewDataTextColumn FieldName="perfil" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Perfil" SortIndex="0" SortOrder="Ascending">
                        <PropertiesTextEdit MaxLength="15" HelpText="Nombre del perfil (15 caracteres)" NullText="Perfil">
<%--                            <MaskSettings Mask="AAA" />--%>
                            <ValidationSettings SetFocusOnError="True">
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                        <EditFormSettings Caption="Perfil" CaptionLocation="Top" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="key_perfil" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2" Caption="key_perfil" Name="key_perfil">
                    </dx:GridViewDataTextColumn>
                </Columns>

                    <SettingsPopup>
                        <EditForm CloseOnEscape="True" AllowResize="True" ShowCollapseButton="True" ShowMaximizeButton="True" ShowPinButton="True" ShowShadow="True" ShowViewportScrollbarWhenModal="True" HorizontalAlign="LeftSides" ShowFooter="True" ShowPageScrollbarWhenModal="True" VerticalAlign="Above">
                            <SettingsAdaptivity Mode="OnWindowInnerWidth" />
                        </EditForm>
                    </SettingsPopup>
                    <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="DataAware" FileName="Usuarios">
                    </SettingsExport>
                    <SettingsSearchPanel ShowApplyButton="True" ShowClearButton="True" />

                    <EditFormLayoutProperties ColCount="1">
                        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" />
                        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600">
                        </SettingsAdaptivity>
                        <Items>
                            <dx:GridViewColumnLayoutItem Caption="Perfil" ColSpan="1" ColumnName="perfil" ShowCaption="True">
                                <CaptionSettings Location="Top" />
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="1">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                    </EditFormLayoutProperties>



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
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <br />
    <asp:SqlDataSource ID="SDSourcePerfil" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" DeleteCommand="DELETE FROM &quot;Perfil&quot; WHERE &quot;key_perfil&quot; = ?" InsertCommand="INSERT INTO &quot;Perfil&quot; (&quot;perfil&quot;) VALUES (?)" SelectCommand="SELECT * FROM &quot;Perfil&quot;" UpdateCommand="UPDATE &quot;Perfil&quot; SET &quot;perfil&quot; = ? WHERE &quot;key_perfil&quot; = ?" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>">
    <DeleteParameters>
        <asp:Parameter Name="key_perfil" Type="Int64" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="perfil" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Perfil" Type="String" />
        <asp:Parameter Name="key_perfil" Type="Int64" />
    </UpdateParameters>
</asp:SqlDataSource>
</div>
</asp:Content>