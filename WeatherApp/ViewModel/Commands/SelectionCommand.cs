using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using WeatherApp.Model;

namespace WeatherApp.ViewModel.Commands
{
    public class SelectionCommand : ICommand
    {
        public WeatherVM vm { get; set; }
        private Task _executingTask = Task.CompletedTask;
        public SelectionCommand(WeatherVM vm)
        {
            this.vm = vm;
        }


        public event EventHandler? CanExecuteChanged
        {
            add { CommandManager.RequerySuggested += value; }
            remove { CommandManager.RequerySuggested -= value; }
        }

        public bool CanExecute(object? parameter)
        {
            return _executingTask.IsCompleted;
        }

        public void Execute(object? parameter)
        {
            var city = parameter as City;
            if (city != null)
            {
                _executingTask = vm.GetCurrentCondition(city);
            }
        }
    }
}
