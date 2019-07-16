<%@ Page Title="Régimen Fiscal" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Departamento.aspx.cs" Inherits="CG_InvWeb.Articulos.Departamento" %>

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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Almacenes" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Catalogos/Almacen.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">                
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="key_departamento" Theme="Glass" Width="100%">
                    <SettingsPager Mode="EndlessPaging">
                    </SettingsPager>
                    <SettingsEditing Mode="Inline">
                    </SettingsEditing>
                    <SettingsBehavior ConfirmDelete="True" />
                    <SettingsPopup>
                        <EditForm CloseOnEscape="True" Modal="True" HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter">
                        </EditForm>
                    </SettingsPopup>
                    <SettingsSearchPanel Visible="True" />
                    <EditFormLayoutProperties ColCount="2" ColumnCount="2">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="departamento">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="2" ColumnSpan="2" HorizontalAlign="Right">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="10%">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="key_departamento" ShowInCustomizationForm="True" VisibleIndex="1" Width="10%" ReadOnly="True">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="departamento" ShowInCustomizationForm="True" VisibleIndex="2" Width="80%">
                            <PropertiesTextEdit>
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" DeleteCommand="DELETE FROM &quot;Departamento&quot; WHERE key_departamento = ?" InsertCommand="INSERT INTO &quot;Departamento&quot; (departamento) VALUES ( ?)" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>" SelectCommand="SELECT key_departamento, departamento FROM &quot;Departamento&quot;" UpdateCommand="UPDATE &quot;Departamento&quot; SET departamento = ? WHERE key_departamento = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_departamento" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="departamento" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="departamento" Type="String" />
                        <asp:Parameter Name="key_departamento" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
</asp:Content>

