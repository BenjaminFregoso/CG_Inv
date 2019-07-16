<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Periodos.aspx.cs" Inherits="CG_InvWeb.Periodos" %>

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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Catálogo de periodos" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" AllowCollapsingByHeaderClick="True" HeaderNavigateUrl="~/Periodos.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSourcePeriodos" KeyFieldName="index" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" style="margin-left: 0px" Theme="iOS" Width="100%" Font-Names="Century Gothic">
                    <SettingsPager PageSize="25">
                    </SettingsPager>
                    <SettingsEditing Mode="PopupEditForm">
                    </SettingsEditing>
                    <Settings ShowFilterRow="True" />
                    <SettingsBehavior ConfirmDelete="True" />
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
                        <dx:GridViewDataTextColumn FieldName="index" ReadOnly="True" ShowInCustomizationForm="True"  VisibleIndex="1" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="2" UnboundType="DateTime">
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" Text='<%# Bind("Mes", "{0}") %>' TextField='<%# Eval("Mes", "{0}") %>' Font-Names="Century Gothic" Theme="iOS">
                                    <Items>
                                        <dx:ListEditItem Text="Enero" Value="0" />
                                        <dx:ListEditItem Text="Febrero" Value="1" />
                                        <dx:ListEditItem Text="Marzo" Value="2" />
                                        <dx:ListEditItem Text="Abril" Value="3" />
                                        <dx:ListEditItem Text="Mayo" Value="4" />
                                        <dx:ListEditItem Text="Junio" Value="5" />
                                        <dx:ListEditItem Text="Julio" Value="6" />
                                        <dx:ListEditItem Text="Agosto" Value="7" />
                                        <dx:ListEditItem Text="Septiembre" Value="8" />
                                        <dx:ListEditItem Text="Octubre" Value="9" />
                                        <dx:ListEditItem Text="Noviembre" Value="10" />
                                        <dx:ListEditItem Text="Diciembre" Value="11" />
                                    </Items>

                                </dx:ASPxComboBox>
                            </EditItemTemplate>
                            <EditCellStyle Font-Names="Century Gothic">
                            </EditCellStyle>
                            <EditFormCaptionStyle Font-Names="Century Gothic">
                            </EditFormCaptionStyle>
                            <HeaderStyle Font-Names="Century Gothic" />
                            <CellStyle Font-Names="Century Gothic">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="3" SortIndex="0" SortOrder="Ascending">
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" DataSourceID="SqlDataSourceAño" Text='<%# Bind("Año") %>' TextField="Año" Value='<%# Bind("Año") %>' ValueField="Año" Font-Names="Century Gothic" Theme="iOS">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SqlDataSourceAño" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Año] FROM [Años]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <EditCellStyle Font-Names="Century Gothic">
                            </EditCellStyle>
                            <EditFormCaptionStyle Font-Names="Century Gothic">
                            </EditFormCaptionStyle>
                            <HeaderStyle Font-Names="Century Gothic" />
                            <CellStyle Font-Names="Century Gothic">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn FieldName="Status" VisibleIndex="4" Caption="Cerrado">
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
    <br />

    <asp:SqlDataSource ID="SDSourcePeriodos" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Periodos] WHERE [index] = @index" InsertCommand="INSERT INTO [Periodos] ([Mes], [Año], [Status]) VALUES (@Mes, @Año, @Status)" SelectCommand="SELECT * FROM [Periodos]" UpdateCommand="UPDATE [Periodos] SET [Mes] = @Mes, [Año] = @Año, [Status] = @Status WHERE [index] = @index" >
        <DeleteParameters>
            <asp:Parameter Name="index" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Mes" Type="String" />
            <asp:Parameter Name="Año" Type="String" />
            <asp:Parameter Name="Status" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Mes" Type="String" />
            <asp:Parameter Name="Año" Type="String" />
            <asp:Parameter Name="Status" Type="Boolean" />
            <asp:Parameter Name="index" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
</asp:Content>
