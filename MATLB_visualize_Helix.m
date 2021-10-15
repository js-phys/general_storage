% Visualize a helix hat moves forward upon rotation-translation coupling. Save the visualization as .gif

clear
close all
% Set up the movie.
filename='.\output\helix1dir.gif'; % Name it.


helix=figure('Color', 'white');
%hold on;
vec=linspace(0,5*pi, 40);
%vec=[vec, fliplr(vec)];



axlim = [-0.2, 0.2, 0, 25, -0.2, 0.2];

for i=1:length(vec)
    t=vec(i)+pi/4+(0:pi/50:8*pi); % 0-4Pi is two turns
    a = 0.07; %radius
    height = 2; %height 

    fixAxis=axlim;
    P = [a*cos(t); a*sin(t); vec(i)/2+(height/(2*pi) * t)]; %calculate helix coordinates in cartesian coordinates
    plot3(P(1,:), P(3,:), P(2,:), 'r-', 'LineWidth', 5);
    axis(fixAxis);
    view(72,33)
    %pause(0.005);
    axis off
    drawnow
    
    % save to gif
    frame=getframe(helix);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i == 1
      imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.01);
    else
      imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime',0.01);
    end
end