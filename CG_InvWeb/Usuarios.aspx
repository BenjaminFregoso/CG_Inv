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
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSourceUsu" KeyFieldName="key_usuario" OnCustomErrorText="ASPxGridView1_CustomErrorText3" style="margin-left: 0px" Theme="Glass" Width="100%" Font-Names="Open Sans">
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
                        <dx:GridViewDataTextColumn FieldName="key_usuario" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="usuario" ShowInCustomizationForm="True" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="contrasena" ShowInCustomizationForm="True" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="perfil" ShowInCustomizationForm="True" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="empresa" ShowInCustomizationForm="True" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="nombre" ShowInCustomizationForm="True" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_baja" ShowInCustomizationForm="True" VisibleIndex="7">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_alta" ShowInCustomizationForm="True" VisibleIndex="8">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowCancelButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
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
    <asp:SqlDataSource ID="SDSourceUsu" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Usuarios&quot; WHERE &quot;key_usuario&quot; = @key_usuario" InsertCommand="INSERT INTO &quot;Usuarios&quot;(&quot;Usuario&quot;, &quot;Contrasena&quot;, &quot;Perfil&quot;, &quot;Empresa&quot;, &quot;fecha_alta&quot;, &quot;fecha_baja&quot;, &quot;nombre&quot;) VALUES (@Usuario, @Contrasena, @Perfil, @Empresa, @fecha_alta, @fecha_baja, @nombre)" SelectCommand="SELECT * FROM &quot;Usuarios&quot;" UpdateCommand="UPDATE &quot;Usuarios&quot; SET &quot;Usuario&quot; = @Usuario, &quot;Contrasena&quot; = @Contrasena, &quot;Perfil&quot; = @Perfil, &quot;Empresa&quot; = @Empresa, &quot;fecha_alta&quot; = @fecha_alta, &quot;fecha_baja&quot; = @fecha_baja, &quot;nombre&quot; @nombre WHERE (&quot;key_usuario&quot; = @key_usuario )" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>">
        <DeleteParameters>
            <asp:Parameter Name="key_usuario" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="usuario" Type="String" />
            <asp:Parameter Name="contrasena" Type="String" />
            <asp:Parameter Name="perfil" Type="String" />
            <asp:Parameter Name="empresa" Type="String" />
            <asp:Parameter Name="nombre" />
            <asp:Parameter Name="fecha_baja" />
            <asp:Parameter Name="fecha_alta" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="usuario" Type="String" />
            <asp:Parameter Name="contrasena" Type="String" />
            <asp:Parameter Name="perfil" Type="String" />
            <asp:Parameter Name="empresa" Type="String" />
            <asp:Parameter Name="nombre" />
            <asp:Parameter Name="fecha_baja" />
            <asp:Parameter Name="fecha_alta" />
            <asp:Parameter Name="key_usuario" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>
<br />
<br />
<br />
<br />
</div>
</asp:Content>