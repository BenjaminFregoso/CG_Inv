<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Nuevo_Arti_OPCION1.aspx.cs" Inherits="CG_InvWeb.Nuevo_Arti_OPCION1" %>


<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxTreeList.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTreeList" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Xpo.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Xpo" tagprefix="dx" %>


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
    <dx:ASPxRoundPanel ID="ASPxRoundPanelPrincipal" HorizontalAlign="Left" runat="server" HeaderText="Catálogo de artículos" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" Height="100%" AllowCollapsingByHeaderClick="True" HeaderNavigateUrl="~/Nuevo_Arti.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                
                <dx:ASPxGridView ID="ASPxGridView2" runat="server" KeyFieldName ="key_familia" AutoGenerateColumns="False" DataSourceID="SDS_Arbol" EnableTheming="True" Theme="Aqua" Width="100%">
                    <SettingsDetail ShowDetailRow="True" />
                    <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="True" HideDataCellsAtWindowInnerWidth="400">
                        <AdaptiveDetailLayoutProperties>
                            <Items>
                                <dx:GridViewColumnLayoutItem ColumnName="departamento">
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem ColumnName="clasificacion">
                                </dx:GridViewColumnLayoutItem>
                                <dx:GridViewColumnLayoutItem ColumnName="familia">
                                </dx:GridViewColumnLayoutItem>
                            </Items>
                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="400" />
                        </AdaptiveDetailLayoutProperties>
                    </SettingsAdaptivity>
                    <Templates>
                        <DetailRow>
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style3" DataSourceID="SDS_Articulos" EnableTheming="True" KeyFieldName="key_articulo" OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect" OnFocusedRowChanged="ASPxGridView1_FocusedRowChanged" Theme="Office2010Blue">
                                <Toolbars>
                                    <dx:GridViewToolbar>
                                        <Items>
                                            <dx:GridViewToolbarItem Command="New"  />
                                            <dx:GridViewToolbarItem Command="Edit" />
                                            <dx:GridViewToolbarItem Command="Delete" />
                                            <dx:GridViewToolbarItem Command="Update" />
                                            <dx:GridViewToolbarItem Command="Cancel" />
                                            <dx:GridViewToolbarItem Command="FullCollapse" />
                                            <dx:GridViewToolbarItem Command="FullExpand" />
                                            <dx:GridViewToolbarItem Command="ShowSearchPanel" />
                                            <dx:GridViewToolbarItem Command="ShowGroupPanel" />
                                            <dx:GridViewToolbarItem Command="Refresh"/>                                            
                                        </Items>
                                    </dx:GridViewToolbar>
                                </Toolbars>
                                <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
                                <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="400">
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
                                <SettingsEditing Mode="Inline">
                                </SettingsEditing>
                                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" ProcessFocusedRowChangedOnServer="True" />
                                <EditFormLayoutProperties>
                                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="400" />
                                </EditFormLayoutProperties>
                                <Columns>
                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Caption="key_articulo" FieldName="key_articulo" Name="key_articulo" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="descripcion" FieldName="descripcion" Name="descripcion" ShowInCustomizationForm="True" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="modelo" FieldName="modelo" Name="modelo" ShowInCustomizationForm="True" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="descripcion_larga" FieldName="descripcion_larga" Name="descripcion_larga" ShowInCustomizationForm="True" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="otra_informacion" FieldName="otra_informacion" Name="otra_informacion" ShowInCustomizationForm="True" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="cuidado_limpieza" FieldName="cuidado_limpieza" Name="cuidado_limpieza" ShowInCustomizationForm="True" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="fkey_departamento" FieldName="fkey_departamento" Name="fkey_departamento" ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="fkey_clasificacion" FieldName="fkey_clasificacion" Name="fkey_clasificacion" ShowInCustomizationForm="True" VisibleIndex="3" Visible="False">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="fkey_familia" FieldName="fkey_familia" Name="fkey_familia" ShowInCustomizationForm="True" VisibleIndex="4" Visible="False">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="codigo_articulo" FieldName="codigo_articulo" Name="codigo_articulo" ShowInCustomizationForm="True" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="fkey_marca" FieldName="fkey_marca" Name="fkey_marca" VisibleIndex="7">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                    <SettingsCommandButton>
                                        <NewButton>
                                            <Image ToolTip="Nuevo registro" Url="Images/nuevo.png" />
                                        </NewButton>
                                        <EditButton>
                                            <Image ToolTip="Modificar registro" Url="Images/edit.png" />
                                        </EditButton>
                                        <DeleteButton>
                                            <Image ToolTip="Borrar registro" Url="Images/eliminar.png"/>
                                        </DeleteButton>
                                        <UpdateButton ButtonType="Image">
                                            <Image ToolTip="Actualizar registro" Url="Images/guardar.png" />
                                        </UpdateButton>
                                        <CancelButton ButtonType="Image">
                                            <Image ToolTip="Deshacer cambios" Url="Images/cancel.png" />
                                        </CancelButton>
                                    </SettingsCommandButton>
                            </dx:ASPxGridView>
                            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView2">
                            </dx:ASPxGridViewExporter>
                        </DetailRow>
                    </Templates>
                    <SettingsPager Visible="False" Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings VerticalScrollableHeight="340" VerticalScrollBarMode="Visible" />
                    <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ProcessFocusedRowChangedOnServer="True" AllowFixedGroups="True" AutoExpandAllGroups="True" />
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                    <SettingsSearchPanel Visible="True" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="key_familia" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="departamento" GroupIndex="0" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Departamento">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="clasificacion" GroupIndex="1" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Clasificación">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="familia" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Familia">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <GroupSummary>
                        <dx:ASPxSummaryItem FieldName="familia" DisplayFormat="###" SummaryType="Count" />
                    </GroupSummary>
                </dx:ASPxGridView>
                
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <asp:SqlDataSource ID="SDS_Articulos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulo&quot; = ? AND &quot;codigo_articulo&quot; = ?" InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;key_articulo&quot;, &quot;descripcion&quot;, &quot;modelo&quot;, &quot;descripcion_larga&quot;, &quot;otra_informacion&quot;, &quot;cuidado_limpieza&quot;, &quot;fkey_departamento&quot;, &quot;fkey_clasificacion&quot;, &quot;fkey_familia&quot;, &quot;fkey_marca&quot;, &quot;codigo_articulo&quot;) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;key_articulo&quot;, &quot;descripcion&quot;, &quot;modelo&quot;, &quot;descripcion_larga&quot;, &quot;otra_informacion&quot;, &quot;cuidado_limpieza&quot;, &quot;fkey_departamento&quot;, &quot;fkey_clasificacion&quot;, &quot;fkey_familia&quot;, &quot;fkey_marca&quot;, &quot;codigo_articulo&quot; FROM &quot;Articulos&quot; WHERE (&quot;fkey_familia&quot; = ?)" UpdateCommand="UPDATE &quot;Articulos&quot; SET &quot;descripcion&quot; = ?, &quot;modelo&quot; = ?, &quot;descripcion_larga&quot; = ?, &quot;otra_informacion&quot; = ?, &quot;cuidado_limpieza&quot; = ?, &quot;fkey_departamento&quot; = ?, &quot;fkey_clasificacion&quot; = ?, &quot;fkey_familia&quot; = ?, &quot;fkey_marca&quot; = ? WHERE &quot;key_articulo&quot; = ? AND &quot;codigo_articulo&quot; = ?">
        <DeleteParameters>
            <asp:Parameter Name="key_articulo" Type="Int64" />
            <asp:Parameter Name="codigo_articulo" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="key_articulo" Type="Int64" />
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
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="fkey_familia" SessionField="fkey_familia" DefaultValue="11" />
        </SelectParameters>
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
            <asp:Parameter Name="key_articulo" Type="Int64" />
            <asp:Parameter Name="codigo_articulo" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_Departamentos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;key_departamento&quot;, &quot;departamento&quot; FROM &quot;Departamento&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_Familia" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;key_familia&quot;, &quot;familia&quot;, &quot;key_clasificacion&quot;, &quot;key_departamento&quot; FROM &quot;Familia&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_Marca" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;key_familia&quot;, &quot;familia&quot;, &quot;key_clasificacion&quot;, &quot;key_departamento&quot; FROM &quot;Familia&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_Clasificacion" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;key_clasificacion&quot;, &quot;clasificacion&quot;, &quot;key_departamento&quot; FROM &quot;Clasificacion&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_Arbol" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" SelectCommand="SELECT        &quot;Familia&quot;.&quot;key_familia&quot;,&quot;Departamento&quot;.&quot;departamento&quot;, &quot;Clasificacion&quot;.&quot;clasificacion&quot;, &quot;Familia&quot;.&quot;familia&quot;FROM &quot;Departamento&quot;, &quot;Clasificacion&quot;, &quot;Familia&quot; WHERE        &quot;Departamento&quot;.&quot;key_departamento&quot; = &quot;Clasificacion&quot;.&quot;key_departamento&quot; AND &quot;Clasificacion&quot;.&quot;key_clasificacion&quot; = &quot;Familia&quot;.&quot;key_clasificacion&quot;"></asp:SqlDataSource>
    <br />
</div>
</asp:Content>