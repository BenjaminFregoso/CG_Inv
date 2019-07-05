<%@ Page Title="Casa Guerrero" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="CG_InvWeb.Articulos" %>

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
                
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Articulos" KeyFieldName="key_articulo" Theme="MaterialCompact">
                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="key_articulo" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="descripcion" ShowInCustomizationForm="True" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="modelo" ShowInCustomizationForm="True" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="descripcion_larga" ShowInCustomizationForm="True" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="otra_informacion" ShowInCustomizationForm="True" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="cuidado_limpieza" ShowInCustomizationForm="True" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="fkey_departamento" ShowInCustomizationForm="True" VisibleIndex="7">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="fkey_clasificacion" ShowInCustomizationForm="True" VisibleIndex="8">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="fkey_familia" ShowInCustomizationForm="True" VisibleIndex="9">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="fkey_marca" ShowInCustomizationForm="True" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="codigo_articulo" ShowInCustomizationForm="True" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_alta" ShowInCustomizationForm="True" VisibleIndex="12">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="usuario_alta" ShowInCustomizationForm="True" VisibleIndex="13">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="fkey_lista_precio" ShowInCustomizationForm="True" VisibleIndex="14">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>

<asp:SqlDataSource ID="SDS_Articulos" runat="server" ConnectionString="<%$ ConnectionStrings:ServerLinuxConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulo&quot; = ? AND &quot;codigo_articulo&quot; = ?" InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;descripcion&quot;, &quot;modelo&quot;, &quot;descripcion_larga&quot;, &quot;otra_informacion&quot;, &quot;cuidado_limpieza&quot;, &quot;fkey_departamento&quot;, &quot;fkey_clasificacion&quot;, &quot;fkey_familia&quot;, &quot;fkey_marca&quot;, &quot;codigo_articulo&quot;, &quot;fecha_alta&quot;, &quot;usuario_alta&quot;, &quot;fkey_lista_precio&quot;) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ServerLinuxConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;key_articulo&quot;, &quot;descripcion&quot;, &quot;modelo&quot;, &quot;descripcion_larga&quot;, &quot;otra_informacion&quot;, &quot;cuidado_limpieza&quot;, &quot;fkey_departamento&quot;, &quot;fkey_clasificacion&quot;, &quot;fkey_familia&quot;, &quot;fkey_marca&quot;, &quot;codigo_articulo&quot;, &quot;fecha_alta&quot;, &quot;usuario_alta&quot;, &quot;fkey_lista_precio&quot; FROM &quot;Articulos&quot;" UpdateCommand="UPDATE &quot;Articulos&quot; SET &quot;descripcion&quot; = ?, &quot;modelo&quot; = ?, &quot;descripcion_larga&quot; = ?, &quot;otra_informacion&quot; = ?, &quot;cuidado_limpieza&quot; = ?, &quot;fkey_departamento&quot; = ?, &quot;fkey_clasificacion&quot; = ?, &quot;fkey_familia&quot; = ?, &quot;fkey_marca&quot; = ?, &quot;fecha_alta&quot; = ?, &quot;usuario_alta&quot; = ?, &quot;fkey_lista_precio&quot; = ? WHERE &quot;key_articulo&quot; = ? AND &quot;codigo_articulo&quot; = ?">
    <DeleteParameters>
        <asp:Parameter Name="key_articulo" Type="Int64" />
        <asp:Parameter Name="codigo_articulo" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="descripcion" Type="String" />
        <asp:Parameter Name="modelo" Type="String" />
        <asp:Parameter Name="descripcion_larga" Type="String" />
        <asp:Parameter Name="otra_informacion" Type="String" />
        <asp:Parameter Name="cuidado_limpieza" Type="String" />
        <asp:Parameter Name="fkey_departamento" Type="Int64" />
        <asp:Parameter Name="fkey_clasificacion" Type="Int64" />
        <asp:Parameter Name="fkey_familia" Type="Int64" />
        <asp:Parameter Name="fkey_marca" Type="Int64" />
        <asp:Parameter Name="codigo_articulo" Type="String" />
        <asp:Parameter Name="fecha_alta" Type="DateTime" />
        <asp:Parameter Name="usuario_alta" Type="String" />
        <asp:Parameter Name="fkey_lista_precio" Type="Int64" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="descripcion" Type="String" />
        <asp:Parameter Name="modelo" Type="String" />
        <asp:Parameter Name="descripcion_larga" Type="String" />
        <asp:Parameter Name="otra_informacion" Type="String" />
        <asp:Parameter Name="cuidado_limpieza" Type="String" />
        <asp:Parameter Name="fkey_departamento" Type="Int64" />
        <asp:Parameter Name="fkey_clasificacion" Type="Int64" />
        <asp:Parameter Name="fkey_familia" Type="Int64" />
        <asp:Parameter Name="fkey_marca" Type="Int64" />
        <asp:Parameter Name="fecha_alta" Type="DateTime" />
        <asp:Parameter Name="usuario_alta" Type="String" />
        <asp:Parameter Name="fkey_lista_precio" Type="Int64" />
        <asp:Parameter Name="key_articulo" Type="Int64" />
        <asp:Parameter Name="codigo_articulo" Type="String" />
    </UpdateParameters>
    </asp:SqlDataSource>

</div>
</asp:Content>