using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace datamanipulation
{
    public partial class Form1 : Form
    {
        public List<Player> Players;
        public Form1()
        {
            InitializeComponent();
            Players = new List<Player>();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string kapcs = "server=localhost;database=futdraft;user=root;password=;port=3306;";
            MySqlConnection conn = new MySqlConnection(kapcs);
            try
            {
                conn.Open();

                string sql = "SELECT * FROM Players";
                MySqlCommand parancs = new MySqlCommand(sql, conn);
                MySqlDataReader eredmeny = parancs.ExecuteReader();
                while (eredmeny.Read())
                {
                    Player temp = new Player(eredmeny);
                    Players.Add(temp);
                    comboBox1.Items.Add(temp.Name);
                }
            }
            catch (Exception hiba)
            {
                
            }
            conn.Close();

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string aktuális = comboBox1.Text;
            foreach (var elem in Players)
            {
                if (elem.Name == aktuális)
                {
                    ID_Text.Text = Convert.ToString(elem.Id);
                    Name_Text.Text = elem.Name;
                    Ovr_Text.Text = Convert.ToString(elem.Ovr);
                    Pos_Text.Text = elem.Pos;
                    League_Text.Text = elem.League;
                    Nation_Text.Text = elem.Nation;
                    Team_Text.Text = elem.Team;
                }
            }

        }

        private void AddPlayer_Click(object sender, EventArgs e)
        {
            string temp1 = "0";
            string kapcs1 = "server=localhost;database=futdraft;user=root;password=;port=3306;";
            MySqlConnection conn1 = new MySqlConnection(kapcs1);
            try
            {
                conn1.Open();

                string sql = "SELECT MAX(id) FROM players";
                MySqlCommand parancs = new MySqlCommand(sql, conn1);
                MySqlDataReader eredmeny = parancs.ExecuteReader();
                while (eredmeny.Read())
                {
                    temp1 = Convert.ToString(Convert.ToInt32(eredmeny[0])+1);
                }
            }
            catch (Exception hiba)
            {

            }
            conn1.Close();

            
            string temp2 = textBox2.Text;
            string temp3 = textBox4.Text;
            string temp4 = textBox3.Text;
            string temp5 = textBox7.Text;
            string temp6 = textBox6.Text;
            string temp7 = textBox5.Text;

            string kapcs = "server=localhost;database=futdraft;user=root;password=;port=3306;";
            MySqlConnection conn = new MySqlConnection(kapcs);
            try
            {
                conn.Open();

                string sql = "INSERT INTO players VALUES("+temp1+",'" + temp2 + "'," + temp3 + ",'" + temp4 + "','" + temp5 + "','" + temp6 + "','" + temp7 + "');";
                label15.Text = sql;
                MySqlCommand parancs = new MySqlCommand(sql, conn);
                parancs.ExecuteNonQuery();

            }
            catch (Exception hiba)
            {
                label16.Text = "Hiba történt. "+hiba;
            }
            conn.Close();

            Players = new List<Player>();
            comboBox1.Items.Clear();
            string kapcs3 = "server=localhost;database=futdraft;user=root;password=;port=3306;";
            MySqlConnection conn3 = new MySqlConnection(kapcs3);
            try
            {
                conn3.Open();

                string sql = "SELECT * FROM Players";
                MySqlCommand parancs = new MySqlCommand(sql, conn3);
                MySqlDataReader eredmeny = parancs.ExecuteReader();
                while (eredmeny.Read())
                {
                    Player temp = new Player(eredmeny);
                    Players.Add(temp);
                    comboBox1.Items.Add(temp.Name);
                }
            }
            catch (Exception hiba)
            {
                label17.Text = Convert.ToString(hiba);
            }
            conn3.Close();
        }
    }
    public class Player
    {
        public int Id { get; private set; }
        public string Name { get; private set; }
        public int Ovr { get; private set; }
        public string Pos { get; private set; }
        public string League { get; private set; }
        public string Nation { get; private set; }
        public string Team { get; private set; }
        public string Picture { get; private set; }

        public Player(MySqlDataReader adat)
        {
            Id = Convert.ToInt32(adat[0]);
            Name = Convert.ToString(adat[1]);
            Ovr = Convert.ToInt32(adat[2]);
            Pos = Convert.ToString(adat[3]);
            League = Convert.ToString(adat[4]);
            Nation = Convert.ToString(adat[5]);
            Team = Convert.ToString(adat[6]);
        }
    }
}
