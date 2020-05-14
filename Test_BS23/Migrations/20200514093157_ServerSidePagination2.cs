using Microsoft.EntityFrameworkCore.Migrations;

namespace Test_BS23.Migrations
{
    public partial class ServerSidePagination2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            string sp = @"create Proc [dbo].[Usp_GetPost]  
                         @PageNo INT ,  
                         @PageSize INT 
                        As  
                        Begin  
                            Select * From (Select ROW_NUMBER() Over (
	                        Order by id) AS 'RowNum', * from [dbo].Posts)t
	                        where t.RowNum Between ((@PageNo-1)*@PageSize +1) AND (@PageNo*@pageSize)  
                        End";

            migrationBuilder.Sql(sp);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            string sp = @"drop Proc [dbo].[Usp_GetPost]";

            migrationBuilder.Sql(sp);

        }
    }
}
