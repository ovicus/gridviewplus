<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EnhancedGridViewSample.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Enhanced GridView</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="scripts/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.metadata.js" type="text/javascript"></script>
    <script src="scripts/jquery.dataTables.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            // Setup Metadata plugin
            $.metadata.setType("class");

            // Setup GridView
            $("table.grid").each(function () {
                var jTbl = $(this);

                if (jTbl.find("tbody>tr>th").length > 0) {
                    jTbl.find("tbody").before("<thead><tr></tr></thead>");
                    jTbl.find("thead:first tr").append(jTbl.find("th"));
                    jTbl.find("tbody tr:first").remove();
                }

                // If GridView has the 'sortable' class and has more than 10 rows
                if (jTbl.hasClass("sortable") && jTbl.find("tbody:first > tr").length > 10) {

                    // Run DataTable on the GridView
                    jTbl.dataTable({
                        sPaginationType: "full_numbers",
                        sDom: '<"top"lf>rt<"bottom"ip>',
                        oLanguage: {
                            sInfoFiltered: "(from _MAX_ entries)",
                            sSearch: ""
                        },
                        aoColumnDefs: [
                            { bSortable: false, aTargets: jTbl.metadata().disableSortCols }
                        ]
                    });
                }
            });
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridViewHotels" runat="server" AutoGenerateColumns="False" 
            DataSourceID="HotelsDataSource" CssClass="grid sortable {disableSortCols: [3]}">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:TemplateField HeaderText="Category" SortExpression="Category">
                    <HeaderTemplate>
                        <asp:Literal ID="Category" runat="server" Text="Category" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="HotelCategoryText" runat="server" Text='<%# Eval("Category") %>' style="display:none" />
                        <asp:Image ID="HotelCategory" runat="server" AlternateText='<%# Eval("Category", "{0} stars") %>'
                            ImageUrl='<%# Eval("Category", "images/stars/{0}.png") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price">
                    <HeaderTemplate>
                        <asp:Literal ID="Price" runat="server" Text="Price" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        $<asp:Literal ID="LabelPrice" runat="server" Text='<%# Eval("Price", "{0:N2}") %>'></asp:Literal>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="HotelsDataSource" runat="server" SelectMethod="GetHotels" TypeName="EnhancedGridViewSample.DataSource"></asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
