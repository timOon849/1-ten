using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity.Migrations;
using System.Globalization;
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
using System.Windows.Shapes;
using _1_ten.DataBase;

namespace _1_ten.Pages
{
    /// <summary>
    /// Логика взаимодействия для BalanceWindow.xaml
    /// </summary>
    public partial class BalanceWindow : Window
    {
        private string _password;
        private double balance;
        private int amount;
        private string sposob;
        private Transactions transactions;

        public BalanceWindow(string password)
        {
            InitializeComponent();
            _password = password;
            var Obj = ConnectionClass.DB.Users.Where(Users => Users.Password == _password).FirstOrDefault();
            var Finances = ConnectionClass.DB.Transactions.Where(us => us.User_ID == Obj.User_ID).FirstOrDefault();
            TransactionListView.ItemsSource = ConnectionClass.DB.Transactions.Where(id => id.User_ID == Obj.User_ID).ToList();
            Refresh();
        }

        private void ButtonDeposit_Click(object sender, RoutedEventArgs e)
        {
            Transactions transactions = new Transactions();

            var Obj = ConnectionClass.DB.Users.FirstOrDefault(u => u.Password == _password);            
            amount = Convert.ToInt32(textBoxDepositAmount.Text);
            if (string.IsNullOrEmpty(textBoxDepositAmount.Text) ||  amount < 0)
            {
                MessageBox.Show("Пожалуйста, заполните все поля");
                return;
            }
            else if (amount > 0)
            {
                transactions.User_ID = Obj.User_ID;
                transactions.Amount = amount;
                transactions.Transaction_Type = "Пополнение";
                transactions.Transaction_Date = DateTime.Now;
                Obj.Balance += amount;
                if (comboBoxDepositMethod.SelectedIndex == 0)
                {
                    transactions.Sposob = "Банковская карта";
                }
                else if(comboBoxDepositMethod.SelectedIndex == 1)
                {
                    transactions.Sposob = "Электронный кошёелёк";
                }
                else if (comboBoxDepositMethod.SelectedIndex == 2)
                {
                    transactions.Sposob = "Другой способ";
                }
                ConnectionClass.DB.Transactions.Add(transactions);
                ConnectionClass.DB.SaveChanges();
                Refresh();
            }
            else
            {
                MessageBox.Show("Введите корректную сумму для пополнения!");
            }
        }

        private void ButtonWithdraw_Click(object sender, RoutedEventArgs e)
        {
            Transactions transactions = new Transactions();

            var Obj = ConnectionClass.DB.Users.FirstOrDefault(u => u.Password == _password);
            amount = Convert.ToInt32(textBoxWithdrawAmount.Text);
            if (string.IsNullOrEmpty(textBoxWithdrawAmount.Text) || amount < 0)
            {
                MessageBox.Show("Пожалуйста, заполните все поля");
                return;
            }
            else if (amount > 0)
            {
                transactions.User_ID = Obj.User_ID;
                transactions.Amount = amount;
                transactions.Transaction_Type = "Списание";
                transactions.Transaction_Date = DateTime.Now;
                Obj.Balance -= amount;

                if (comboBoxWithdrawMethod.SelectedIndex == 0)
                {
                    transactions.Sposob = "Банковская карта";
                }
                else if (comboBoxWithdrawMethod.SelectedIndex == 1)
                {
                    transactions.Sposob = "Электронный кошёелёк";
                }
                else if (comboBoxWithdrawMethod.SelectedIndex == 2)
                {
                    transactions.Sposob = "Криптовалюта";
                }
                ConnectionClass.DB.Transactions.Add(transactions);
                ConnectionClass.DB.SaveChanges();
                Refresh();
            }
            else
            {
                MessageBox.Show("Введите корректную сумму для списания!");
            }
        }
        public void Refresh()
        {
            var Obj = ConnectionClass.DB.Users.FirstOrDefault(u => u.Password == _password);

            if (Obj != null)
            {
                TransactionListView.ItemsSource = ConnectionClass.DB.Transactions.Where(t => t.User_ID == Obj.User_ID).ToList();
            }
            else
            {
                TransactionListView.ItemsSource = null;
            }
        }
    }
}

