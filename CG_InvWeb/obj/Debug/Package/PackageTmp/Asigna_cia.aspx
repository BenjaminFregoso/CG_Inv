<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Asigna_cia.aspx.cs" Inherits="CG_InvWeb.Asigna_cia" %>


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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Catálogo de empresas" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" AllowCollapsingByHeaderClick="True" HeaderNavigateUrl="~/Asigna_cia.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSourceCias" KeyFieldName="key_empresa" OnCustomErrorText="ASPxGridView1_CustomErrorText" style="margin-left: 0px" Theme="Glass" Width="100%" Font-Names="Century Gothic">
                    <SettingsPager PageSize="25">
                    </SettingsPager>
                    <SettingsEditing Mode="Inline">
                    </SettingsEditing>
                    <Settings ShowFilterRow="True" />
                    <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true"  ConfirmDelete="True" />
                    <SettingsPopup>
                        <EditForm AllowResize="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </SettingsPopup>
                    <SettingsSearchPanel Visible="True" />
                    <EditFormLayoutProperties ColCount="2" RequiredMarkDisplayMode="Auto" ShowItemCaptionColon="False">
                        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" />
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonType="Image">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="key_empresa" ReadOnly="True" VisibleIndex="1" Visible="False">
                            <PropertiesTextEdit MaxLength="80">
                            </PropertiesTextEdit>
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="empresa" VisibleIndex="2" SortIndex="0" SortOrder="Ascending">
                            <PropertiesTextEdit MaxLength="80">
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
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <br />
    <asp:SqlDataSource ID="SDSourceCias" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" DeleteCommand="DELETE FROM &quot;Empresas&quot; WHERE key_empresa = ?" InsertCommand="INSERT INTO &quot;Empresas&quot; (empresa) VALUES (?)" SelectCommand="SELECT * FROM &quot;Empresas&quot;" UpdateCommand="UPDATE &quot;Empresas&quot; SET &quot;empresa&quot; = ? WHERE &quot;key_empresa&quot; = ?" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>">
        <DeleteParameters>
            <asp:Parameter Name="key_empresa" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="empresa" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="empresa" Type="String" />
            <asp:Parameter Name="key_empresa" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
</asp:Content>