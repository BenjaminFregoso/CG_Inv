<%@ Page Title="Régimen Fiscal" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ClaveProductoServicios.aspx.cs" Inherits="CG_InvWeb.Catalogos.ClaveProductoServicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
<div class="Principal">          
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Clave de Productos y Servicios" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Catalogos/ClaveProductoServicios.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">                
                <dx:ASPxGridView  ID="ASPxGridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="key_claveprodserv" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" OnRowDeleted="ASPxGridView1_RowDeleted" OnRowInserted="ASPxGridView1_RowInserted" OnRowUpdated="ASPxGridView1_RowUpdated" >
                    <ClientSideEvents RowDblClick="function(s, e) {
                        s.StartEditRow(e.visibleIndex);
                    }" />
                    <SettingsEditing Mode="PopupEditForm" >
                    </SettingsEditing>
                    <Settings ShowFilterRow="True" VerticalScrollableHeight="350" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Visible"  />
                    <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="True" />
                    <SettingsSearchPanel Visible="True" />
                    <SettingsPopup>
                        <EditForm AllowResize="True" ShowHeader="true" CloseOnEscape="True" Modal="true" HorizontalAlign="Center" VerticalAlign="Middle"  />
                    </SettingsPopup>
                    <EditFormLayoutProperties ColCount="2">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColumnName="claveprodserv">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EmptyLayoutItem>
                            </dx:EmptyLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="descrip">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="palabras_similares">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="fecha_ini">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EmptyLayoutItem>
                            </dx:EmptyLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="fecha_fin">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonType="Image">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="key_claveprodserv" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="claveprodserv" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Código">
                            <PropertiesTextEdit MaxLength="8" HelpText="8 dígitos numéricos" NullText="00000000">
                                <MaskSettings Mask="00000000" />
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="descrip" Width="250px"  ShowInCustomizationForm="True" VisibleIndex="3" Caption="Producto y/o Servicio">
                            <PropertiesTextEdit MaxLength="100">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataDateColumn FieldName="fecha_ini" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Fecha inicial">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_fin" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Fecha final">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataMemoColumn Caption="Similares" FieldName="palabras_similares" ShowInCustomizationForm="True" VisibleIndex="4" Width="250px">
                            <PropertiesMemoEdit MaxLength="200" Rows="5">
                                <ValidationSettings SetFocusOnError="True">
                                </ValidationSettings>
                            </PropertiesMemoEdit>
                        </dx:GridViewDataMemoColumn>
                    </Columns>
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

                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" DeleteCommand="DELETE FROM &quot;c_ClaveProdServ&quot; WHERE &quot;key_claveprodserv&quot; = ?" InsertCommand="INSERT INTO &quot;c_ClaveProdServ&quot; (&quot;claveprodserv&quot;, &quot;descrip&quot;,&quot;palabras_similares&quot; ,&quot;fecha_ini&quot;, &quot;fecha_fin&quot;) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT &quot;key_claveprodserv&quot;, &quot;claveprodserv&quot;, &quot;descrip&quot;, &quot;palabras_similares&quot;,&quot;fecha_ini&quot;,&quot;fecha_fin&quot;  FROM &quot;c_ClaveProdServ&quot; ORDER BY &quot;claveprodserv&quot;" UpdateCommand="UPDATE &quot;c_ClaveProdServ&quot; SET &quot;claveprodserv&quot; = ?, &quot;descrip&quot; = ?, &quot;palabras_similares&quot; = ?, &quot;fecha_ini&quot; = ?, &quot;fecha_fin&quot; = ? WHERE &quot;key_claveprodserv&quot; = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_claveprodserv" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="claveprodserv" Type="String" />
                        <asp:Parameter Name="descrip" Type="String" />
                        <asp:Parameter Name="palabras_similares" Type="String" />
                        <asp:Parameter Name="fecha_ini" Type="DateTime" />
                        <asp:Parameter Name="fecha_fin" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="claveprodserv" Type="String" />
                        <asp:Parameter Name="descrip" Type="String" />
                        <asp:Parameter Name="palabras_similares" Type="String" />
                        <asp:Parameter Name="fecha_ini" Type="DateTime" />
                        <asp:Parameter Name="fecha_fin" Type="DateTime" />
                        <asp:Parameter Name="key_claveprodserv" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
</asp:Content>

