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
    public partial class form_TaiXe : Form
    {
        //Fields
        private IconButton cur_btn;
        private Panel leftBorderBtn;
        private Form currentChildForm;
        //Constructor
        public form_TaiXe()
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

        private void ActiveButton(object senderBtn, Color color)
        {
            if (senderBtn != null)
            {
                DisableButton();
                cur_btn = (IconButton)senderBtn;
                cur_btn.BackColor = Color.FromArgb(37, 36, 81);
                cur_btn.ForeColor = color;
                cur_btn.TextAlign = ContentAlignment.MiddleCenter;
                cur_btn.IconColor = color;
                cur_btn.TextImageRelation = TextImageRelation.ImageBeforeText;
                cur_btn.ImageAlign = ContentAlignment.MiddleRight;

                leftBorderBtn.BackColor = color;
                leftBorderBtn.Location = new Point(0, cur_btn.Location.Y);
                leftBorderBtn.Visible = true;
                leftBorderBtn.BringToFront();

                icon_Exit.IconChar = cur_btn.IconChar;
                icon_Exit.IconColor = color;
            }
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

        private void OpenChildForm(Form childForm)
        {
            if (currentChildForm != null)
            {
                currentChildForm.Close();
            }
            currentChildForm = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;
            this.Invoke((MethodInvoker)delegate
            {
                panel_Form.Controls.Add(childForm);
                panel_Form.Tag = childForm;
            });
            childForm.BringToFront();
            childForm.Show();
        }

        private void iconButton_CN1_Click(object sender, EventArgs e)
        {
            ActiveButton(sender, RGBColors.color1);
            OpenChildForm(new ChildForm.XemTTTK());
        }

        /*private void iconButton_CN2_Click(object sender, EventArgs e)
        {
            ActiveButton(sender, RGBColors.color2);
            OpenChildForm(new ChildForm.SuaTTTK());
        }*/

        private void iconButton_CN3_Click(object sender, EventArgs e)
        {
            ActiveButton(sender, RGBColors.color3);
            OpenChildForm(new ChildForm.CapNhatDonHang());
        }

        private void iconButton_CN4_Click(object sender, EventArgs e)
        {
            ActiveButton(sender, RGBColors.color4);
            OpenChildForm(new ChildForm.QLDH());
        }

        /*private void iconButton_CN5_Click(object sender, EventArgs e)
        {
            ActiveButton(sender, RGBColors.color5);
            OpenChildForm(new ChildForm.SuaHH());
        }*/

        private void icon_Exit_Click(object sender, EventArgs e)
        {
            reset();
            if (currentChildForm != null)
            {
                currentChildForm.Close();
            }
        }

        private void reset()
        {
            DisableButton();
            leftBorderBtn.Visible = false;
            icon_Exit.IconChar = IconChar.Home;
            icon_Exit.IconColor = Color.MediumPurple;
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void iconButton1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
