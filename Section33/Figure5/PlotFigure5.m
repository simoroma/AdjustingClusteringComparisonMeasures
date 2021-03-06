close all;
clear all;
clc;

load('figure5');

h = figure;
hold all;
grid on;
st = {'-o' '-s' '->','-*'}; % styles
for qi=1:length(qs)
    plot(rs,EHqUV(qi,:),st{qi});
end

% reset colors
ax = gca;
ax.ColorOrderIndex = 1;

hold all;
grid on;
for qi=1:length(qs)
    plot(rs,HqUVlimit(qi,:),'o--');
end

legQ = cell(1,length(qs));
for qi=1:length(qs)
   legQ{qi} = ['$q = $ ' num2str(qs(qi))];
end 

leg = legend(legQ);
set(leg,'Interpreter','latex');
set(leg,'Location','NorthEastOutside');

title(['$N =' num2str(N) '$ objects'],'Interpreter','latex','FontSize',12);
ylabel('$E[H_q(U,V)]$','Interpreter','latex','FontSize',12);
xlabel('Number of sets $r$ in $U$ ','Interpreter','latex','FontSize',12);

%small
set(h,'Position',[200 200 450 220]);
set(h,'PaperSize',[12 6],'PaperPositionMode','auto');
saveas(h,'figure5','pdf');