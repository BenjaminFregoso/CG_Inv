<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Perfiles.aspx.cs" Inherits="CG_InvWeb.Perfiles" %>


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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Cat�logo de perfiles" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" AllowCollapsingByHeaderClick="True" HeaderNavigateUrl="~/Perfiles.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSourcePerfil" KeyFieldName="key_perfil" OnCustomErrorText="ASPxGridView1_CustomErrorText" style="margin-left: 0px" Theme="Glass" Width="100%" Font-Names="Century Gothic">
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
                    <dx:GridViewDataTextColumn FieldName="key_perfil" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="perfil" ShowInCustomizationForm="True"  VisibleIndex="1">
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
    <asp:SqlDataSource ID="SDSourcePerfil" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Perfil&quot; WHERE &quot;key_perfil&quot; = @key_perfil" InsertCommand="INSERT INTO &quot;Perfil&quot; (&quot;Perfil&quot;) VALUES (@Perfil)" SelectCommand="SELECT * FROM &quot;Perfil&quot;" UpdateCommand="UPDATE &quot;Perfil&quot; SET &quot;Perfil&quot; = @Perfil WHERE &quot;key_perfil&quot; = @key_perfil" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>">
    <DeleteParameters>
        <asp:Parameter Name="Index" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Perfil" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Perfil" Type="String" />
        <asp:Parameter Name="Index" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</div>
</asp:Content>