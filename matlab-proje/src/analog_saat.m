close all;
clc;

f = figure('Name','Matlab Kullanarak Analog Saat Tasarımı','NumberTitle','off','Color',[0.1 0.1 0.1]);
ax = axes('Parent',f); hold on; axis equal;
axis([-1.2 1.2 -1.2 1.2]);
set(ax, 'Color',[0.1 0.1 0.1], 'XTick',[], 'YTick',[], 'XColor','none','YColor','none');

t_c = linspace(0, 2*pi, 100);
plot(1.05*cos(t_c), 1.05*sin(t_c), 'Color', [0.8 0.6 0.2], 'LineWidth', 4); 

rakam_rengi = [0 1 1]; 
for i = 1:60
    phi = i * pi/30;
    if mod(i, 5) == 0 
        plot([0.9 1]*cos(phi), [0.9 1]*sin(phi), 'w', 'LineWidth', 2);
    else 
        plot(0.95*cos(phi), 0.95*sin(phi), 'w.', 'MarkerSize', 5);
    end
end

for n = 1:12
    phi = pi/2 - (n * pi/6);
    text(0.8*cos(phi), 0.8*sin(phi), num2str(n), 'Color', rakam_rengi, ...
        'FontSize', 12, 'FontWeight', 'bold', 'Horiz', 'center');
end

text(0, -0.3, 'YAVUZ SELİM AKAY', 'Color', rakam_rengi, 'FontSize', 14, ...
    'FontWeight', 'bold', 'Horiz', 'center');

hA = plot([0 0],[0 0],'w','LineWidth',6);
hY = plot([0 0],[0 0],'w','LineWidth',3.5);
hS = plot([0 0],[0 0],'r','LineWidth',1.5);

while ishandle(f)
    T = datetime('now');
    [h, m, s] = hms(T);
    
    s_a = pi/2 - s*pi/30;
    m_a = pi/2 - m*pi/30;
    h_a = pi/2 - (mod(h,12)*pi/6 + m*pi/360);
    
    set(hS, 'XData', [0 0.85*cos(s_a)], 'YData', [0 0.85*sin(s_a)]);
    set(hY, 'XData', [0 0.75*cos(m_a)], 'YData', [0 0.75*sin(m_a)]);
    set(hA, 'XData', [0 0.55*cos(h_a)], 'YData', [0 0.55*sin(h_a)]);
    
    drawnow;
    pause(0.5);
end
