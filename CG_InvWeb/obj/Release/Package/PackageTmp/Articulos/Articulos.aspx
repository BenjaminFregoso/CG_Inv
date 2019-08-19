<%@ Page Title="Régimen Fiscal" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="CG_InvWeb.Articulos.Articulos" %>

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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Artículos" ShowCollapseButton="True" Theme="MaterialCompact" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Articulos/Clasificacion.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView  ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Articulos" KeyFieldName="key_articulo" EnableTheming="True" Theme="MaterialCompact" KeyboardSupport="True" Width="100%" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" OnStartRowEditing="ASPxGridView1_StartRowEditing">

                    <SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True" />
                    <Templates>
                        <DetailRow>
                            <dx:ASPxPageControl BackColor="#cccccc" ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" EnableTabScrolling="True" Theme="MaterialCompact" Width="100%">
                                <TabPages>
                                    <dx:TabPage Name="caracteristicas" Text="Características">
                                        <%--<TabImage IconID="outlookinspired_customerprofilereport_svg_16x16">
                                        </TabImage>--%>
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <dx:ASPxGridView ID="ASPxGridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Articulos_Caracteristicas" KeyFieldName="key_articulos_caracteristicas" OnBeforePerformDataSelect="ASPxGridView4_BeforePerformDataSelect" OnRowInserting="ASPxGridView4_RowInserting" Theme="Glass" Width="100%" OnCellEditorInitialize="ASPxGridView4_CellEditorInitialize" OnInitNewRow="ASPxGridView4_InitNewRow" EnableTheming="True" KeyboardSupport="True">
                                                    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
                                                    <SettingsPager Mode="EndlessPaging">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Inline">
                                                    </SettingsEditing>
                                                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                                    <Settings ShowHeaderFilterButton="True" ShowHeaderFilterBlankItems="false" ShowGroupedColumns="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" />


                                                    <SettingsCommandButton>
                                                        <NewButton Text="Nuevo">
                                                            <Image IconID="actions_add_16x16gray">
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
                                                    </SettingsCommandButton>

                                                    <Columns>
                                                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="50px">
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn FieldName="key_articulos_caracteristicas" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1" Name="key_articulos_caracteristicas">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="fkey_articulo" FieldName="fkey_articulo" Name="fkey_articulo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="Característica" FieldName="caracteristica" ShowInCustomizationForm="True" VisibleIndex="2" Name="caracteristica">
                                                            <PropertiesComboBox SelectInputTextOnClick="true" DataSourceID="SDS_Caracteristicas" TextField="caracteristica" ValueField="caracteristica" ClientInstanceName="caracteristica">
                                                                <ReadOnlyStyle BackColor="#999999" ForeColor="White">
                                                                </ReadOnlyStyle>
                                                            </PropertiesComboBox>
                                                        </dx:GridViewDataComboBoxColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="Detalle" FieldName="caracteristica_det" ShowInCustomizationForm="True" VisibleIndex="3" Name="caracteristica_det">
                                                            <PropertiesComboBox SelectInputTextOnClick="true" DataSourceID="SDS_Caracteristicas_det" TextField="descripcion" ValueField="descripcion">
                                                                <ReadOnlyStyle BackColor="#999999" ForeColor="White">
                                                                </ReadOnlyStyle>
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
                                    <dx:TabPage Name="talla" Text="Talla">
                                        <%--<TabImage IconID="richedit_rulervertical_svg_16x16">
                                        </TabImage>--%>
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Articulos_Tallas" KeyFieldName="key_tallas" Theme="Glass" Width="100%" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect" OnInitNewRow="ASPxGridView2_InitNewRow" OnRowInserting="ASPxGridView2_RowInserting" KeyboardSupport="True">
                                                    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
                                                    <SettingsPager Mode="EndlessPaging">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Inline">
                                                    </SettingsEditing>
                                                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                                    <Settings ShowHeaderFilterButton="True" ShowHeaderFilterBlankItems="false" ShowGroupedColumns="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" />


                                                    <SettingsCommandButton>
                                                        <NewButton Text="Nuevo">
                                                            <Image IconID="actions_add_16x16gray">
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
                                                    </SettingsCommandButton>


                                                    <Columns>
                                                        <dx:GridViewCommandColumn Width="50px" ButtonRenderMode="Image" ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn FieldName="key_tallas" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="tallas" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Código de talla" ReadOnly="True">
                                                            <PropertiesTextEdit DisplayFormatInEditMode="false" DisplayFormatString="000000000-00">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="descrip" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Talla">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="fkey_articulo" ShowInCustomizationForm="True" VisibleIndex="5" Visible="False" Caption="fkey_articulo" Name="fkey_articulo">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="Rango de tallas" FieldName="fkey_rango" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            <PropertiesComboBox DataSourceID="SDS_Articulos_Tallas_Rangos" ImageUrlField="imagen" TextField="rango" ValueField="key_rango_talla">
                                                            </PropertiesComboBox>
                                                            <EditFormSettings Visible="False" />
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
                                    <dx:TabPage Name="color" Text="Color">
                                        <%--<TabImage IconID="businessobjects_bo_appearance_svg_16x16">
                                        </TabImage>--%>
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Articulos_Color" KeyFieldName="key_color" OnBeforePerformDataSelect="ASPxGridView3_BeforePerformDataSelect" OnInitNewRow="ASPxGridView3_InitNewRow" OnRowInserting="ASPxGridView3_RowInserting" Theme="Glass" Width="100%" KeyboardSupport="True">
                                                    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
                                                    <SettingsPager Mode="EndlessPaging">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Inline">
                                                    </SettingsEditing>
                                                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                                    <Settings ShowHeaderFilterButton="True" ShowHeaderFilterBlankItems="false" ShowGroupedColumns="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" />


                                                    <SettingsCommandButton>
                                                        <NewButton Text="Nuevo">
                                                            <Image IconID="actions_add_16x16gray">
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
                                                    </SettingsCommandButton>

                                                    <Columns>
                                                        <dx:GridViewCommandColumn Width="50px" ButtonRenderMode="Image" ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn FieldName="key_color" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Código de color" FieldName="color" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                            <PropertiesTextEdit DisplayFormatString="000000000-00">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="fkey_articulo" FieldName="fkey_articulo" Name="fkey_articulo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Descripción" FieldName="descrip" ShowInCustomizationForm="True" VisibleIndex="3">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataColorEditColumn Caption="Color" FieldName="color_hex" ShowInCustomizationForm="True" VisibleIndex="5" Name="Color">
                                                            <PropertiesColorEdit EnableCustomColors="True">
                                                            </PropertiesColorEdit>
                                                        </dx:GridViewDataColorEditColumn>
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
                                    <dx:TabPage Name="precios" Text="Precios">
                                        <%--<TabImage IconID="iconbuilder_business_money_svg_16x16">
                                        </TabImage>--%>
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                </TabPages>
                            </dx:ASPxPageControl>
                        </DetailRow>
                    </Templates>


                    <EditFormLayoutProperties ColCount="2" ShowItemCaptionColon="False">
                        <Items>
                            <dx:GridViewLayoutGroup Caption="Código y fecha" ColCount="2" ColSpan="2" ColumnCount="2">
                                <Items>
                                    <dx:GridViewColumnLayoutItem ColumnName="codigo_articulo" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="fecha_alta" RequiredMarkDisplayMode="Hidden" ShowCaption="False" Caption="Fecha de alta">
                                    </dx:GridViewColumnLayoutItem>
                                </Items>
                            </dx:GridViewLayoutGroup>
                            <dx:GridViewLayoutGroup Caption="Departamento    |    Clasificación    |    Familia" ColCount="3" ColSpan="2" ColumnCount="3" ColumnSpan="2">
                                <Items>
                                    <dx:GridViewColumnLayoutItem ColSpan="3" ColumnName="fkey_familia" ColumnSpan="3" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="Departamento" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="Clasificación" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="Familia" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                </Items>
                            </dx:GridViewLayoutGroup>
                            <dx:GridViewLayoutGroup Caption="Datos Generales" ColCount="2" ColSpan="2" Name="DatosGralesArticulos" ColumnCount="2">
                                <Items>
                                    <dx:GridViewColumnLayoutItem ColumnName="fkey_marca" RequiredMarkDisplayMode="Hidden" ShowCaption="False" Caption="Marca">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="Modelo" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="descripcion" ColumnSpan="2" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="Otra información" RequiredMarkDisplayMode="Hidden" ShowCaption="False" ColSpan="1">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="Cuidados y limpieza" RequiredMarkDisplayMode="Hidden" ShowCaption="False">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="descripcion_larga" RequiredMarkDisplayMode="Hidden" ShowCaption="False" ColSpan="2" ColumnSpan="2" RowSpan="2"></dx:GridViewColumnLayoutItem>
                                </Items>
                            </dx:GridViewLayoutGroup>
                            <dx:EmptyLayoutItem ColSpan="1">
                            </dx:EmptyLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="1" Width="100%">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600">
                        </SettingsAdaptivity>
                        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" />
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
                                <ReadOnlyStyle BackColor="#999999" ForeColor="White">
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
                            <EditItemTemplate>
                                <dx:ASPxGridLookup ID="ASPxGridLookup2" TextFormatString="{1}   |   {2}   |   {3}" SelectionMode="Single" KeyFieldName="key_familia" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_DepClasFam" EnableTheming="True" Theme="MaterialCompact" Width="100%" OnValueChanged="ASPxGridLookup2_ValueChanged" NullText="Departamento | Clasificación | Familia" NullTextDisplayMode="UnfocusedAndFocused" ToolTip="Departamento | Clasificación | Familia">
                                    <GridViewProperties >
                                    <SettingsBehavior AllowEllipsisInText="true" AllowFocusedRow="True" AllowSelectSingleRowOnly="True" AutoExpandAllGroups="True"></SettingsBehavior>
                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                    <Settings VerticalScrollBarMode="Auto"  ShowHeaderFilterButton="true" ShowHeaderFilterBlankItems="false" ShowGroupedColumns="true" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn  FieldName="key_familia" ReadOnly="True" Visible="False" VisibleIndex="3">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Width="150px" FieldName="departamento" ReadOnly="True" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Width="150px" FieldName="clasificacion" ReadOnly="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Width="150px" FieldName="familia" ReadOnly="True" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="fkey_clasificacion" ReadOnly="True" Visible="False" VisibleIndex="4">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="fkey_departamento" ReadOnly="True" Visible="False" VisibleIndex="5">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <ValidationSettings SetFocusOnError="True" EnableCustomValidation="True" ErrorDisplayMode="ImageWithTooltip">
                                        <RegularExpression ValidationExpression="\d+" />
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxGridLookup>
                            </EditItemTemplate>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataDateColumn Caption="fecha_alta" FieldName="fecha_alta" Name="fecha_alta" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14" PropertiesDateEdit-NullText="Fecha de alta..." PropertiesDateEdit-NullTextDisplayMode="UnfocusedAndFocused" ReadOnly="True">
                            <PropertiesDateEdit DisplayFormatString="dd/MMM/yy" DisplayFormatInEditMode="True" >
                                <ReadOnlyStyle BackColor="#999999" ForeColor="White">
                                </ReadOnlyStyle>
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
                        <dx:GridViewDataTextColumn Caption="Departamento" FieldName="departamento" Name="departamento" ShowInCustomizationForm="True" VisibleIndex="2" ReadOnly="True">
                            <PropertiesTextEdit>
                                <ReadOnlyStyle BackColor="#999999" ForeColor="White">
                                </ReadOnlyStyle>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Clasificación" FieldName="clasificacion" Name="clasificacion" ShowInCustomizationForm="True" VisibleIndex="3" ReadOnly="True">
                            <PropertiesTextEdit>
                                <ReadOnlyStyle BackColor="#999999" ForeColor="White">
                                </ReadOnlyStyle>
                            </PropertiesTextEdit>
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Familia" FieldName="familia" Name="familia" ShowInCustomizationForm="True" VisibleIndex="4" ReadOnly="True">
                            <PropertiesTextEdit>
                                <ReadOnlyStyle BackColor="#999999" ForeColor="White">
                                </ReadOnlyStyle>
                            </PropertiesTextEdit>
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

    <asp:SqlDataSource ID="SDS_Articulos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>"
DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulo&quot; = ? AND &quot;codigo_articulo&quot; = ?"
InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;descripcion&quot;, &quot;modelo&quot;, &quot;descripcion_larga&quot;, &quot;otra_informacion&quot;, &quot;cuidado_limpieza&quot;, &quot;fkey_departamento&quot;, &quot;fkey_clasificacion&quot;, &quot;fkey_familia&quot;, &quot;fkey_marca&quot;, &quot;codigo_articulo&quot;, &quot;fecha_alta&quot; ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>"
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
            <asp:SessionParameter Name ="fkey_departamento" SessionField="session_departamento" Type="Int64" />
            <asp:SessionParameter Name ="fkey_clasificacion" SessionField="session_clasificacion" Type="Int64" />
            <asp:SessionParameter Name ="fkey_familia" SessionField="session_familia" Type="Int64" />
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

    <asp:SqlDataSource ID="SDS_Departamentos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT &quot;key_departamento&quot;, &quot;departamento&quot; FROM &quot;Departamento&quot;"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_Familia" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT &quot;key_familia&quot;, &quot;familia&quot;, &quot;key_clasificacion&quot;, &quot;key_departamento&quot; FROM &quot;Familia&quot;"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_Marca" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT &quot;key_marca&quot;, &quot;marca&quot; FROM &quot;Articulos_marca&quot;"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_Clasificacion" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT &quot;key_clasificacion&quot;, &quot;clasificacion&quot;, &quot;fkey_departamento&quot; FROM  &quot;Clasificacion&quot;"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_Arbol" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>"
        SelectCommand="SELECT &quot;Familia&quot;.&quot;key_familia&quot;,&quot;Departamento&quot;.&quot;departamento&quot;, &quot;Clasificacion&quot;.&quot;clasificacion&quot;, &quot;Familia&quot;.&quot;familia&quot;, &quot;Familia&quot;.&quot;fkey_clasificacion&quot;, &quot;Familia&quot;.&quot;fkey_departamento&quot;
FROM &quot;Departamento&quot;, &quot;Clasificacion&quot;, &quot;Familia&quot;
WHERE &quot;Departamento&quot;.&quot;key_departamento&quot; = &quot;Clasificacion&quot;.&quot;fkey_departamento&quot; AND &quot;Clasificacion&quot;.&quot;key_clasificacion&quot; = &quot;Familia&quot;.&quot;fkey_clasificacion&quot;">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_ArticulosDeptos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;Articulos&quot;.&quot;fkey_departamento&quot;, &quot;Departamento&quot;.&quot;departamento&quot;
FROM &quot;Articulos&quot;, &quot;Departamento&quot;
WHERE &quot;Articulos&quot;.&quot;fkey_departamento&quot; = &quot;Departamento&quot;.&quot;key_departamento&quot;">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_ArticulosClas" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;Articulos&quot;.&quot;fkey_departamento&quot;, &quot;Articulos&quot;.&quot;fkey_clasificacion&quot;, &quot;Clasificacion&quot;.&quot;clasificacion&quot;, &quot;Departamento&quot;.&quot;departamento&quot;
FROM &quot;Articulos&quot;, &quot;Clasificacion&quot;, &quot;Departamento&quot;
WHERE &quot;Articulos&quot;.&quot;fkey_clasificacion&quot; = &quot;Clasificacion&quot;.&quot;key_clasificacion&quot;
AND &quot;Articulos&quot;.&quot;fkey_departamento&quot; = &quot;Departamento&quot;.&quot;key_departamento&quot;
AND &quot;Departamento&quot;.&quot;departamento&quot; = ?">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="departamento" SessionField="departamento_filter" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SDS_ArticulosFam" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>"
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

    <asp:SqlDataSource ID="SDS_DepClasFam" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand=
"SELECT &quot;Familia&quot;.&quot;key_familia&quot;,&quot;Departamento&quot;.&quot;departamento&quot;, &quot;Clasificacion&quot;.&quot;clasificacion&quot;, &quot;Familia&quot;.&quot;familia&quot;, &quot;Familia&quot;.&quot;fkey_clasificacion&quot;, &quot;Familia&quot;.&quot;fkey_departamento&quot;
FROM &quot;Departamento&quot;, &quot;Clasificacion&quot;, &quot;Familia&quot;
WHERE &quot;Departamento&quot;.&quot;key_departamento&quot; = &quot;Clasificacion&quot;.&quot;fkey_departamento&quot; AND &quot;Clasificacion&quot;.&quot;key_clasificacion&quot; = &quot;Familia&quot;.&quot;fkey_clasificacion&quot;
ORDER BY fkey_departamento,fkey_clasificacion,key_familia ASC"></asp:SqlDataSource>


    <asp:SqlDataSource ID="SDS_Articulos_Tallas" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" DeleteCommand="DELETE FROM &quot;Articulos_tallas&quot; WHERE key_tallas = ?" InsertCommand="INSERT INTO &quot;Articulos_tallas&quot; ( tallas, descrip, fkey_articulo, fkey_rango) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_tallas, tallas, descrip,fkey_articulo,fkey_rango FROM &quot;Articulos_tallas&quot; WHERE fkey_articulo = ? ORDER BY key_tallas" UpdateCommand="UPDATE &quot;Articulos_tallas&quot; SET tallas = ?, descrip = ?, fkey_articulo = ?, fkey_rango = ? WHERE key_tallas = ?">
        <DeleteParameters>
            <asp:Parameter Name="key_tallas" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="tallas" Type="String" />
            <asp:Parameter Name="descrip" Type="String" />
            <asp:Parameter Name="fkey_articulo" Type="Int64" />
            <asp:Parameter Name="fkey_rango" Type="Int64" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="?" SessionField="session_key_articulo" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="tallas" Type="String" />
            <asp:Parameter Name="descrip" Type="String" />
            <asp:Parameter Name="fkey_articulo" Type="Int64" />
            <asp:Parameter Name="fkey_rango" Type="Int64" />
            <asp:Parameter Name="key_tallas" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SDS_Articulos_Tallas_Rangos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_rango_talla, rango, imagen FROM &quot;Articulos_tallas_rangos&quot;">
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SDS_Articulos_Color" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" DeleteCommand="DELETE FROM &quot;Articulos_color&quot; WHERE key_color = ?" InsertCommand="INSERT INTO &quot;Articulos_color&quot; ( color, descrip, fkey_articulo, color_hex) VALUES ( ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_color, color, descrip,fkey_articulo, color_hex FROM &quot;Articulos_color&quot; WHERE fkey_articulo = ? order by key_color" UpdateCommand="UPDATE &quot;Articulos_color&quot; SET color = ?, descrip = ?, fkey_articulo = ?, color_hex = ? WHERE key_color = ?">
        <DeleteParameters>
            <asp:Parameter Name="key_color" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="color" Type="String" />
            <asp:Parameter Name="descrip" Type="String" />
            <asp:Parameter Name="fkey_articulo" Type="Int64" />
            <asp:Parameter Name="color_hex" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="?" SessionField="session_key_articulo" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="color" Type="String" />
            <asp:Parameter Name="descrip" Type="String" />
            <asp:Parameter Name="fkey_articulo" Type="Int64" />
            <asp:Parameter Name="color_hex" Type="String" />
            <asp:Parameter Name="key_color" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SDS_Articulos_Caracteristicas" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" DeleteCommand="DELETE FROM &quot;Articulos_caracteristicas&quot; WHERE key_articulos_caracteristicas = ?" InsertCommand="INSERT INTO &quot;Articulos_caracteristicas&quot; ( fkey_articulo, caracteristica, caracteristica_det) VALUES ( ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_articulos_caracteristicas, fkey_articulo, caracteristica, caracteristica_det FROM &quot;Articulos_caracteristicas&quot; WHERE fkey_articulo = ? order by key_articulos_caracteristicas" UpdateCommand="UPDATE &quot;Articulos_caracteristicas&quot; SET caracteristica = ?, caracteristica_det = ?  WHERE key_articulos_caracteristicas = ?">
        <DeleteParameters>
            <asp:Parameter Name="key_articulos_caracteristicas" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="fkey_articulo" Type="Int64" />
            <asp:Parameter Name="caracteristica" Type="String" />
            <asp:Parameter Name="caracteristica_det" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="fkey_articulo" SessionField="session_key_articulo"/>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="caracteristica" Type="String" />
            <asp:Parameter Name="caracteristica_det" Type="String" />
            <asp:Parameter Name="key_articulos_caracteristicas" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SDS_Caracteristicas" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_caracteristicas, caracteristica FROM &quot;Caracteristicas&quot; ORDER BY caracteristica">
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SDS_Caracteristicas_det" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_caracteristicas_det, fkey_caracteristicas, descripcion FROM &quot;Caracteristicas_det&quot;">
    </asp:SqlDataSource>


            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
</asp:Content>
