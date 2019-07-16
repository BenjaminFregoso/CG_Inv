<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Accesos.aspx.cs" Inherits="CG_InvWeb.Accesos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Asignación de obras" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Usuarios.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSourceAccesos" KeyFieldName="index" OnInitNewRow="ASPxGridView1_InitNewRow" OnRowInserting="ASPxGridView1_RowInserting" OnCustomErrorText="ASPxGridView1_CustomErrorText" style="margin-left: 0px" Theme="Glass" Width="100%" Font-Names="Century Gothic">
                    <ClientSideEvents RowDblClick="function(s, e) {
                        s.StartEditRow(e.visibleIndex);
                    }" />
                    <SettingsPager PageSize="25">
                    </SettingsPager>
                    <SettingsEditing Mode="PopupEditForm">
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
                        <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonType="Image">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="index" ReadOnly="True" VisibleIndex="1" Visible="False" >
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="2">
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SDSourceUsuarios" Text='<%# Bind("Usuario", "{0}") %>' TextField="Usuario" ValueField="Usuario" Font-Names="Century Gothic" Theme="iOS">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="Usuario" />
                                    </Columns>
                                </dx:ASPxComboBox>
                                
                                <asp:SqlDataSource ID="SDSourceUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" SelectCommand="SELECT &quot;usuario&quot; FROM &quot;Usuarios&quot;" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <EditCellStyle Font-Names="Century Gothic">
                            </EditCellStyle>
                            <EditFormCaptionStyle Font-Names="Century Gothic">
                            </EditFormCaptionStyle>
                            <HeaderStyle Font-Names="Century Gothic" />
                            <CellStyle Font-Names="Century Gothic">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Empresa" VisibleIndex="4">
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox3" runat="server" DataSourceID="SDSourceCias" Text='<%# Bind("Compañias", "{0}") %>' TextField="Compañia" ValueField="Compañia" Font-Names="Century Gothic" Theme="iOS">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="Compañia" />
                                    </Columns>
                                </dx:ASPxComboBox>

                                <asp:SqlDataSource ID="SDSourceCias" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" SelectCommand="SELECT &quot;empresa&quot; FROM &quot;Empresas&quot;" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <EditCellStyle Font-Names="Century Gothic">
                            </EditCellStyle>
                            <EditFormCaptionStyle Font-Names="Century Gothic">
                            </EditFormCaptionStyle>
                            <HeaderStyle Font-Names="Century Gothic" />
                            <CellStyle Font-Names="Century Gothic">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn FieldName="Periodos" VisibleIndex="5">
                            <PropertiesCheckEdit ValueChecked="">
                            </PropertiesCheckEdit>
                            <EditCellStyle Font-Names="Century Gothic">
                            </EditCellStyle>
                            <EditFormCaptionStyle Font-Names="Century Gothic">
                            </EditFormCaptionStyle>
                            <HeaderStyle Font-Names="Century Gothic" />
                            <CellStyle Font-Names="Century Gothic">
                            </CellStyle>
                        </dx:GridViewDataCheckColumn>
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
    <asp:SqlDataSource ID="SDSourceAccesos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" DeleteCommand="DELETE FROM &quot;Accesos&quot; WHERE &quot;key_accesos&quot; = @key_accesos" InsertCommand="INSERT INTO &quot;Accesos&quot; (&quot;Usuario&quot;, &quot;Empresa&quot;, &quot;Periodos&quot;) VALUES (@Usuario, @Empresa, @Periodos)" SelectCommand="SELECT &quot;key_accesos&quot;, &quot;empresa&quot;, &quot;usuario&quot;, &quot;obras&quot;, &quot;periodos&quot; FROM &quot;Accesos&quot;" UpdateCommand="UPDATE &quot;Accesos&quot; SET &quot;usuario&quot; = @Usuario, &quot;empresa&quot; = @Empresa, &quot;periodos&quot; = @Periodos WHERE &quot;key_accesos&quot; = @key_accesos" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>">
        <DeleteParameters>
            <asp:Parameter Name="index" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Usuario" Type="String" />
            <asp:Parameter Name="Obras" Type="String" />
            <asp:Parameter Name="Compañias" Type="String" />
            <asp:Parameter Name="Periodos" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Usuario" Type="String" />
            <asp:Parameter Name="Obras" Type="String" />
            <asp:Parameter Name="Compañias" Type="String" />
            <asp:Parameter Name="Periodos" Type="Boolean" />
            <asp:Parameter Name="index" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
</asp:Content>
