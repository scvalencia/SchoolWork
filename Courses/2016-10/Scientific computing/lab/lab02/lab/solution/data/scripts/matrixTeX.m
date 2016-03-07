%
% Takes in a matrix or vector A, and spits out
% the TeX form using bmatrix notation
%
% Two optional input arguments let you specify
%
% (i) the format of the elements "fmt"
% ('%d', '%8.4f', '%e' etc.) in "C" style.
%
% (ii) the alignment ('c','l',or 'r'). If the third
% argument is specified, you need to include the
% "mathtools" package in your latex document
%
% If only the matrix is specfied then it tries to
% figure out if it has only integers (fmt='%d')
% or not (fmt='%8.4s')
%
function matrixTeX(A, fmt, align)

  [m,n] = size(A);

  if(nargin < 2)

    %
    % Is the matrix full of integers?
    % If so, then use integer output
    %

    if( norm(A-floor(A)) < eps )
      intA = 1;
      fmt  = '%d';
    else
      intA = 0;
      fmt  = '%8.4f';
    end;

  end;

  fmtstring1 = [' ',fmt,' & '];
  fmtstring2 = [' ',fmt,' \\\\ \n'];

  if(nargin < 3)
    printf('\n\\begin{bmatrix}\n');
  else
    printf('\n\\begin{bmatrix*}[%s]\n',align);
  end; 

  for i = 1:m

    for j = 1:n-1
       printf(fmtstring1,A(i,j));
    end;

    printf(fmtstring2, A(i,n));

  end;

  if(nargin < 3)
    printf('\\end{bmatrix}\n\n');
  else
    printf('\\end{bmatrix*}\n\n');
  end;


end
