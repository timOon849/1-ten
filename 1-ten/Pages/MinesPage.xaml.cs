using _1_ten.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Xml.Linq;

namespace _1_ten.Pages
{
    /// <summary>
    /// Логика взаимодействия для MinesPage.xaml
    /// </summary>
    public partial class MinesPage : Page
    {
        private string _password;
        private const int GridSize = 5;
        private const int MaxMines = 10;
        private const double MaxWinningMultiplier = 2.0;
        private int minesCount = 0;
        private Button[,] buttons;
        private bool[,] mineField;
        int betAmount;
        private double multiplier;
        private int validCellsClicked = 0;
        private bool gameStarted = false;

        public MinesPage( string password)
        {
            _password = password;
            InitializeComponent();
            InitializeMinesCountComboBox();
            multiplier = 1.0;
        }

        private void InitializeMinesCountComboBox()
        {
            MinesCountComboBox.Items.Clear();
            for (int i = 1; i <= MaxMines; i++)
            {
                MinesCountComboBox.Items.Add(i);
            }
            MinesCountComboBox.SelectedIndex = 0;
        }

        private async void PlaceBetButton_Click(object sender, RoutedEventArgs e)
        {
            string betAmountText = BetAmountTextBox.Text.Trim();
            if (double.TryParse(betAmountText, out double bet) && bet > 0 && MinesCountComboBox.SelectedItem != null)
            {
                betAmount = Convert.ToInt32(bet);
                var user = ConnectionClass.DB.Users.FirstOrDefault(u => u.Password == _password);
                if (user.Balance < betAmount)
                {
                    MessageBox.Show("Недостаточно средств для ставки.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                    var sessions = new Game_Sessions
                    {
                        User_ID = user.User_ID,
                        Game_ID = 2,
                        Bet_Amount = Convert.ToInt32(bet),
                        Win_Amount = 0,
                        Date = DateTime.Now
                    };
                    ConnectionClass.DB.Game_Sessions.Add(sessions);
                    ConnectionClass.DB.SaveChanges();
                
                user.Balance -= betAmount;
                ConnectionClass.DB.SaveChanges();
                minesCount = (int)MinesCountComboBox.SelectedItem;
                multiplier = 1.0 + (minesCount * 0.02);
                if (multiplier > MaxWinningMultiplier) multiplier = MaxWinningMultiplier;
                MessageBox.Show($"Ставка в размере {betAmount} сделана с количеством мин: {minesCount}!");
                gameStarted = true;

                NewGame();
            }
            else
            {
                MessageBox.Show("Введите корректную сумму ставки или выберите количество мин.");
            }
        }
        private void GenerateSessions()
        {

        }
        private void NewGame()
        {
            if (!gameStarted) return;

            GameGrid.Children.Clear();
            buttons = new Button[GridSize, GridSize];
            mineField = new bool[GridSize, GridSize];
            InitializeMines();
            for (int i = 0; i < GridSize; i++)
            {
                for (int j = 0; j < GridSize; j++)
                {
                    buttons[i, j] = new Button
                    {
                        Width = 70,
                        Height = 70,
                        Margin = new Thickness(5)
                    };
                    buttons[i, j].Click += Cell_Click;
                    GameGrid.Children.Add(buttons[i, j]);
                }
            }

            EnableCells(true);
            UpdatePotentialWinnings();
        }

        private async void Cell_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;

            int index = GameGrid.Children.IndexOf(button);
            int row = index / GridSize;
            int column = index % GridSize;

            if (mineField[row, column])
            {

                MessageBox.Show($"Вы попали на мину! Игра окончена. Ваши потери: {betAmount}");
                var user = ConnectionClass.DB.Users.FirstOrDefault(u => u.Password == _password);
                user.Balance -= betAmount;
                ConnectionClass.DB.SaveChanges();
                var gamehistory = new Game_History
                {
                    User_ID = user.User_ID,
                    Type = "Проигрыш",
                    Amount = betAmount,
                    HistoryDate = DateTime.Now
                };
                ConnectionClass.DB.Game_History.Add(gamehistory);
                ConnectionClass.DB.SaveChanges();
                ShowMineField();
                await Task.Delay(2000);
                ResetGame();
            }
            else
            {
                button.Background = System.Windows.Media.Brushes.LightGray;
                button.Content = "";
                button.IsEnabled = false;
                validCellsClicked++;
                UpdatePotentialWinnings();
            }
        }

        private void ShowMineField()
        {
            for (int i = 0; i < GridSize; i++)
            {
                for (int j = 0; j < GridSize; j++)
                {
                    if (mineField[i, j])
                    {
                        buttons[i, j].Background = System.Windows.Media.Brushes.Red;
                        buttons[i, j].Foreground = System.Windows.Media.Brushes.White;
                        buttons[i, j].Content = "💣";
                    }
                }
            }
        }

        private void InitializeMines()
        {
            Random rand = new Random();
            int placedMines = 0;

            while (placedMines < minesCount)
            {
                int row = rand.Next(GridSize);
                int column = rand.Next(GridSize);

                if (!mineField[row, column])
                {
                    mineField[row, column] = true;
                    placedMines++;
                }
            }
        }

        private void EnableCells(bool enable)
        {
            foreach (var child in GameGrid.Children)
            {
                if (child is Button button)
                {
                    button.IsEnabled = enable;
                }
            }
        }

        private void ResetGame()
        {
            EnableCells(false);
            multiplier = 1.0;
            validCellsClicked = 0;
            gameStarted = false;
            PotentialWinningsTextBlock.Text = "";
        }

        private void UpdatePotentialWinnings()
        {
            double potentialWin = betAmount * multiplier * validCellsClicked;
            PotentialWinningsTextBlock.Text = $"Потенциальный выигрыш: {potentialWin:0.00}";
        }

        private void CollectWinningsButton_Click(object sender, RoutedEventArgs e)
        {
            var user = ConnectionClass.DB.Users.FirstOrDefault(u => u.Password == _password);
            ShowMineField();
            ConnectionClass.DB.SaveChanges();

            if (!gameStarted)
            {
                MessageBox.Show("Сначала сделайте ставку, чтобы забрать выигрыш.");
                return;
            }
            var gameSession = ConnectionClass.DB.Game_Sessions.FirstOrDefault(gs => gs.User_ID == user.User_ID && gs.Win_Amount == 0);

            double winnings = betAmount * multiplier * validCellsClicked;            
            if (gameSession != null)
            {
                gameSession.Win_Amount = Convert.ToInt32(winnings);
                ConnectionClass.DB.SaveChanges();
            }
            user.Balance += Convert.ToInt32(winnings);
            MessageBox.Show($"Вы забрали выигрыш: {winnings:F2}!\nВаш баланс: {user.Balance:F2}");            
            var gamehistory = new Game_History
            {
                User_ID = user.User_ID,
                Type = "Выигрыш",
                Amount = Convert.ToDecimal(winnings),
                HistoryDate = DateTime.Now
            };
            ConnectionClass.DB.Game_History.Add(gamehistory);
            ConnectionClass.DB.SaveChanges();
            ResetGame();
        }

        private void IncreaseBet(int amount)
        {
            betAmount += amount;
            BetAmountTextBox.Text = betAmount.ToString("F2");
        }

        private void IncreaseBet10_Click(object sender, RoutedEventArgs e) => IncreaseBet(10);
        private void IncreaseBet50_Click(object sender, RoutedEventArgs e) => IncreaseBet(50);
        private void IncreaseBet100_Click(object sender, RoutedEventArgs e) => IncreaseBet(100);
        private void IncreaseBet500_Click(object sender, RoutedEventArgs e) => IncreaseBet(500);
        private void IncreaseBet1000_Click(object sender, RoutedEventArgs e) => IncreaseBet(1000);

        private void Close_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
