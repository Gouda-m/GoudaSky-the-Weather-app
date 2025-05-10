using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace WeatherApp.ViewModel.Commands
{
    public class SearchCommand : ICommand
    {
        public WeatherVM vm { get; set; }

        private Task _executingTask = Task.CompletedTask;

        public event EventHandler? CanExecuteChanged
        {
            add { CommandManager.RequerySuggested += value; }
            remove {  CommandManager.RequerySuggested -= value; }
        }

        public SearchCommand(WeatherVM vm)
        {
            this.vm = vm;
        }

        public bool CanExecute(object? parameter)
        {
            string query = parameter as string;
            if (string.IsNullOrWhiteSpace(query)) 
            {
                return false;
            }
            return _executingTask.IsCompleted;
        }

        public void Execute(object? parameter)
        {
            _executingTask = vm.MakeQuery();
        }
    }
}
