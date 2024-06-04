using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

using MySql.Data;
using MySql.Data.MySqlClient;


namespace futdraft
{
    public partial class Form1 : Form
    {
        public List<Player> generatedPlayers;
        public List<Player> Players;
        private Image empty;
        public Dictionary<string, Player> team;
        public string selectedPlayer;
        public string selectedPlayer2;

        public Form1()
        {
            InitializeComponent();
            generatedPlayers = new List<Player>();
            Players = new List<Player>();
            empty = WindowsFormsApp1.Properties.Resources.empty;
            team = new Dictionary<string, Player>();
            selectedPlayer = "";
            selectedPlayer2 = "";
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
            foreach (var label in this.Controls.OfType<Label>())
            {
                if (label.Name.Contains("Chem"))
                {
                    label.Visible = false;
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
                    button.BackgroundImage = empty;
                    button.BackgroundImageLayout = ImageLayout.Zoom;
                    button.Text = "";
                    team.Add(button.Name, null);
                }
                if (button.Name.Contains("form"))
                {
                    button.Visible = false;
                }
            }
            foreach (var label in this.Controls.OfType<Label>())
            {
                if (label.Name.Contains("Chem"))
                {
                    label.Visible = true;
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
                    button.BackgroundImage = empty;
                    button.BackgroundImageLayout = ImageLayout.Zoom;
                    button.Text = "";
                    team.Add(button.Name, null);
                }
                if (button.Name.Contains("form"))
                {
                    button.Visible = false;
                }
            }
            foreach (var label in this.Controls.OfType<Label>())
            {
                if (label.Name.Contains("Chem"))
                {
                    label.Visible = true;
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
                    button.BackgroundImage = empty;
                    button.BackgroundImageLayout = ImageLayout.Zoom;
                    button.Text = "";
                    team.Add(button.Name, null);
                }
                if (button.Name.Contains("form"))
                {
                    button.Visible = false;
                }

            }
            foreach (var label in this.Controls.OfType<Label>())
            {
                if (label.Name.Contains("Chem"))
                {
                    label.Visible = true;
                }
            }
            formationSelect.Visible = false;
        }

        private void button_clicked(object sender, EventArgs e)
        {
            Button button = sender as Button;
            string pos = button.Name;
            selectedPlayer = pos;
            if (button.BackgroundImage == empty)
            {
                generate_players(pos);
            }
            else
            {
                if (selectedPlayer2 == "")
                {
                    selectedPlayer2 = selectedPlayer;
                }
                else
                {
                    Player jatekos1 = team[selectedPlayer];
                    Player jatekos2 = team[selectedPlayer2];

                    team[selectedPlayer] = jatekos2;
                    team[selectedPlayer2] = jatekos1;

                    Control[] controls1 = this.Controls.Find(selectedPlayer, true);
                    Button playerButton1 = controls1[0] as Button;

                    Control[] controls2 = this.Controls.Find(selectedPlayer2, true);
                    Button playerButton2 = controls2[0] as Button;

                    playerButton1.BackgroundImage = (Image)WindowsFormsApp1.Properties.Resources.ResourceManager.GetObject("_" + jatekos2.Id);
                    playerButton2.BackgroundImage = (Image)WindowsFormsApp1.Properties.Resources.ResourceManager.GetObject("_" + jatekos1.Id);

                    selectedPlayer = "";
                    selectedPlayer2 = "";
                }
                

            }
        }

        public void generate_players(string pos)
        {
            string input = pos;

            // Define the regex pattern to match all digits
            string pattern = @"\d";

            // Replace all matches with an empty string
            pos = Regex.Replace(input, pattern, "");
            pos = pos.Remove(pos.Length - 1);

            foreach (Control control in this.Controls)
            {
                if (control.Name.Contains("Select"))
                {
                    control.Visible = true;
                }
            }

            //Megfelelő pozícióban lévő játékosok összeszedése
            List<Player> availablePlayers = new List<Player>();
            foreach (var player in Players)
            {
                if (player.Pos.Contains(pos.Substring(0,2).ToUpper()))
                {
                    availablePlayers.Add(player);
                }
            }

            //5 random játékos kiválasztása generatedPlayers-be
            Random rnd = new Random();
            while (generatedPlayers.Count <= 5)
            {
                int maxint = availablePlayers.Count();
                int random = rnd.Next(maxint);
                if (!generatedPlayers.Contains(availablePlayers[random]))
                {
                    generatedPlayers.Add(availablePlayers[random]);
                }
            }

            playerSelect1.BackgroundImage = (Image)WindowsFormsApp1.Properties.Resources.ResourceManager.GetObject("_" + generatedPlayers[0].Id);
            playerSelect2.BackgroundImage = (Image)WindowsFormsApp1.Properties.Resources.ResourceManager.GetObject("_" + generatedPlayers[1].Id);
            playerSelect3.BackgroundImage = (Image)WindowsFormsApp1.Properties.Resources.ResourceManager.GetObject("_" + generatedPlayers[2].Id);
            playerSelect4.BackgroundImage = (Image)WindowsFormsApp1.Properties.Resources.ResourceManager.GetObject("_" + generatedPlayers[3].Id);
            playerSelect5.BackgroundImage = (Image)WindowsFormsApp1.Properties.Resources.ResourceManager.GetObject("_" + generatedPlayers[4].Id);

        }

        private void playerSelect_Click(object sender, EventArgs e)
        {
            Button button = sender as Button;
            int n = Convert.ToInt32(button.Name.Substring(button.Name.Length - 1)) - 1;

            Control[] controls = this.Controls.Find(selectedPlayer, true);
            Button playerButton = controls[0] as Button;
            playerButton.BackgroundImage = (Image)WindowsFormsApp1.Properties.Resources.ResourceManager.GetObject("_" + generatedPlayers[n].Id);
            team[selectedPlayer] =generatedPlayers[n];

            foreach (Control control in this.Controls)
            {
                if (control.Name.Contains("Select"))
                {
                    control.Visible = false;
                }
            }
            Players.Remove(generatedPlayers[n]);
            generatedPlayers.Clear();
        }
    }
}
