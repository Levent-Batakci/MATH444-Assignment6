%Levent Batakci
%HW 6 Main Script
%Text Mining!

%Load the data
%Precomputed, by me!
load genseq.mat
load termdocs.mat

%CENTER!
for i = 1:6
    %[TermDocs{i} W] = WeightTD(TermDocs{i}); %WEIGHTING
    TermDocs{i} = TermDocs{i} - sum(TermDocs{i},2) / size(TermDocs{i},2);
end


% Scatter plots
clf(figure(1));
figure(1)
for n = 1:6
    subplot(2,3, mod(n-1,3)+1 + 3*floor((n-1)/3));
    %Visualize
    sgtitle("n=" + n);
    Z = PCA(TermDocs{n});
    Z1 = Z(1,:);
    Z2 = Z(2,:);
    scatter(Z1,Z2, 200, '.'); 
    hold on;
end

%K-medoids for k=6, n=3
k=6;
tau=0.0001;
TD = TermDocs{3};
D = dMatrix(TD, @norm2);
[I,Ic] = kMedoids_distMatrix(k, D, tau, 10);

%PCA visualization!
Z = PCA(TD);
sgtitle("K-medoids (n=3,k=6)");
colors = ["blue" "black" "red" "green" "cyan" "magenta" "yellow"];
clf(figure(7));
figure(7);
sgtitle("k-Medoids Clustering with k=6, # of letters = 200")
for c = 1:k
    %Visualize
    Z_ = Z(:,I==c);
    Z1 = Z_(1,:);
    Z2 = Z_(2,:);
    scatter(Z1,Z2, 200, colors(c), '.' );
    hold on;
end
xlabel("PC 1");
ylabel("PC 2");

for c = 1:k
    scatter(Z(1,Ic(c)),Z(2,Ic(c)), 300, "black", 'o');
end

clf(figure(8))
M = Query(TD(:, Ic(1)),TD(:,I==1));
figure(8);
histogram(M, 20)
hold on
M = Query(TD(:, Ic(1)),TD(:,I~=1));
histogram(M, 20)


% TD900 = CalcFreq(genseq, 3, 900)';
% Z = PCA(TD900);
% figure(9)
% scatter(Z(1,:), Z(2,:), 200, '.');
% D = dMatrix(TD900, @norm2);
% [I,Ic] = kMedoids_distMatrix(k, D, tau, 100);
% 
% clf(figure(10));
% figure(10);
% sgtitle("k-Medoids Clustering with k=6")
% for c = 1:k
%     %Visualize
%     Z_ = Z(:,I==c);
%     Z1 = Z_(1,:);
%     Z2 = Z_(2,:);
%     scatter(Z1,Z2, 200, colors(c), '.' );
%     hold on;
% end
% xlabel("PC 1");
% ylabel("PC 2");
% 
% for c = 1:k
%     scatter(Z(1,Ic(c)),Z(2,Ic(c)), 300, "black", 'o');
% end