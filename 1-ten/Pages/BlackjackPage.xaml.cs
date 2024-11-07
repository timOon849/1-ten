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


namespace _1_ten.Pages
{
    /// <summary>
    /// Логика взаимодействия для BlackjackPage.xaml
    /// </summary>
    public partial class BlackjackPage : Page
    {
        Random random = new Random();
        public int closedindex = 0;
        public CardUControl closedCard = null;
        int x = 140;
        int PlayerSum = 0;
        int DealerSum = 0;
        string _password;
        private int sessionID;
        private double betAmount;
        List<Cards> cards = new List<Cards>()
            {
                new Cards("♥", "2", null),
                new Cards("♥", "3", null),
                new Cards("♥", "4", null),
                new Cards("♥", "5", null),
                new Cards("♥", "6", null),
                new Cards("♥", "7", null),
                new Cards("♥", "8", null),
                new Cards("♥", "9", null),
                new Cards("♥", "10", null),
                new Cards("♥", "J", null),
                new Cards("♥", "D", null),
                new Cards("♥", "K", null),
                new Cards("♥", "A", null),
                new Cards("♦", "2", null),
                new Cards("♦", "3", null),
                new Cards("♦", "4", null),
                new Cards("♦", "5", null),
                new Cards("♦", "6", null),
                new Cards("♦", "7", null),
                new Cards("♦", "8", null),
                new Cards("♦", "9", null),
                new Cards("♦", "10", null),
                new Cards("♦", "J", null),
                new Cards("♦", "D", null),
                new Cards("♦", "K", null),
                new Cards("♦", "A", null),
                new Cards("♣", "2", null),
                new Cards("♣", "3", null),
                new Cards("♣", "4", null),
                new Cards("♣", "5", null),
                new Cards("♣", "6", null),
                new Cards("♣", "7", null),
                new Cards("♣", "8", null),
                new Cards("♣", "9", null),
                new Cards("♣", "10", null),
                new Cards("♣", "J", null),
                new Cards("♣", "D", null),
                new Cards("♣", "K", null),
                new Cards("♣", "A", null),
                new Cards("♠", "2", null),
                new Cards("♠", "3", null),
                new Cards("♠", "4", null),
                new Cards("♠", "5", null),
                new Cards("♠", "6", null),
                new Cards("♠", "7", null),
                new Cards("♠", "8", null),
                new Cards("♠", "9", null),
                new Cards("♠", "10", null),
                new Cards("♠", "J", null),
                new Cards("♠", "D", null),
                new Cards("♠", "K", null),
                new Cards("♠", "A", null)
            };
        public BlackjackPage(string password)
        {
            _password = password;
            InitializeComponent();
            MoreButt.Visibility = Visibility.Collapsed;
            StopButt.Visibility = Visibility.Collapsed;
        }

        private void ExitButt_Click(object sender, RoutedEventArgs e)
        {
            // нужен код выхода в меню навигации или еще что-нибудь хз
            NavigationService.GoBack();
        }

        private void PlayButt_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (BetTbx.Text != null)
                {
                    betAmount = double.Parse(BetTbx.Text); // Сохраняем ставку как переменную
                    if (betAmount > 0)
                    {
                        var user = ConnectionClass.DB.Users.FirstOrDefault(u => u.Password == _password);
                        if (user.Balance < betAmount)
                        {
                            MessageTbx.Text = "Недостаточно средств для ставки!";
                            return;
                        }
                        user.Balance -= Convert.ToInt32(betAmount);
                        ConnectionClass.DB.SaveChanges();
                        var session = new Game_Sessions
                        {
                            User_ID = user.User_ID,
                            Game_ID = 3, // Предположим, 2 – это ID для игры "Blackjack"
                            Bet_Amount = Convert.ToInt32(betAmount),
                            Win_Amount = 0, // Изменится позже в StopButt_Click
                            Date = DateTime.Now
                        };
                        ConnectionClass.DB.Game_Sessions.Add(session);
                        ConnectionClass.DB.SaveChanges(); // Сохраняем сессию, чтобы получить её ID
                        sessionID = session.Session_ID; // Используйте ID сессии для дальнейших операций

                        ExitButt.Visibility = Visibility.Collapsed;
                        PlayButt.Visibility = Visibility.Collapsed;
                        MessageTbx.Text = "";
                        BetTbx.IsEnabled = false;
                        MoreButt.Visibility = Visibility.Visible;
                        StopButt.Visibility = Visibility.Visible;
                        PlayerSum = 0; DealerSum = 0;
                        PlayerHandCnv.Children.Clear();
                        DealerHandCnv.Children.Clear();
                        Playing();
                    }
                    else
                        MessageTbx.Text = "Вы не можете поставить такую ставку!";
                }
                else
                    MessageTbx.Text = "Для игры нужна ставка!";
            }
            catch
            {
                MessageBox.Show("Что-то пошло не так!");
            }
        }

        public void Playing()
        {
            int index = random.Next(0, cards.Count());
            cards[index].Status = "Open";
            PlayerHandCnv.Children.Add(new CardUControl(cards[index]));
            try
            {
                PlayerSum += int.Parse(cards[index].Rank);
            }
            catch
            {
                if (cards[index].Rank == "A") PlayerSum += 11;
                else PlayerSum += 10;
            }

            index = random.Next(0, cards.Count());
            if (cards[index].Status == "Open") index = random.Next(0, cards.Count());
            cards[index].Status = "Open";
            CardUControl huyar = new CardUControl(cards[index]);
            Canvas.SetLeft(huyar, 70);
            PlayerHandCnv.Children.Add(huyar);
            try
            {
                PlayerSum += int.Parse(cards[index].Rank);
            }
            catch
            {
                if (cards[index].Rank == "A" && PlayerSum < 11) PlayerSum += 11;
                else if (cards[index].Rank == "A" && PlayerSum == 11) PlayerSum += 1;
                else PlayerSum += 10;
            }
            MessageTbx.Text = $"Сумма: {PlayerSum}";

            index = random.Next(0, cards.Count());
            if (cards[index].Status == "Open") index = random.Next(0, cards.Count());
            cards[index].Status = "Open";
            CardUControl card = new CardUControl(cards[index]);
            Canvas.SetLeft(card, 10);
            DealerHandCnv.Children.Add(card);
            try
            {
                DealerSum += int.Parse(cards[index].Rank);
            }
            catch
            {
                if (cards[index].Rank == "A") DealerSum += 11;
                else DealerSum += 10;
            }

            closedindex = random.Next(0, cards.Count());
            if (cards[closedindex].Status == "Open") closedindex = random.Next(0, cards.Count());
            cards[closedindex].Status = "Closed";
            card = new CardUControl(cards[closedindex]);
            Canvas.SetLeft(card, 90);
            DealerHandCnv.Children.Add(card);
            try
            {
                DealerSum += int.Parse(cards[closedindex].Rank);
            }
            catch
            {
                if (cards[closedindex].Rank == "A" && DealerSum < 11) DealerSum += 11;
                else if (cards[closedindex].Rank == "A" && DealerSum == 11) DealerSum += 1;
                else DealerSum += 10;
            }
            closedCard = card;
        }

        private void MoreButt_Click(object sender, RoutedEventArgs e)
        {
            int index = 0;
            while (true)
            {
                index = random.Next(0, cards.Count());
                if (cards[index].Status == "Open" || cards[index].Status == "Closed") continue;
                else break;
            }
            cards[index].Status = "Open";
            CardUControl huyar = new CardUControl(cards[index]);
            Canvas.SetLeft(huyar, x);
            PlayerHandCnv.Children.Add(huyar);
            try
            {
                PlayerSum += int.Parse(cards[index].Rank);
            }
            catch
            {
                if (cards[index].Rank == "A" && PlayerSum < 11) PlayerSum += 11;
                else if (cards[index].Rank == "A" && PlayerSum == 11) PlayerSum += 1;
                else PlayerSum += 10;
            }
            MessageTbx.Text = $"Сумма: {PlayerSum}";
            x += 70;
            if (PlayerSum >= 21) StopButt_Click(sender, e);

        }

        private void StopButt_Click(object sender, RoutedEventArgs e)
        {
            // Откройте закрытую карту дилера
            DealerHandCnv.Children.Remove(closedCard);
            cards[closedindex].Status = "Open";
            CardUControl card = new CardUControl(cards[closedindex]);
            Canvas.SetLeft(card, 80);
            DealerHandCnv.Children.Add(card);

            // Проверка выигрыша или проигрыша
            string resultMessage = "";
            double winnings = 0;

            if (PlayerSum > 21)
            {
                MessageTbx.Text = "Вы проиграли!";
                resultMessage = "Проигрыш";
            }
            else if (PlayerSum == 21 && DealerSum != 21)
            {
                MessageTbx.Text = "Вы выиграли!";
                winnings = betAmount * 1.5; // Предположим, что выигрыш 1.5 от ставки
                resultMessage = "Выигрыш";
            }
            else if (PlayerSum == 21 && DealerSum == 21)
            {
                MessageTbx.Text = "Ничья!";
                resultMessage = "Ничья";
            }
            else if (PlayerSum < 21)
            {
                if (DealerSum > PlayerSum)
                {
                    MessageTbx.Text = "Вы проиграли!";
                    resultMessage = "Проигрыш";
                }
                else if (DealerSum >= 17)
                {
                    MessageTbx.Text = "Вы выиграли!";
                    winnings = betAmount * 1.5;
                    resultMessage = "Выигрыш";
                }
                else
                {
                    // Дилер добирает карты до значения 17
                    while (DealerSum < 17)
                    {
                        int index = 0;
                        while (true)
                        {
                            index = random.Next(0, cards.Count());
                            if (cards[index].Status == "Open" || cards[index].Status == "Closed") continue;
                            else break;
                        }
                        cards[index].Status = "Open";
                        CardUControl huyar = new CardUControl(cards[index]);
                        Canvas.SetLeft(huyar, x);
                        DealerHandCnv.Children.Add(huyar);
                        DealerSum += CalculateCardValue(cards[index]);
                        x += 70;
                    }
                    if (DealerSum == PlayerSum)
                    {
                        MessageTbx.Text = "Ничья!";
                        resultMessage = "Ничья";
                    }
                    else if (DealerSum < 22 && DealerSum > PlayerSum)
                    {
                        MessageTbx.Text = "Вы проиграли!";
                        resultMessage = "Проигрыш";
                    }
                    else if (DealerSum > 21 || DealerSum < PlayerSum)
                    {
                        MessageTbx.Text = "Вы выиграли!";
                        winnings = betAmount * 1.5;
                        resultMessage = "Выигрыш";
                    }
                }
            }

            // Обновляем игровую сессию и историю
            var session = ConnectionClass.DB.Game_Sessions.Find(sessionID);
            if (session != null)
            {
                var user = ConnectionClass.DB.Users.FirstOrDefault(u => u.Password == _password);
                user.Balance += Convert.ToInt32(winnings);
                ConnectionClass.DB.SaveChanges();
                session.Win_Amount = winnings > 0 ? Convert.ToInt32(winnings) : 0;
                ConnectionClass.DB.SaveChanges();

                var gameHistory = new Game_History
                {
                    User_ID = session.User_ID,
                    Type = resultMessage,
                    Amount = Convert.ToInt32(winnings),
                    HistoryDate = DateTime.Now
                };
                ConnectionClass.DB.Game_History.Add(gameHistory);
                ConnectionClass.DB.SaveChanges();
            }

            MessageTbx.Text += $" Сумма Дилера: {DealerSum}";
            MoreButt.Visibility = Visibility.Collapsed;
            StopButt.Visibility = Visibility.Collapsed;
            ExitButt.Visibility = Visibility.Visible;
            PlayButt.Visibility = Visibility.Visible;
            x = 140;
            BetTbx.IsEnabled = true;
        }
        private int CalculateCardValue(Cards card)
        {
            if (card.Rank == "A") return 11; // Для простоты предположим, что "A" всегда 11
            return int.TryParse(card.Rank, out int value) ? value : 10; // J, Q, K считаем как 10
        }
    }
}
