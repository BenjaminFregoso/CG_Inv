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
                        <dx:GridViewDataTextColumn FieldName="usuario" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Usuario">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="contrasena" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Contraseña">
                            <PropertiesTextEdit MaxLength="20" Password="True">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="perfil" ShowInCustomizationForm="True" SortIndex="1" SortOrder="Ascending" VisibleIndex="3" Caption="Perfil">
                            <EditFormSettings Caption="Perfil" CaptionLocation="Top" />
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SDataSourcePerfiles" Text='<%# Bind("Perfil", "{0}") %>' TextField="Perfil" ValueField="Perfil" Font-Names="Open Sans" Theme="Glass">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="Perfil" />
                                    </Columns>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SDataSourcePerfiles" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" SelectCommand="SELECT &quot;perfil&quot; FROM &quot;Perfil&quot;" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>"></asp:SqlDataSource>
                            </EditItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="empresa" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Empresa">
                            <EditFormSettings Caption="Compañía" CaptionLocation="Top" />
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" DataSourceID="SqlDataSourceCompañia" Text='<%# Bind("Compañia", "{0}") %>'  TextField="Compañia" ValueField="Compañia" Font-Names="Open Sans" Theme="Glass">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="Compañia" />
                                    </Columns>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SqlDataSourceCompañia" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" SelectCommand="SELECT &quot;empresa&quot; FROM &quot;Empresas&quot;" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>"></asp:SqlDataSource>
                            </EditItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Fecha baja" FieldName="fecha_baja" ShowInCustomizationForm="True" VisibleIndex="16">
                            <EditFormSettings Caption="Fecha de baja" CaptionLocation="Top" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_alta" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Fecha alta">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="nombre" ShowInCustomizationForm="True" VisibleIndex="17" Caption="Nombre">
                            <PropertiesTextEdit MaxLength="11">
                            </PropertiesTextEdit>
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
    <asp:SqlDataSource ID="SDSourceUsu" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" DeleteCommand="DELETE FROM &quot;Usuarios&quot; WHERE &quot;key_usuario&quot; = @key_usuario" InsertCommand="INSERT INTO Usuarios(usuario, contrasena, perfil, empresa, fecha_baja, fecha_alta, nombre) VALUES (@usuario, @fontrasena, @ferfil, @fmpresa, @fecha_baja, @fecha_alta, @uombre)" SelectCommand="SELECT * FROM &quot;Usuarios&quot;" UpdateCommand="UPDATE Usuarios SET usuario = @usuario, contrasena = @contrasena, perfil = @perfil, empresa= @empresa, fecha_baja = @fecha_baja, fecha_alta = @fecha_alta, nombre = @nombre WHERE (&quot;key_usuario&quot; = @key_usuario )" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>">
        <DeleteParameters>
            <asp:Parameter Name="Index" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="usuario" Type="String" />
            <asp:Parameter Name="uontraseña" Type="String" />
            <asp:Parameter Name="perfil" Type="String" />
            <asp:Parameter Name="empresa" />
            <asp:Parameter Name="fecha_baja" />
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