<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Usuarios.aspx.cs" Inherits="CG_InvWeb.Usuarios" %>


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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Catálogo de empleados" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" AllowCollapsingByHeaderClick="True" HeaderNavigateUrl="~/Usuarios.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSourceUsu" KeyFieldName="Usuario" OnCustomErrorText="ASPxGridView1_CustomErrorText3" style="margin-left: 0px" Theme="Glass" Width="100%" Font-Names="Open Sans">
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
                        <dx:GridViewCommandColumn ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="Index" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Usuario" ToolTip="Número de Seguro Social" ShowInCustomizationForm="True" VisibleIndex="2">
                            <EditFormSettings Caption="Usuario (NSS)" CaptionLocation="Top" /> 
                            <PropertiesTextEdit MaxLength="11">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Contraseña" ShowInCustomizationForm="True" VisibleIndex="3">
                            <PropertiesTextEdit MaxLength="20" Password="True">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Usuario_Largo" ShowInCustomizationForm="True" VisibleIndex="4">
                            <EditFormSettings Caption="Nombre completo" CaptionLocation="Top" />
                            <PropertiesTextEdit MaxLength="80" >
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Perfil" ShowInCustomizationForm="True" SortIndex="1" SortOrder="Ascending" VisibleIndex="5" Caption="Perfil">
                            <EditFormSettings Caption="Perfil" CaptionLocation="Top" />
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SDataSourcePerfiles" Text='<%# Bind("Perfil", "{0}") %>' TextField="Perfil" ValueField="Perfil" Font-Names="Open Sans" Theme="Glass">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="Perfil" />
                                    </Columns>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SDataSourcePerfiles" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Perfil] FROM [Perfil]"></asp:SqlDataSource>
                            </EditItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Compañia" ShowInCustomizationForm="True" VisibleIndex="6">
                            <EditFormSettings Caption="Compañía" CaptionLocation="Top" />
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" DataSourceID="SqlDataSourceCompañia" Text='<%# Bind("Compañia", "{0}") %>'  TextField="Compañia" ValueField="Compañia" Font-Names="Open Sans" Theme="Glass">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="Compañia" />
                                    </Columns>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SqlDataSourceCompañia" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Compañia] FROM [Compañias]"></asp:SqlDataSource>
                            </EditItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="nss" ShowInCustomizationForm="True" VisibleIndex="7" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ap_pat" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ap_mat" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="nombre" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="nombre_completo" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="status" ShowInCustomizationForm="True" VisibleIndex="16">
                            <EditFormSettings Caption="Estatus" CaptionLocation="Top" />
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox3" runat="server" DataSourceID="SqlDataSourceStatus" Text='<%# Bind("status", "{0}") %>' TextField="status" ValueField="status" Font-Names="Open Sans" Theme="Glass">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="status" />
                                    </Columns>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SqlDataSourceStatus" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [status] FROM [Status]"></asp:SqlDataSource>
                            </EditItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_nacimiento" ShowInCustomizationForm="True" VisibleIndex="13">
                            <EditFormSettings Caption="Fecha de nacimiento" CaptionLocation="Top" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="email" ShowInCustomizationForm="True" VisibleIndex="12">
                            <EditFormSettings Caption="Correo electrónico" CaptionLocation="Top" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="curp" ShowInCustomizationForm="True" VisibleIndex="14">
                            <EditFormSettings Caption="CURP Clave Única de Registro de Población" CaptionLocation="Top" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_baja" ShowInCustomizationForm="True" VisibleIndex="17">
                            <EditFormSettings Caption="Fecha de baja" CaptionLocation="Top" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="tipo_nomina" ShowInCustomizationForm="True" VisibleIndex="15">
                            <EditFormSettings Caption="Tipo de Nómina" CaptionLocation="Top" />
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox4" runat="server" DataSourceID="SDataSourceTipoNomina" Text='<%# Bind("Tipo_Nomina", "{0}") %>' TextField="Tipo_Nomina" ValueField="Tipo_Nomina" Font-Names="Open Sans" Theme="Glass">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="Tipo_Nomina" />
                                    </Columns>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SDataSourceTipoNomina" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Tipo_Nomina] FROM [TipoNomina]"></asp:SqlDataSource>
                            </EditItemTemplate>
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
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <br />
    <asp:SqlDataSource ID="SDSourceUsu" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [Index] = @Index" InsertCommand="INSERT INTO Usuarios(Usuario, Contraseña, Usuario_Largo, Perfil, Compañia, status, fecha_nacimiento, email, curp, fecha_baja, tipo_nomina) VALUES (@Usuario, @Contraseña, @Usuario_Largo, @Perfil, @Compañia, @status, @fecha_nacimiento, @email, @curp, @fecha_baja, @tipo_nomina)" SelectCommand="SELECT * FROM [Usuarios]" UpdateCommand="UPDATE Usuarios SET Usuario = @Usuario, Contraseña = @Contraseña, Usuario_Largo = @Usuario_Largo, Perfil = @Perfil, Compañia = @Compañia, status = @status, fecha_nacimiento = @fecha_nacimiento, email = @email, curp = @curp, fecha_baja = @fecha_baja, tipo_nomina = @tipo_nomina WHERE ([Index] = @Index )">
        <DeleteParameters>
            <asp:Parameter Name="Index" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Usuario" Type="String" />
            <asp:Parameter Name="Contraseña" Type="String" />
            <asp:Parameter Name="Usuario_Largo" Type="String" />
            <asp:Parameter Name="Perfil" Type="String" />
            <asp:Parameter Name="Compañia" />
            <asp:Parameter Name="status" />
            <asp:Parameter Name="fecha_nacimiento" />
            <asp:Parameter Name="email" />
            <asp:Parameter Name="curp" />
            <asp:Parameter Name="fecha_baja" />
            <asp:Parameter Name="tipo_nomina" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Usuario" Type="String" />
            <asp:Parameter Name="Contraseña" Type="String" />
            <asp:Parameter Name="Usuario_Largo" Type="String" />
            <asp:Parameter Name="Perfil" Type="String" />
            <asp:Parameter Name="Compañia" />
            <asp:Parameter Name="status" />
            <asp:Parameter Name="fecha_nacimiento" />
            <asp:Parameter Name="email" />
            <asp:Parameter Name="curp" />
            <asp:Parameter Name="fecha_baja" />
            <asp:Parameter Name="tipo_nomina" />
            <asp:Parameter Name="Index" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
<br />
<br />
<br />
<br />
</div>
</asp:Content>