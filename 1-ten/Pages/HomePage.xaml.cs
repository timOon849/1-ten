using _1_ten.DataBase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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
    /// Логика взаимодействия для HomePage.xaml
    /// </summary>
    public partial class HomePage : Page
    {
        private string _password;
        public HomePage(string password)
        {
            InitializeComponent();           
            _password = password;
        }
        
        
        private void NavigationViewItem_Click(object sender, RoutedEventArgs e)
        {
            var user = ConnectionClass.DB.Users.Where(z => z.Password == _password).AsEnumerable().FirstOrDefault();
            if (user != null)
            {
                UserProfileWindow newWindow = new UserProfileWindow(user.Password);
                newWindow.Show();
            }
        }

        private void NavigationViewItem_Click_1(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AuthorizationPage());
        }
        private void Game1_Click(object sender, MouseButtonEventArgs e)
        {
            var user = ConnectionClass.DB.Users.Where(z => z.Password == _password).AsEnumerable().FirstOrDefault();
            NavigationService.Navigate(new MinesPage(user.Password));
        }

        private void Game2_Click(object sender, MouseButtonEventArgs e)
        {
            var user = ConnectionClass.DB.Users.Where(z => z.Password == _password).AsEnumerable().FirstOrDefault();
            NavigationService.Navigate(new BlackjackPage(user.Password));
        }

        private void NavigationViewItem_Click_2(object sender, RoutedEventArgs e)
        {
            var user = ConnectionClass.DB.Users.Where(z => z.Password == _password).AsEnumerable().FirstOrDefault();
            if (user != null)
            {
                BalanceWindow newWindow = new BalanceWindow(user.Password);
                newWindow.Show();
            }
        }

        private void NavigationViewItem_Click_3(object sender, RoutedEventArgs e)
        {
            var user = ConnectionClass.DB.Users.Where(z => z.Password == _password).AsEnumerable().FirstOrDefault();
            if(user != null)
            {
                GameHistoryWindow newWindow = new GameHistoryWindow(user.Password);
                newWindow.Show();
            }
        }

        private void NavigationViewItem_Click_4(object sender, RoutedEventArgs e)
        {
            var user = ConnectionClass.DB.Users.Where(z => z.Password == _password).FirstOrDefault();
            NavigationService.Navigate(new ReportPage(user.Password));
        }
    }
}
