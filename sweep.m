
% KEY FEATURES OF SWEEP
% goal: 1D correlation analysis by distance, given spatial transcriptomics data
% maintains semicircular sweep with constantly-updating dist_vecs object variable
% optimized by skipping multidimensional array step
%   directly flattens it into a 2D matrix of indices for linear indexing

% SETUP: manually load.
% load total, dist_vecs
% set maxDist 

function final_result = sweep_local(total, maxDist, dist_vecs)

    % standardize the grid
    mean_exp = mean(total, 'all');
    sd_exp = sqrt(var(total, 1, 'all'));
    total = (total-mean_exp) / sd_exp;
    
    
    coordX = repmat(1:size(total,2), size(total,1),1);
    coordY = repmat(1:size(total,1), size(total,2),1)';
    logVec = true(size(total,1), size(total,2));
    totalVec = total(logVec);
    coordX = coordX(logVec);
    coordY = coordY(logVec);
    coordinates = [coordX coordY].';
    
    clear grid mean_exp sd_exp logVec;
    
    
    % CALCULATION FOR EACH DISTANCE 
    result = [];
    
    for dist = 0:maxDist
    
        disp(dist);
        vecs = dist_vecs{dist+1};   % get the vectors for this distance
    
        % out of bounds points are zero. There are 3 such out-of-bounds regions
        % the left margin, right margin, and bottom margin (the semicircle is a bottom half of a circle)
        % we create margins that are the size of "dist"
        extendedTotal = zeros(size(total,1)+dist, size(total,2)+2*dist);
        extendedTotal(1:size(total,1), (dist+1):(size(total,2)+dist)) = total;
        extendTotalVec = extendedTotal(true(size(extendedTotal,1),size(extendedTotal,2)));
        height = size(extendedTotal,1);
        
        % NOTE: BASED ON ASSUMPTION THAT NO POINT IN TOTAL IS EXACTLY 0, IE. THE MEAN
    
        % directly linearize:
        px = (dist + vecs(:,1) + coordinates(1,:) - 1)*height;
        py = vecs(:,2) + coordinates(2,:);
        linIndex = px + py;
    
    
        % extended expression selected - extracts expression from extended grid
        extExpSel = extendTotalVec(linIndex);
        
        % now correlation calculation
        disp("correlation calculation")
        % special case when dist=0, Matlab reduces the dimensions
        if dist == 0
            corrs = extExpSel.' * totalVec;
            result = [result; (corrs / length(totalVec))];
        else
            count = sum(extExpSel ~= 0, 'all'); % count of within-bound points
            corrs = sum(extExpSel * totalVec, 'all'); 
                % matrix multiplication
                % then sum up all the rows in the single column
            result = [result; (corrs/count)];
        end
    
    end
    
    final_result = result;

end

figure();
plot(0:dist, result, 'ok');


function grid = cropData(originalGrid, top, bottom, left, right)

    tempGrid = zeros(bottom-top+1, right-left+1);
    tempGrid(1:(bottom-top+1), 1:(right-left+1)) = originalGrid(top:bottom, left:right);
    grid = tempGrid;

end

