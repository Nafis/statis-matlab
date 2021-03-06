function [ Wcomp, alpha_t ] = compromis(W,S,Delta,VaP,VeP,norm)
%% Fonction de calcul de compromis pour la methode STATIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input variables
% W = Matrice avec les objets des t etudes
% S = Matrice des produits scalaire entre les Objets (W) affectes par le poids
%     Delta
% Delta = Matrice diagonal avec les poids (pi_i)
% norm = Option si on veut faire l'analyse en prendre en compre la norme
% VaP = Valeurs propres du matrice S
% VeP = Vecteurs propres du matrice S
%
% Output Variables
% Wcomp = Matrice avec le Compromis entre les objets W
%
% Use:
% [ Wcomp ] = compromis(W,S,Delta,VaP,VeP,norm)
%
% Author: Rodrigo Andres Rivera Martinez
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Expresion definitive du compromis
[L,C,T] = size(W);
pi_t=diag(Delta);
SS = diag(S);
gamma = VeP(:,1);
Wcomp = 0;
alpha_t = zeros(1,T);
if ~norm
    alpha_c = sum(pi_t.*sqrt(SS));
    for i = 1:T
        alpha_t(i) = (1./sqrt(VaP(1))*alpha_c*pi_t(i)*gamma(i));
      Wcomp = Wcomp + (alpha_t(i)*W(:,:,i));
    end
else
    for i = 1:T
        alpha_t(i) = (1/sqrt(VaP(1))*pi_t(i)*gamma(i));
        Wcomp = Wcomp + (alpha_t(i)*W(:,:,i));
    end
end

end

