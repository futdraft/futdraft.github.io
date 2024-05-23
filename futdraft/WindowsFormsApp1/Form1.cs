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


namespace futdraft
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
                }
            }
            catch (Exception hiba)
            {

            }
            conn.Close();

            foreach (var button in this.Controls.OfType<Button>())
            {
                if (!button.Name.Contains("form"))
                {
                    button.Visible = false;
                }
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

        private void gk3b_Click(object sender, EventArgs e)
        {

        }

        private void form5back_Click(object sender, EventArgs e)
        {
            foreach (var button in this.Controls.OfType<Button>())
            {
                if (button.Name.Contains("5b"))
                {
                    button.Visible = true;
                }
                if (button.Name.Contains("form"))
                {
                    button.Visible = false;
                }
            }
            formationSelect.Visible = false;
        }

        private void form4back_Click(object sender, EventArgs e)
        {
            foreach (var button in this.Controls.OfType<Button>())
            {
                if (button.Name.Contains("4b"))
                {
                    button.Visible = true;
                }
                if (button.Name.Contains("form"))
                {
                    button.Visible = false;
                }
            }
            formationSelect.Visible = false;
        }

        private void form3back_Click(object sender, EventArgs e)
        {
            foreach (var button in this.Controls.OfType<Button>())
            {
                if (button.Name.Contains("3b"))
                {
                    button.Visible = true;
                }
                if (button.Name.Contains("form"))
                {
                    button.Visible = false;
                }

            }
            formationSelect.Visible = false;
        }

        private void cb24b_Click(object sender, EventArgs e)
        {

        }
    }
}
