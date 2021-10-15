% Visualize the scallop of Edward Purcell and save to .gif.

clc, clear;
filename='.\output\scallop.gif'; % Name it.

vec = linspace(0,10,30);
x = 1:length(vec);

m = linspace(1,15,10);
m = [m,fliplr(m)];
fixAx = [-1 50 -160 160];

scal =figure;

for slope=1:length(m)
    yy = m(slope)*vec;
    plot(x+m(slope),yy,'r-','LineWidth', 7);
    hold on;
    plot(x+m(slope),-yy,'r-', 'LineWidth', 7);
    axis(fixAx)
    axis off
    pause(0.05)
    hold off
    
    
    % save to gif
    frame=getframe(scal);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if slope == 1
      imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.01);
    else
      imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime',0.01);
    end
    
end