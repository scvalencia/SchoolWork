function []  = plotter(M, cmap)

    tolerance = 0.5e-4;

    [r c] = size(M);

    %# text location and labels
    [xloc yloc] = meshgrid(1:c,1:r);
    xloc = xloc(:); yloc = yloc(:);
    str = strtrim(cellstr( num2str(M(:),'%.3g') ));
    
    xx = ['10 '; '20 '; '50 '; '75 '; '100'; '500'];
    yy = ['JACOBI    '; 'GAUSSEIDEL'; 'RREF      '; 'INV       '; 'LINSOLVE  '; 'MLDIVIDE  '];
    
    xticklabels = cellstr(xx);
    yticklabels = cellstr(yy);
    
    % xticklabels = cellstr( num2str((1:c)','M%d') );
    % yticklabels = cellstr( num2str((1:r)','M%d') );
    
    mask = abs(M) > tolerance;
    
    h = imagesc(1:c, 1:r, ones(size(M)));
    set(h, 'AlphaData',mask)
    colormap(cmap)
    set(gca, 'Box','on', 'XAxisLocation','top', 'YDir','reverse', ...
        'XLim',[0 c]+0.5, 'YLim',[0 r]+0.5, 'TickLength',[0 0], ...
        'XTick',1:c, 'YTick',1:r, ...
        'XTickLabel',xticklabels, 'YTickLabel',yticklabels, ...
        'LineWidth',2, 'Color','none', ...
        'FontWeight','bold', 'FontSize',8, 'DataAspectRatio',[1 1 1]);


    %# plot grid
    xv1 = repmat((2:c)-0.5, [2 1]); xv1(end+1,:) = NaN;
    xv2 = repmat([0.5;c+0.5;NaN], [1 r-1]);
    yv1 = repmat([0.5;r+0.5;NaN], [1 c-1]);
    yv2 = repmat((2:r)-0.5, [2 1]); yv2(end+1,:) = NaN;
    line([xv1(:);xv2(:)], [yv1(:);yv2(:)], 'Color','k', 'HandleVisibility','off')

    %# plot text
    text(xloc, yloc, str, 'FontSize',8, 'HorizontalAlignment','center');
end