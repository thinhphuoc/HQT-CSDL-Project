using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using FontAwesome.Sharp;

namespace QLHH
{
    public partial class Login : Form
    {
        //Fields
        private IconButton cur_btn;
        private Panel leftBorderBtn;
        private Form currentChildForm;
        //Constructor
        public Login()
        {
            InitializeComponent();
            leftBorderBtn = new Panel();
            leftBorderBtn.Size = new Size(5, 51);
            panel_Menu.Controls.Add(leftBorderBtn);
        }

        private struct RGBColors
        {
            public static Color color1 = Color.FromArgb(172, 126, 241);
            public static Color color2 = Color.FromArgb(249, 118, 176);
            public static Color color3 = Color.FromArgb(253, 138, 114);
            public static Color color4 = Color.FromArgb(95, 77, 221);
            public static Color color5 = Color.FromArgb(249, 88, 155);
            public static Color color6 = Color.FromArgb(24, 161, 251);
        }

        private void DisableButton()
        {
            if (cur_btn != null)
            {
                cur_btn.BackColor = Color.FromArgb(31, 30, 68);
                cur_btn.ForeColor = Color.Gainsboro;
                cur_btn.TextAlign = ContentAlignment.MiddleCenter;
                cur_btn.IconColor = Color.Gainsboro;
                cur_btn.TextImageRelation = TextImageRelation.TextBeforeImage;
                cur_btn.ImageAlign = ContentAlignment.MiddleRight;
            }
        }

        private void iconButton_CN1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form admin_form = new form_Admin();
            admin_form.ShowDialog();
            this.Close();
        }

        private void iconButton_CN2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form taixe_form = new form_TaiXe();
            taixe_form.ShowDialog();
            this.Close();
        }

        private void iconButton_CN3_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form nhanvien_form = new form_NhanVien();
            nhanvien_form.ShowDialog();
            this.Close();
        }

        private void iconButton_CN4_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form khachhang_form = new form_KhachHang();
            khachhang_form.ShowDialog();
            this.Close();
        }

        private void iconButton_CN5_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form doitac_form = new form_DoiTac();
            doitac_form.ShowDialog();
            this.Close();
        }


        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void iconButton1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void panel_Menu_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
