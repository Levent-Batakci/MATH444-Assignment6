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
    Z = PCA(TermDocs{n});
    Z1 = Z(1,:);
    Z2 = Z(2,:);
    scatter(Z1,Z2, 200, '.');
    xlabel("PC 1");
    ylabel("PC 2");
    title("n=" + n);
    set(gca,"FontSize",20);
    hold on;
end

load TD;
%K-medoids for k=200, n=3, clusters=6
k=6;
tau=0.0001;
D = dMatrix(TD, @norm2);
[I,Ic] = kMedoids_distMatrix(k, D, tau, 10);

%PCA visualization!
Z = PCA(TD);
colors = ["blue" "black" "red" "green" "cyan" "magenta" "yellow"];
clf(figure(7));
figure(7);
sgtitle("k-Medoids Clustering with n=3, # of letters = 200")
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
TD = TD-sum(TD,2)/size(TD,2); %CENTER!
M = Query(TD(:, Ic(1)),TD(:,I==1));
figure(8);
histogram(M, 20)
hold on
M = Query(TD(:, Ic(1)),TD(:,I~=1));
histogram(M, 20)
xlabel("Match");
ylabel("Amount");
legend("Own Cluster", "Other Clusters");


clf(figure(10))
figure(10)
K = [200 400 800];
for i = 1:size(K,2)
    k = K(i);
    
    subplot(1,3, mod(i-1,3)+1 + 3*floor((i-1)/3));
    %Visualize
    Z = PCA(CalcFreq(genseq, 3, k)');
    Z1 = Z(1,:);
    Z2 = Z(2,:);
    scatter(Z1,Z2, 200, '.');
    xlabel("PC 1");
    ylabel("PC 2");
    title("k=" + k);
    set(gca,"FontSize",20);
    hold on;
end
