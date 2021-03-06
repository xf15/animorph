function params_vec = param_vector_to_normalized_vector(params_vec, names_vec, range_vec)
% Convert parameters to normalized values in [0,1] based on range
%     
% Input:
%   params_vec: Vector of parameter values
%   names_vec: Cell array of parameter names (optional, defaults to global
%     {shape_params.name})
%   range_vec: Cell array of parameter ranges (optional, defaults to global
%     {shape_params.range})
% Output:
%   normalized_params_vec: Parameter values relative to ranges.

import animorph.*;

global shape_params

if (nargin < 2)
    names_vec = {shape_params.name};
    range_vec = {shape_params.range};
    
    if (length(names_vec) ~= length(params_vec))
        error('Length mismatch between names and parameters');
    elseif (length(range_vec) ~= length(params_vec))
        error('Length mismatch between ranges and parameters');
    end
end

for i = 1:length(params_vec)
    if ~isempty(range_vec{i})
        params_vec(i) = (params_vec(i) - min(range_vec{i})) / diff(range_vec{i});
    end
end

end