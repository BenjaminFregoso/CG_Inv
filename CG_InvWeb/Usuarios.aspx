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
                        <dx:GridViewDataTextColumn FieldName="key_usuario" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="usuario" ShowInCustomizationForm="True" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="contraseña" ShowInCustomizationForm="True" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="usuario_largo" ShowInCustomizationForm="True" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="perfil" ShowInCustomizationForm="True" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="compañia" ShowInCustomizationForm="True" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="nss" ShowInCustomizationForm="True" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ap_pat" ShowInCustomizationForm="True" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ap_mat" ShowInCustomizationForm="True" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="nombre" ShowInCustomizationForm="True" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="nombre_completo" ShowInCustomizationForm="True" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="status" ShowInCustomizationForm="True" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_nacimiento" ShowInCustomizationForm="True" VisibleIndex="12">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="email" ShowInCustomizationForm="True" VisibleIndex="13">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="curp" ShowInCustomizationForm="True" VisibleIndex="14">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_baja" ShowInCustomizationForm="True" VisibleIndex="15">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="tipo_nomina" ShowInCustomizationForm="True" VisibleIndex="16">
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
    <asp:SqlDataSource ID="SDSourceUsu" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Usuarios&quot; WHERE &quot;key_usuario&quot; = @key_usuario" InsertCommand="INSERT INTO &quot;Usuarios&quot;(&quot;Usuario&quot;, &quot;Contraseña&quot;, &quot;Usuario_Largo&quot;, &quot;Perfil&quot;, &quot;Compañia&quot;, &quot;status&quot;, &quot;fecha_nacimiento&quot;, &quot;email&quot;, &quot;curp&quot;, &quot;fecha_baja&quot;, &quot;tipo_nomina&quot;) VALUES (@Usuario, @Contraseña, @Usuario_Largo, @Perfil, @Compañia, @status, @fecha_nacimiento, @email, @curp, @fecha_baja, @tipo_nomina)" SelectCommand="SELECT * FROM &quot;Usuarios&quot;" UpdateCommand="UPDATE &quot;Usuarios&quot; SET &quot;Usuario&quot; = @Usuario, &quot;Contraseña&quot; = @Contraseña, &quot;Usuario_Largo&quot; = @Usuario_Largo, &quot;Perfil&quot; = @Perfil, &quot;Compañia&quot; = @Compañia, &quot;status&quot; = @status, &quot;fecha_nacimiento&quot; = @fecha_nacimiento, &quot;email&quot; = @email, &quot;curp&quot; = @curp, &quot;fecha_baja&quot; = @fecha_baja, &quot;tipo_nomina&quot; = @tipo_nomina WHERE (&quot;key_usuario&quot; = @key_usuario )" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>">
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