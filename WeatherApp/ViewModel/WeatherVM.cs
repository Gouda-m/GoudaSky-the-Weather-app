using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WeatherApp.Model;
using WeatherApp.ViewModel.Commands;
using WeatherApp.ViewModel.Helpers;

namespace WeatherApp.ViewModel
{
    public class WeatherVM : INotifyPropertyChanged
    {
        private string _query;

        public string Query
        {
            get { return _query; }
            set 
            { 
                _query = value;
                OnProperyChanged(nameof(Query));
            }
        }

        private CurrentConditions _currentConditions;

        public CurrentConditions CurrentConditions
        {
            get { return _currentConditions; }
            set 
            { 
                _currentConditions = value;
                OnProperyChanged(nameof(CurrentConditions));
            }
        }


        private City _selectedCity;

        public City SelectedCity
        {
            get { return _selectedCity; }
            set { 
                _selectedCity = value;
                OnProperyChanged(nameof(SelectedCity));
            }
        }

        public async Task GetCurrentCondition(City city)
        {
            Query = string.Empty;
           

            CurrentConditions = await AccuWeatherHelper.GetCurrentConditions(city.Key);
            Cities.Clear();
            SelectedCity = city;

        }

        public SearchCommand searchCommand { get; set; }
        public SelectionCommand selectionCommand { get; set; }

        public ObservableCollection<City> Cities { get; set; }

        public WeatherVM()
        {
            if(DesignerProperties.GetIsInDesignMode(new System.Windows.DependencyObject()))
            {
                SelectedCity = new City
                {
                    LocalizedName = "New York"
                };
                CurrentConditions = new CurrentConditions
                {
                    WeatherText = "Partly Cloudy",
                    Temperature = new Temperature
                    {
                        Metric = new Units { Value = "21" }
                    }
                };
            }

            searchCommand = new SearchCommand(this);
            selectionCommand = new SelectionCommand(this);
            Cities = new ObservableCollection<City>();
        }
        
        public event PropertyChangedEventHandler? PropertyChanged;

        public async Task MakeQuery()
        {
            var cities = await AccuWeatherHelper.GetCities(Query);

            Cities.Clear();
            foreach (var city in cities)
            {
                Cities.Add(city);
            }
        } 


        
        private void OnProperyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
