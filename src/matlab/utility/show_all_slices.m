for i = 1:15
    [img, ~] = load_stcr_recon_images(349, i);
    imagesc(img(:,:,15)); axis image; colormap gray;
    axis off
    caxis([0 0.8])
    exportgraphics(gca, ['images/slice', num2str(i), '.png'], 'Resolution', 300)
end