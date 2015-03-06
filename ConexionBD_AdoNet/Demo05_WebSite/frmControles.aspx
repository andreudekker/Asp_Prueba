<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmControles.aspx.cs" Inherits="Demo05_WebSite.frmControles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Label ID="Label1" runat="server" Text="Seleccione una tabla"></asp:Label>
&nbsp;<asp:DropDownList ID="ddltablas" runat="server" DataSourceID="SqlTabla" 
        DataTextField="NAME" DataValueField="NAME">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlTabla" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        onselecting="SqlTabla_Selecting" SelectCommand="select name
from sysobjects
where type='U'"></asp:SqlDataSource>
    <asp:Button ID="BtnMostrar" runat="server" Text="Mostrar" />
&nbsp;<asp:UpdatePanel ID="UpInformacion" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:GridView ID="gvInformacion" runat="server" AllowPaging="True" 
                AllowSorting="True" CellPadding="4" DataSourceID="SqlInformacion" 
                ForeColor="#333333" GridLines="None" Width="200px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddltablas" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <br />
    <asp:SqlDataSource ID="SqlInformacion" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        SelectCommand="usp_mostrarInformacion" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddltablas" Name="tabla" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
</asp:Content>
