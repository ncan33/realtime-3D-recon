function [kspace, kspace_info] = load_spiral_rthawk_data(vol_num, date, filename)

    arguments
        vol_num = 349; % volunteer number
        date = '20220517'; % date of acquisition
        filename = 'usc_disc_yt_2022_05_17_115655_multi_slice_golden_angle_spiral_ssfp_slice_15_fov_240_n52_slice_05';
    end

    if vol_num < 1000
        vol_num = sprintf('%04d', vol_num);
    else
        vol_num = num2str(vol_num);
    end

    filepath = fullfile('/server/sdata/ytian/mri_data/disc/heart', ...
        ['vol', vol_num, '_', date], 'raw_hawk', [filename, '.mat']);
    
    [kspace, kspace_info] = load(filepath);
end