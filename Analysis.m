%Levent Batakci
%HW 6 Main Script
%Text Mining!

%Load the data
%Precomputed, by me!
load genseq.mat
load termdocs.mat

% Scatter plots
% for n = 1:6
%     Visualize
%     figure(n);
%     sgtitle("n=" + n);
%     Z = PCA(TermDocs{n});
%     Z1 = Z(1,:);
%     Z2 = Z(2,:);
%     scatter(Z1,Z2, 200, '.'); 
% end

%K-medoids for k=6, n=3
k=6;
tau=0.0001;
TD = TermDocs{3};
D = dMatrix(TD, @norm2);
[I,Ic] = kMedoids_distMatrix(k, D, tau, 10);

%PCA visualization!
Z = PCA(TD);
sgtitle("LDA for K-medoids (n=3,k=6)");
colors = ["blue" "black" "red" "green" "cyan" "magenta" "yellow"];
clf(figure(7));
for c = 1:k
    %Visualize
    Z_ = Z(:,I==c);
    Z1 = Z_(1,:);
    Z2 = Z_(2,:);
    figure(7)
    scatter(Z1,Z2, 200, colors(c), '.' );
    hold on;
end

for c = 1:k
    scatter(Z(1,Ic(c)),Z(2,Ic(c)), 300, "yellow", 's', "filled");
end

clf(figure(8))
M = Query(TD(:, Ic(1)),TD(:,I==1));
figure(8);
histogram(M, 20)
hold on
M = Query(TD(:, Ic(1)),TD(:,I~=1));
histogram(M, 20)

