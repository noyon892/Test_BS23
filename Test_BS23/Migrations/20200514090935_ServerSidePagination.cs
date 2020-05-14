using Microsoft.EntityFrameworkCore.Migrations;

namespace Test_BS23.Migrations
{
    public partial class ServerSidePagination : Migration
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

            string sp1 = @"Create Proc [dbo].[Usp_getPostCount]  
                        As  
                        Begin  
                                select count(id) from   [dbo].Posts  
                        End";

            migrationBuilder.Sql(sp);
            migrationBuilder.Sql(sp1);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            string sp = @"drop Proc [dbo].[Usp_GetPost]";
            string sp1 = @"drop Proc [dbo].[Usp_getPostCount]";

            migrationBuilder.Sql(sp);
            migrationBuilder.Sql(sp1);

        }
    }
}
