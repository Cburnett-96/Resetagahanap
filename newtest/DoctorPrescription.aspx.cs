using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace newtest
{
    public partial class DoctorPrescription : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"].ToString() != "doctor")
                {
                    Response.Redirect("LoginDoctorPharmacy.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                        getPrescriptionData();
                    }

                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("LoginDoctorPharmacy.aspx");
            }
        }
        //Get the DOCTOR INFO
        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from doctor where userid='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                txtdoctorname.Text = dt.Rows[0]["doctorname"].ToString();
                txtcontact.Text = dt.Rows[0]["contact"].ToString();
                txtdoctoraddress.Text = dt.Rows[0]["address"].ToString();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        //BUTTON FIND USER/PATIENT INFO
        protected void btnfind_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }
        //DATABASE FIND USER/PATIENT INFO
        void getMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from normal where userid='" + txtuserid.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtname.Text = dr.GetValue(0).ToString();
                        txtgender.Text = dr.GetValue(1).ToString();
                        dobtxt.Text = dr.GetValue(2).ToString();
                        txtaddress.Text = dr.GetValue(6).ToString() + " " + dr.GetValue(5).ToString();

                        var generator = new RandomGenerator();
                        var randomString = generator.RandomString(4);
                        txtpresid.Text = randomString;
                    }

                }
                else
                {
                    Response.Write("<script>alert('No User ID Found!');</script>");
                    clearForm();
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        //CLEAR TEXT FIELD
        void clearForm()
        {
            txtname.Text = "";
            dobtxt.Text = "";
            txtgender.Text = "";
            txtaddress.Text = "";
            txtpresid.Text = "";
            txtdate.Text = "";
            txtrx.Text = "";
            txtrxmgtabs.Text = "";
            txtsigntabs.Text = "";
            txtsignhrs.Text = "";
            txtditabs.Text = "";
            txtrefill.Text = "";
        }
        //BUTTON SUBMIT PRESCRIPTION
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (checkExists())
            {

                Response.Write("<script>alert('Already Exist with this Prescription ID, try to refresh');</script>");
            }
            else
            {
                //INSERT PRESCRIPTION
                if (txtrx.Text != "" && txtrxmgtabs.Text != "" && txtsigntabs.Text != "" && txtsignhrs.Text != "" && txtditabs.Text != "" && txtrefill.Text != "")

                {
                    try
                    {
                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        SqlCommand cmd = new SqlCommand("INSERT INTO prescription (userid,prescriptionid,doctorname,address,contact,dateofpres,rxname,rxmgtabs,signtabs,signhrs,di,refill) values(@userid,@prescriptionid,@doctorname,@address,@contact,@dateofpres,@rxname,@rxmgtabs,@signtabs,@signhrs,@di,@refill)", con);
                        cmd.Parameters.AddWithValue("@userid", txtuserid.Text.Trim());
                        cmd.Parameters.AddWithValue("@prescriptionid", txtpresid.Text.Trim());
                        cmd.Parameters.AddWithValue("@doctorname", txtdoctorname.Text.Trim());
                        cmd.Parameters.AddWithValue("@address", txtdoctoraddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@contact", txtcontact.Text.Trim());
                        cmd.Parameters.AddWithValue("@dateofpres", txtdate.Text.Trim());
                        cmd.Parameters.AddWithValue("@rxname", txtrx.Text.Trim());
                        cmd.Parameters.AddWithValue("@rxmgtabs", txtrxmgtabs.Text.Trim());
                        cmd.Parameters.AddWithValue("@signtabs", txtsigntabs.Text.Trim());
                        cmd.Parameters.AddWithValue("@signhrs", txtsignhrs.Text.Trim());
                        cmd.Parameters.AddWithValue("@di", txtditabs.Text.Trim());
                        cmd.Parameters.AddWithValue("@refill", txtrefill.Text.Trim());
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Submit Successful');</script>");
                        getPrescriptionData();
                        clearForm();

                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                    }
                }
            }
        }
        //CHECK IF PRESCRIPTION ID IS ALREADY USED
        bool checkExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from prescription where prescriptionid='" + txtpresid.Text.Trim() + "';", con);
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
        //DATABASE FIND HISTORY OF PRESCRIPTION
        void getPrescriptionData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT prescriptionid AS [Prescription ID], dateofpres AS [Date Of Prescription] from prescription where doctorname='" + Session["fullname"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewHistory.DataSource = dt;
                GridViewHistory.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        //GENERATE RANDOM STRING FOR PRESCRIPTION ID
        public class RandomGenerator
        {
            private readonly Random _random = new Random();
            // Generates a random string with a given size.    
            public string RandomString(int size, bool lowerCase = false)
        {
            var builder = new StringBuilder(size);

            // Unicode/ASCII Letters are divided into two blocks
            // (Letters 65–90 / 97–122):   
            // The first group containing the uppercase letters and
            // the second group containing the lowercase.  

            // char is a single Unicode character  
            char offset = lowerCase ? 'a' : 'A';
            const int lettersOffset = 26; // A...Z or a..z: length = 26  

            for (var i = 0; i < size; i++)
            {
                var @char = (char)_random.Next(offset, offset + lettersOffset);
                builder.Append(@char);
            }

            return lowerCase ? builder.ToString().ToLower() : builder.ToString();
        }
        }
    }
}