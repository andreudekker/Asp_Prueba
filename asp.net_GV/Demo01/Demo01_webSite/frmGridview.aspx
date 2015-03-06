<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmGridview.aspx.cs" Inherits="Demo01_webSite.frmGridview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
        DataKeyNames="ProductID" DataSourceID="SqlProductos" ForeColor="Black" 
        GridLines="Vertical" Width="400px">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
                SortExpression="UnitPrice" />
            <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" 
                SortExpression="UnitsInStock" />
            <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" 
                SortExpression="Discontinued" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
                SortExpression="ProductName" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlProductos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = @ProductID" 
        InsertCommand="INSERT INTO [Products] ([UnitPrice], [UnitsInStock], [Discontinued], [ProductName]) VALUES (@UnitPrice, @UnitsInStock, @Discontinued, @ProductName)" 
        SelectCommand="SELECT [ProductID], [UnitPrice], [UnitsInStock], [Discontinued], [ProductName] FROM [Products]" 
        UpdateCommand="UPDATE [Products] SET [UnitPrice] = @UnitPrice, [UnitsInStock] = @UnitsInStock, [Discontinued] = @Discontinued, [ProductName] = @ProductName WHERE [ProductID] = @ProductID">
        <DeleteParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="UnitsInStock" Type="Int16" />
            <asp:Parameter Name="Discontinued" Type="Boolean" />
            <asp:Parameter Name="ProductName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="UnitsInStock" Type="Int16" />
            <asp:Parameter Name="Discontinued" Type="Boolean" />
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="ProductID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
