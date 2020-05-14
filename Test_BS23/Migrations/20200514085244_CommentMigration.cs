using Microsoft.EntityFrameworkCore.Migrations;

namespace Test_BS23.Migrations
{
    public partial class CommentMigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Post_id",
                table: "Likes");

            migrationBuilder.DropColumn(
                name: "Post_id",
                table: "Dislikes");

            migrationBuilder.AddColumn<int>(
                name: "Comment_id",
                table: "Likes",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "Comment_id",
                table: "Dislikes",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Comment_id",
                table: "Likes");

            migrationBuilder.DropColumn(
                name: "Comment_id",
                table: "Dislikes");

            migrationBuilder.AddColumn<int>(
                name: "Post_id",
                table: "Likes",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "Post_id",
                table: "Dislikes",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}
