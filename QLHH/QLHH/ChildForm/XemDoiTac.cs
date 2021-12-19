using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace QLHH.ChildForm
{
    public partial class XemDoiTac : Form
    {
        public XemDoiTac()
        {
            InitializeComponent();
        }

        private void XemDoiTac_Load(object sender, EventArgs e)
        {

            SqlConnection cnn = new SqlConnection(@"Data Source=LAPTOP-FGLN4TT3\SQLEXPRESS;Initial Catalog = QLHH;Integrated Security = True");
            cnn.Open();
            string sql = "select * from DOITAC";  // lay het du lieu trong bang sinh vien
            SqlCommand com = new SqlCommand(sql, cnn); //bat dau truy van
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com); //chuyen du lieu ve
            DataTable dt = new DataTable(); //tạo một kho ảo để lưu trữ dữ liệu
            da.Fill(dt);  // đổ dữ liệu vào kho
            cnn.Close();  // đóng kết nối
            dataGridView1.DataSource = dt; //đổ dữ liệu vào datagridview
        }
    }
}
