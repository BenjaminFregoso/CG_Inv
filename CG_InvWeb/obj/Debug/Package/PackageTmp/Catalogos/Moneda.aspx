<%@ Page Title="Régimen Fiscal" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Moneda.aspx.cs" Inherits="CG_InvWeb.Catalogos.Moneda" %>

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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Moneda" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Catalogos/Moneda.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">                
                <dx:ASPxGridView  ID="ASPxGridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="key_moneda" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" >
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
                            <dx:GridViewColumnLayoutItem ColumnName="moneda">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EmptyLayoutItem>
                            </dx:EmptyLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="descrip">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="fecha_ini">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="fecha_fin">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="key_moneda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="moneda"  ShowInCustomizationForm="True" VisibleIndex="2" Caption="Código">
                            <PropertiesTextEdit MaxLength="3" HelpText="Solo acepta letras" NullText="AAA">
                                <MaskSettings Mask="LLL" />
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="descrip" Width="250px" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Moneda">
                            <PropertiesTextEdit MaxLength="100">                                
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_ini" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Fecha inicial">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_fin" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Fecha final">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True">
                        </dx:GridViewCommandColumn>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" DeleteCommand="DELETE FROM &quot;c_Moneda&quot; WHERE &quot;key_moneda&quot; = ?" InsertCommand="INSERT INTO &quot;c_Moneda&quot; (&quot;moneda&quot;, &quot;descrip&quot;, &quot;fecha_ini&quot;, &quot;fecha_fin&quot;) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT &quot;key_moneda&quot;, &quot;moneda&quot;, &quot;descrip&quot;,&quot;fecha_ini&quot;,&quot;fecha_fin&quot;  FROM &quot;c_Moneda&quot; ORDER BY &quot;moneda&quot;" UpdateCommand="UPDATE &quot;c_Moneda&quot; SET &quot;moneda&quot; = ?, &quot;descrip&quot; = ?, &quot;fecha_ini&quot; = ?, &quot;fecha_fin&quot; = ? WHERE &quot;key_moneda&quot; = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_moneda" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="moneda" Type="String" />
                        <asp:Parameter Name="descrip" Type="String" />
                        <asp:Parameter Name="fecha_ini" Type="DateTime" />
                        <asp:Parameter Name="fecha_fin" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="moneda" Type="String" />
                        <asp:Parameter Name="descrip" Type="String" />
                        <asp:Parameter Name="fecha_ini" Type="DateTime" />
                        <asp:Parameter Name="fecha_fin" Type="DateTime" />
                        <asp:Parameter Name="key_moneda" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
</asp:Content>

