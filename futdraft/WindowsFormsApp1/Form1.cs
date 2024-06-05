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
using static futdraft.Form1;


namespace futdraft
{
    public partial class Form1 : Form
    {
        public int Chemistry;
        public Dictionary<string, Player> starting11;
        public List<Player> generatedPlayers;
        public List<Player> Players;
        private Image empty;
        public Dictionary<string, Player> team;
        public string selectedPlayer;
        public string selectedPlayer2;

        public Form1()
        {
            InitializeComponent();
            Chemistry = 0;
            starting11 = new Dictionary<string, Player>();
            generatedPlayers = new List<Player>();
            Players = new List<Player>();
            empty = WindowsFormsApp1.Properties.Resources.empty;
            team = new Dictionary<string, Player>();
            selectedPlayer = "";
            selectedPlayer2 = "";
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            float scaleFactor = 1.75f;
            foreach (Control control in this.Controls)
            {
                control.Size = new System.Drawing.Size((int)(control.Width * scaleFactor), (int)(control.Height * scaleFactor));
                control.Location = new System.Drawing.Point((int)(control.Left * scaleFactor), (int)(control.Top * scaleFactor));
                control.Font = new Font(control.Font.FontFamily, control.Font.Size * scaleFactor, control.Font.Style);
            }
            this.WindowState = FormWindowState.Maximized;

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
                if (button.Name.Contains("5b") && !button.Name.Contains("form") || button.Name.Contains("sub") && !button.Name.Contains("form"))
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
            OVR.Visible = true;
            Score.Visible = true;
            UserName.Visible = true;
        }

        private void form4back_Click(object sender, EventArgs e)
        {
            foreach (var button in this.Controls.OfType<Button>())
            {
                if (button.Name.Contains("4b") && !button.Name.Contains("form") || button.Name.Contains("sub") && !button.Name.Contains("form"))
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
            OVR.Visible = true;
            Score.Visible = true;
            UserName.Visible = true;
        }

        private void form3back_Click(object sender, EventArgs e)
        {
            foreach (var button in this.Controls.OfType<Button>())
            {
                if (button.Name.Contains("3b") && !button.Name.Contains("form") || button.Name.Contains("sub") && !button.Name.Contains("form"))
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
            OVR.Visible = true;
            Score.Visible = true;
            UserName.Visible = true;
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

                    starting11.Clear();
                    foreach (var player in team)
                    {
                        if (!player.Key.Contains("sub") && player.Value != null && !starting11.Keys.ToArray().Contains(player.Key))
                        {
                            starting11.Add(player.Key, player.Value);
                        }
                    }
                    CalculateChem();
                }
            }

            
        }

        public void generate_players(string pos)
        {
            if (pos.Contains("sub"))
            {
                pos = "sub";
            }
            else
            {
                string input = pos;

                // Define the regex pattern to match all digits
                string pattern = @"\d";

                // Replace all matches with an empty string
                pos = Regex.Replace(input, pattern, "");
                pos = pos.Remove(pos.Length - 1);
            }

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
                //player.Pos.Contains(pos.ToUpper())
                
                if (player.Pos.Split(';').Contains(pos.ToUpper()) || pos == "sub")
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

            starting11.Clear();
            foreach (var player in team)
            {
                if (!player.Key.Contains("sub") && player.Value != null && !starting11.Keys.ToArray().Contains(player.Key))
                {
                    starting11.Add(player.Key, player.Value);
                }
            }
            if (starting11.Count() != 0)
            {
                CalculateChem();
            }
        }

        private void CalculateChem()
        {
            Chemistry = 0;
            totalChemistry.Text = "0";
            posChemistry.Text = "0";
            nationChemisty.Text = "0";
            leagueChemistry.Text = "0";
            teamChemistry.Text = "0";

            Dictionary<string, int> nations = new Dictionary<string, int>();
            Dictionary<string, int> leagues = new Dictionary<string, int>();
            Dictionary<string, int> teams = new Dictionary<string, int>();
            int posChem = 0;
            string[] forward = new string[] { "LW", "ST", "RW", "CF"};
            string[] midfield = new string[] { "LM", "CM", "RM", "CAM", "CDM"};
            string[] back = new string[] { "RWB", "RB", "CB", "LB", "LWB"};
            string[] gk = new string[] { "GK" };

            foreach (var player in starting11)
            {
                if (!nations.ContainsKey(player.Value.Nation) || nations.Count() == 0)
                {
                    nations.Add(player.Value.Nation, 0);
                }
                if (!leagues.ContainsKey(player.Value.League) || leagues.Count() == 0)
                {
                    leagues.Add(player.Value.League, 0);
                }
                if (!teams.ContainsKey(player.Value.Team) || teams.Count() == 0)
                {
                    teams.Add(player.Value.Team, 0);
                }

                string pos = player.Key;
                string[] position = new string[] { "LW", "ST", "RW", "CF", "LM", "CM", "RM", "CAM", "CDM", "RWB", "RB", "CB", "LB", "LWB" };
                if (forward.Contains(pos.Substring(0, 2)))
                {
                    position = forward;
                }
                if (midfield.Contains(pos.Substring(0, 2)))
                {
                    position = midfield;
                }
                if (back.Contains(pos.Substring(0, 2)))
                {
                    position = back;
                }
                if (gk.Contains(pos.Substring(0, 2)))
                {
                    position = gk;
                }


                string[] playerPositions = player.Value.Pos.Split(';');
                if (playerPositions.Intersect(position).Any())
                {
                    posChem++;
                }

                string input = pos;
                string pattern = @"\d";

                // Replace all matches with an empty string
                pos = Regex.Replace(input, pattern, "");
                pos = pos.Remove(pos.Length - 1);
                if (player.Value.Pos.Split(';').Contains(pos.ToUpper()))
                {
                    posChem++;
                }
            }

            foreach (var player in starting11)
            {
                if (nations.ContainsKey(player.Value.Nation))
                {
                    nations[player.Value.Nation] += 2;
                }
                if (leagues.ContainsKey(player.Value.League))
                {
                    leagues[player.Value.League] += 2;
                }
                if (teams.ContainsKey(player.Value.Team))
                {
                    teams[player.Value.Team] += 2;
                }
            }

            foreach (var nation in nations.Keys.ToArray())
            {
                if (nations[nation] <= 5)
                {
                    nations[nation] = 0;
                }
            }
            foreach (var league in leagues.Keys.ToArray())
            {
                if (leagues[league] <= 5)
                {
                    leagues[league] = 0;
                }
            }
            foreach (var team in teams.Keys.ToArray())
            {
                if (teams[team] <= 5)
                {
                    teams[team] = 0;
                }
            }

            Chemistry = nations.Values.Sum() + leagues.Values.Sum() + teams.Values.Sum() + posChem;
            totalChemistry.Text = Convert.ToString(Chemistry);
            posChemistry.Text = Convert.ToString(posChem);
            nationChemisty.Text = Convert.ToString(nations.Values.Sum());
            leagueChemistry.Text = Convert.ToString(leagues.Values.Sum());
            teamChemistry.Text = Convert.ToString(teams.Values.Sum());

            OVR.Text = Convert.ToString(Math.Floor(starting11.Values.Average(player => player.Ovr)));
            Score.Text = Convert.ToString(Math.Floor(Chemistry + starting11.Values.Average(player => player.Ovr)));

            if (team.Values.All(value => value != null))
            {
                Submit.Visible = true;
            }
        }

        private void Submit_Click(object sender, EventArgs e)
        {

        }
    }
}
