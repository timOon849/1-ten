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
    /// Логика взаимодействия для GameSessionsPage.xaml
    /// </summary>
    public partial class GameSessionsPage : Page
    {
        public GameSessionsPage()
        {
            InitializeComponent();
            SessionsListView.ItemsSource = ConnectionClass.DB.Game_Sessions.ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void Button_Click1(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new UsersPage());
        }
    }
}
