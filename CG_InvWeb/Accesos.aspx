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
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSourceAccesos" KeyFieldName="key_accesos" OnInitNewRow="ASPxGridView1_InitNewRow" OnRowInserting="ASPxGridView1_RowInserting" OnCustomErrorText="ASPxGridView1_CustomErrorText" style="margin-left: 0px" Theme="Glass" Width="100%" Font-Names="Century Gothic">
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
                        <dx:GridViewDataTextColumn FieldName="key_accesos" ReadOnly="True" VisibleIndex="0" >
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="usuario" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="obras" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="compañias" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="periodos" ShowInCustomizationForm="True" VisibleIndex="4">
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
    <asp:SqlDataSource ID="SDSourceAccesos" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Accesos&quot; WHERE &quot;key_accesos&quot; = @key_accesos" InsertCommand="INSERT INTO &quot;Accesos&quot; (&quot;Usuario&quot;, &quot;Obras&quot;, &quot;Compañias&quot;, &quot;Periodos&quot;) VALUES (@Usuario, @Obras, @Compañias, @Periodos)" SelectCommand="SELECT * FROM &quot;Accesos&quot;" UpdateCommand="UPDATE &quot;Accesos&quot; SET &quot;Usuario&quot; = @Usuario, &quot;Obras&quot; = @Obras, &quot;Compañias&quot; = @Compañias, &quot;Periodos&quot; = @Periodos WHERE &quot;key_accesos&quot; = @key_accesos" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>">
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
