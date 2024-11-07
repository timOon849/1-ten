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
using Wpf.Ui.Controls;

namespace _1_ten.Pages
{
    /// <summary>
    /// Логика взаимодействия для CardUControl.xaml
    /// </summary>
    public partial class CardUControl : UserControl
    {
        public CardUControl(Cards _card)
        {
            InitializeComponent();
            SymbolTbx.Text = _card.Symbol;
            Rank1Tbx.Text = _card.Rank;
            Rank2Tbx.Text = _card.Rank;
            if (SymbolTbx.Text == "♥" || SymbolTbx.Text == "♦")
            {
                Rank1Tbx.Foreground = Brushes.Red;
                Rank2Tbx.Foreground = Brushes.Red;
                SymbolTbx.Foreground = Brushes.Red;
            }
            if (_card.Status == "Closed") ClosedCardRect.Visibility = Visibility.Visible;
        }
    }
}
