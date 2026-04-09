% Load definition
daily_load_Wh = 17500;
panel_W = 400;
system_eff = 0.80;
num_panels = 12;

% Monthly PSH for Ahmedabad
months = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
PSH = [4.8, 5.4, 6.0, 6.3, 6.1, 5.2, 4.6, 4.8, 5.5, 5.8, 5.2, 4.6];
days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31];

% Monthly energy yield
monthly_yield = num_panels * (panel_W/1000) * PSH .* days_in_month * system_eff;

% Monthly demand
monthly_demand = (daily_load_Wh/1000) * days_in_month;

% Plot
figure;
bar_data = [monthly_yield; monthly_demand]';
b = bar(bar_data);
set(gca, 'XTickLabel', months);
legend('Solar Yield (kWh)', 'Load Demand (kWh)');
xlabel('Month');
ylabel('Energy (kWh)');
title('Monthly Solar Energy Yield vs Load Demand – Ahmedabad (4.8 kWp System)');
grid on;

% Print sizing summary
fprintf('--- SYSTEM SIZING SUMMARY ---\n');
fprintf('Daily Load: %.1f kWh\n', daily_load_Wh/1000);
fprintf('Number of Panels: %d x %dW = %.1f kWp\n', num_panels, panel_W, num_panels*panel_W/1000);
fprintf('Annual Yield: %.1f kWh\n', sum(monthly_yield));
fprintf('Annual Demand: %.1f kWh\n', sum(monthly_demand));