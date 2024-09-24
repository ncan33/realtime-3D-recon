function [image_recon, para] = load_stcr_recon_images(vol_num, slice_num, date, filename)

    arguments
        vol_num = 349; % volunteer number
        slice_num = 7; % slice number
        date = '20220517'; % date of acquisition
        filename = 'usc_disc_yt_2022_05_17_115655_multi_slice_golden_angle_spiral_ssfp_slice_15_fov_240_n52_slice_07_stcr';
    end

    % enforce 4 digits for volunteer number
    if vol_num < 1000
        vol_num = sprintf('%04d', vol_num);
    else
        vol_num = num2str(vol_num);
    end
    
    % enforce 2 digits for slice number
    if slice_num < 10
        slice_num = sprintf('%02d', slice_num);
    else
        slice_num = num2str(slice_num);
    end
    
    % override the slice number
    filename(end-6:end-5) = slice_num;

    % define filepath
    filepath = fullfile('/server/sdata/ytian/mri_data/disc/heart', ...
        ['vol', vol_num, '_', date], 'recon_data', [filename, '.mat']);
    
    % load the file
    [struct] = load(filepath);
    
    % extract varibale from the struct
    image_recon = struct.image_recon;
    para = struct.para;
end