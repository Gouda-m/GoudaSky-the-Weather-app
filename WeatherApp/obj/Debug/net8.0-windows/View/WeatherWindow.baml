   M S B A M L   `   `   `  ����E  AWeatherApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:WeatherApp.ViewWeatherApp.View  5   	   ;"clr-namespace:WeatherApp.ViewModelWeatherApp.ViewModel  5   	   [2clr-namespace:WeatherApp.ViewModel.ValueConverters$WeatherApp.ViewModel.ValueConverters  5   	   #    WeatherApp.View.WeatherWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   /localclr-namespace:WeatherApp.View     5   	   1vm"clr-namespace:WeatherApp.ViewModel     5   	   I
converters2clr-namespace:WeatherApp.ViewModel.ValueConverters     5   	   -   5          �Name$  Parent��5   	    � Title$ 	Gouda Sky��5
   	   $	��500��6   $	��350��6(    � Icon$ icons/weather.ico��64    � 
ResizeMode$ NoResize=�5   	    � 	Resources 5      >   8WeatherApp.ViewModel.ValueConverters.BoolToRainConverter   
boolToRain��%   &	          5   
   6)   5      .��5      �  � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� .+�5      ]� $��10q�6    � UseLayoutRounding$ False��6$   .+�5      �� $
��City��6   $��Center=�6(   $��Center=�5      �� 5      $��5,0,0,0q�5      $��Stretch=�6,   
�����f���5      �� *Query+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�5      5      �� 5      $��0,0,10,0q�6   $��search��6'   $��Right=�5"      $��Center=�61   $��80��5#      
�������
�����f�$��0q�5$      ��5       �� *searchCommand+��5!      �� *Query+5$      �� 5%      -   5        	 ��Name$	 
CitiesList��5%      $��10q�5'      $��0q�6#   ��5&      �� *Cities+��5(      �� 5)      .R�5*      � .+�5+      �� 
������ $��0q�6>   $��Stretch=�6R   ��5,   %   �� *DataContext.selectionCommand+
 �� ElementName$
 
CitiesList����5-   %   �� ��5.   "   �� 5/   &   ��50   *   `� 51   .    �� StringFormat$ {0}, {1}��6<   .1�52   2   ��  �� Path$ LocalizedName�6:   �� 53   2   $ Country.LocalizedName�6:   54   /   56   '   58      5;      5<      5>      5?      � 5@   
   $��1��6    � DataContext 6   �� *CurrentConditions+��5A      �� 5B       �� EndPoint$ 0.5,1&�6&    �� 
StartPoint$ 0.5,0&�67   .��5C      �  � Color$ White��6#    � Offset$ 0Q�61   � 5D      $ MediumAquamarine��6#   $ 0.416Q�6<   5E       � ColumnDefinitions 5G      �� 5H      $��* �6#   �� 5I      $
��Auto �6#   .+�5K      �� .+�5L      �� 
�������$��22(�5O      $��	20,40,0,0q�5P       5L      �� *DataContext+$
 Parent����5M      �� *SelectedCity.LocalizedName+$ OneWay=�5P      �� 5Q      
�������$��12(�5S      $��20,0,0,0q�5T      ��5Q      �� *WeatherText+5T      �� 5U      
�������$��12(�5W      $��	20,0,0,20q�5X      ��5U      �� *HasPrecipitation+ �� 	Converter# [  5X      5Y      �� 5Z      $��1��6   $��Center=�5[      $��35(�5]      
�������$��
20,20,30,0q�5_      ��5\      �� *Temperature.Metric.Value+$ {0}°C��5_      5b      5c      5d      