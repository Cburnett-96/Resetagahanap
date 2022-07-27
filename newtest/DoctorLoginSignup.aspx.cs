using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

namespace newtest
{
    public partial class DoctorLoginSignup : System.Web.UI.Page
    {
        static String activationcode;
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["role"] = null;
        }
        protected void btnlogindoctor_Click(object sender, EventArgs e)
        {
            //doctor user login
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from doctor where userid='" + userid.Text.Trim() + "' AND password='" + password.Text.Trim() + "' AND legit='yes'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["username"] = dr.GetValue(3).ToString();
                        Session["fullname"] = dr.GetValue(0).ToString();
                        Session["role"] = "doctor";
                    }
                    Response.Redirect("HomePageDoctor.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials OR Under Screening Process');</script>");
                }

            }
            catch (Exception)
            {

            }
        }
        protected void signupbtn_Click(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {

                Response.Write("<script>alert('Member Already Exist with this Member ID, try other ID');</script>");
            }
            else
            {
                //signupdoctor
                if (txtdoctorname.Text != "" && txtdoctorcontact.Text != "" && txtdoctoraddress.Text != "" && useriddoctor.Text != "" && passwordoctor.Text != "")

                {
                    try
                    {
                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        SqlCommand cmd = new SqlCommand("INSERT INTO doctor(doctorname,contact,address,userid,password) values(@doctorname,@contact,@address,@userid,@password)", con);
                        cmd.Parameters.AddWithValue("@doctorname", txtdoctorname.Text.Trim());
                        cmd.Parameters.AddWithValue("@contact", txtdoctorcontact.Text.Trim());
                        cmd.Parameters.AddWithValue("@address", txtdoctoraddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@userid", useriddoctor.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", passwordoctor.Text.Trim());
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Sign Up Successful. Please Wait for your Account Activation! (Screening)');</script>");
                        
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Fill-up all Text Field');</script>");
                }
            }
        }
        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from doctor where userid='" + useriddoctor.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            activationcode = random.Next(1000, 9999).ToString();
            if (txtemail.Text != "")
            {
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential("resetagahanap@gmail.com", "Resetagahanap08");
                smtp.EnableSsl = true;

                MailMessage msg = new MailMessage();
                msg.Subject = "Activation Code to Verify Your Email";
                msg.Body = "Hello " + txtdoctorname.Text + " Your Activation Code is: " + activationcode + " Input in your verification Text field";
                string toaddress = txtemail.Text;
                msg.To.Add(toaddress);
                string fromaddress = "ReseTagahanap: <resetagahanap@gmail.com>";
                msg.From = new MailAddress(fromaddress);

                try
                {
                    smtp.Send(msg);
                    Response.Write("<script>alert('Check Your Email for your Verification Code!');</script>");
                    btnsend.Text = "Resend";
                    btnverify.Visible = true;
                }
                catch
                {
                    throw;
                }
            }
            else
            {
                Response.Write("<script>alert('Input Email for your Verification Code!');</script>");
            }
        }
        protected void btnverify_Click(object sender, EventArgs e)
        {
            if (activationcode == txtotp.Text)
            {
                Response.Write("<script>alert('Verify Successfully');</script>");
                proceed.Visible = true;
                verify.Visible = false;
            }
            else
            {
                Response.Write("<script>alert('Wrong Code!');</script>");
            }
        }
    }
}