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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Asignación de obras" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" AllowCollapsingByHeaderClick="True" HeaderNavigateUrl="~/Usuarios.aspx">
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
                                <asp:SqlDataSource ID="SDSourceUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Usuario] FROM [Usuarios]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <EditCellStyle Font-Names="Century Gothic">
                            </EditCellStyle>
                            <EditFormCaptionStyle Font-Names="Century Gothic">
                            </EditFormCaptionStyle>
                            <HeaderStyle Font-Names="Century Gothic" />
                            <CellStyle Font-Names="Century Gothic">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Obras" VisibleIndex="3">
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" DataSourceID="SDataSourceObras" Text='<%# Bind("Obras", "{0}") %>' TextField="Obras" Value='<%# Eval("Obras") %>' ValueField="Obras" Font-Names="Century Gothic" Theme="iOS">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="Obras" />
                                    </Columns>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SDataSourceObras" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Obras] FROM [Obras]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <EditCellStyle Font-Names="Century Gothic">
                            </EditCellStyle>
                            <EditFormCaptionStyle Font-Names="Century Gothic">
                            </EditFormCaptionStyle>
                            <HeaderStyle Font-Names="Century Gothic" />
                            <CellStyle Font-Names="Century Gothic">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Compañias" VisibleIndex="4">
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox3" runat="server" DataSourceID="SDSourceCias" Text='<%# Bind("Compañias", "{0}") %>' TextField="Compañia" ValueField="Compañia" Font-Names="Century Gothic" Theme="iOS">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="Compañia" />
                                    </Columns>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SDSourceCias" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Compañia] FROM [Compañias]"></asp:SqlDataSource>
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
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <asp:SqlDataSource ID="SDSourceAccesos" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Accesos] WHERE [index] = @index" InsertCommand="INSERT INTO [Accesos] ([Usuario], [Obras], [Compañias], [Periodos]) VALUES (@Usuario, @Obras, @Compañias, @Periodos)" SelectCommand="SELECT * FROM [Accesos]" UpdateCommand="UPDATE [Accesos] SET [Usuario] = @Usuario, [Obras] = @Obras, [Compañias] = @Compañias, [Periodos] = @Periodos WHERE [index] = @index">
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
