function ke = Hex8scalarSym(X,c,L)
% Symmetric part of the element stiffness matrix ke for a SCALAR problem
ke = zeros(36,1);       % Initializes the element stiffness matrix
for i=1:8               % Loop over numerical integration
    Li = L(:,:,i);      % Matrix L in point i
    Jac  = Li*X;        % Jacobian matrix
    detJ = det(Jac);    % Jacobian's determinant
    B = Jac\Li;         % B matrix
    temp = 0;
    for j=1:8           % Loops to compute the symmetric part of ke
        for k=j:8
            idx = temp + k;
            ke(idx) = ke(idx) + c*detJ*(B(:,k)'*B(:,j));
        end
        temp = temp + k - j;
    end
end
