-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case03\data\RunDeepSource.sql

IF OBJECT_ID('dbo.RunDeepSource', 'U') IS NOT NULL
 DROP TABLE dbo.RunDeepSource

CREATE TABLE [RunDeepSource] (
   [id] BIGINT NOT NULL
,  [coord_ra] FLOAT DEFAULT NULL
,  [coord_decl] FLOAT DEFAULT NULL
,  [coord_htmId20] BIGINT DEFAULT NULL
,  [parent] BIGINT DEFAULT NULL
,  [calib_detected] BIT NOT NULL
,  [calib_psf_candidate] BIT NOT NULL
,  [calib_psf_used] BIT NOT NULL
,  [flags_negative] BIT NOT NULL
,  [flags_badcentroid] BIT NOT NULL
,  [centroid_sdss_x] FLOAT DEFAULT NULL
,  [centroid_sdss_y] FLOAT DEFAULT NULL
,  [centroid_sdss_xVar] FLOAT DEFAULT NULL
,  [centroid_sdss_xyCov] FLOAT DEFAULT NULL
,  [centroid_sdss_yVar] FLOAT DEFAULT NULL
,  [centroid_sdss_flags] BIT NOT NULL
,  [flags_pixel_edge] BIT NOT NULL
,  [flags_pixel_interpolated_any] BIT NOT NULL
,  [flags_pixel_interpolated_center] BIT NOT NULL
,  [flags_pixel_saturated_any] BIT NOT NULL
,  [flags_pixel_saturated_center] BIT NOT NULL
,  [flags_pixel_cr_any] BIT NOT NULL
,  [flags_pixel_cr_center] BIT NOT NULL
,  [centroid_gaussian_x] FLOAT DEFAULT NULL
,  [centroid_gaussian_y] FLOAT DEFAULT NULL
,  [centroid_gaussian_xVar] FLOAT DEFAULT NULL
,  [centroid_gaussian_xyCov] FLOAT DEFAULT NULL
,  [centroid_gaussian_yVar] FLOAT DEFAULT NULL
,  [centroid_gaussian_flags] BIT NOT NULL
,  [centroid_naive_x] FLOAT DEFAULT NULL
,  [centroid_naive_y] FLOAT DEFAULT NULL
,  [centroid_naive_xVar] FLOAT DEFAULT NULL
,  [centroid_naive_xyCov] FLOAT DEFAULT NULL
,  [centroid_naive_yVar] FLOAT DEFAULT NULL
,  [centroid_naive_flags] BIT NOT NULL
,  [shape_sdss_Ixx] FLOAT DEFAULT NULL
,  [shape_sdss_Iyy] FLOAT DEFAULT NULL
,  [shape_sdss_Ixy] FLOAT DEFAULT NULL
,  [shape_sdss_IxxVar] FLOAT DEFAULT NULL
,  [shape_sdss_IxxIyyCov] FLOAT DEFAULT NULL
,  [shape_sdss_IxxIxyCov] FLOAT DEFAULT NULL
,  [shape_sdss_IyyVar] FLOAT DEFAULT NULL
,  [shape_sdss_IyyIxyCov] FLOAT DEFAULT NULL
,  [shape_sdss_IxyVar] FLOAT DEFAULT NULL
,  [shape_sdss_flags] BIT NOT NULL
,  [shape_sdss_centroid_x] FLOAT DEFAULT NULL
,  [shape_sdss_centroid_y] FLOAT DEFAULT NULL
,  [shape_sdss_centroid_xVar] FLOAT DEFAULT NULL
,  [shape_sdss_centroid_xyCov] FLOAT DEFAULT NULL
,  [shape_sdss_centroid_yVar] FLOAT DEFAULT NULL
,  [shape_sdss_centroid_flags] BIT NOT NULL
,  [shape_sdss_flags_unweightedbad] BIT NOT NULL
,  [shape_sdss_flags_unweighted] BIT NOT NULL
,  [shape_sdss_flags_shift] BIT NOT NULL
,  [shape_sdss_flags_maxiter] BIT NOT NULL
,  [flux_psf] FLOAT DEFAULT NULL
,  [flux_psf_err] FLOAT DEFAULT NULL
,  [flux_psf_flags] BIT NOT NULL
,  [flux_psf_psffactor] REAL DEFAULT NULL
,  [flux_psf_flags_psffactor] BIT NOT NULL
,  [flux_psf_flags_badcorr] BIT NOT NULL
,  [flux_naive] FLOAT DEFAULT NULL
,  [flux_naive_err] FLOAT DEFAULT NULL
,  [flux_naive_flags] BIT NOT NULL
,  [flux_gaussian] FLOAT DEFAULT NULL
,  [flux_gaussian_err] FLOAT DEFAULT NULL
,  [flux_gaussian_flags] BIT NOT NULL
,  [flux_gaussian_psffactor] REAL DEFAULT NULL
,  [flux_gaussian_flags_psffactor] BIT NOT NULL
,  [flux_gaussian_flags_badcorr] BIT NOT NULL
,  [flux_sinc] FLOAT DEFAULT NULL
,  [flux_sinc_err] FLOAT DEFAULT NULL
,  [flux_sinc_flags] BIT NOT NULL
,  [multishapelet_psf_inner_1] REAL DEFAULT NULL
,  [multishapelet_psf_outer_1] REAL DEFAULT NULL
,  [multishapelet_psf_ellipse_Ixx] REAL DEFAULT NULL
,  [multishapelet_psf_ellipse_Iyy] REAL DEFAULT NULL
,  [multishapelet_psf_ellipse_Ixy] REAL DEFAULT NULL
,  [multishapelet_psf_chisq] REAL DEFAULT NULL
,  [multishapelet_psf_integral] REAL DEFAULT NULL
,  [multishapelet_psf_flags] BIT NOT NULL
,  [multishapelet_psf_flags_maxiter] BIT NOT NULL
,  [multishapelet_psf_flags_tinystep] BIT NOT NULL
,  [multishapelet_psf_flags_constraint_r] BIT NOT NULL
,  [multishapelet_psf_flags_constraint_q] BIT NOT NULL
,  [multishapelet_dev_flux] FLOAT DEFAULT NULL
,  [multishapelet_dev_flux_err] FLOAT DEFAULT NULL
,  [multishapelet_dev_flux_flags] BIT NOT NULL
,  [multishapelet_dev_psffactor] REAL DEFAULT NULL
,  [multishapelet_dev_flags_psffactor] BIT NOT NULL
,  [multishapelet_dev_flags_badcorr] BIT NOT NULL
,  [multishapelet_dev_ellipse_Ixx] FLOAT DEFAULT NULL
,  [multishapelet_dev_ellipse_Iyy] FLOAT DEFAULT NULL
,  [multishapelet_dev_ellipse_Ixy] FLOAT DEFAULT NULL
,  [multishapelet_dev_psffactor_ellipse_Ixx] FLOAT DEFAULT NULL
,  [multishapelet_dev_psffactor_ellipse_Iyy] FLOAT DEFAULT NULL
,  [multishapelet_dev_psffactor_ellipse_Ixy] FLOAT DEFAULT NULL
,  [multishapelet_dev_chisq] REAL DEFAULT NULL
,  [multishapelet_dev_flags_maxiter] BIT NOT NULL
,  [multishapelet_dev_flags_tinystep] BIT NOT NULL
,  [multishapelet_dev_flags_constraint_r] BIT NOT NULL
,  [multishapelet_dev_flags_constraint_q] BIT NOT NULL
,  [multishapelet_dev_flags_largearea] BIT NOT NULL
,  [multishapelet_exp_flux] FLOAT DEFAULT NULL
,  [multishapelet_exp_flux_err] FLOAT DEFAULT NULL
,  [multishapelet_exp_flux_flags] BIT NOT NULL
,  [multishapelet_exp_psffactor] REAL DEFAULT NULL
,  [multishapelet_exp_flags_psffactor] BIT NOT NULL
,  [multishapelet_exp_flags_badcorr] BIT NOT NULL
,  [multishapelet_exp_ellipse_Ixx] FLOAT DEFAULT NULL
,  [multishapelet_exp_ellipse_Iyy] FLOAT DEFAULT NULL
,  [multishapelet_exp_ellipse_Ixy] FLOAT DEFAULT NULL
,  [multishapelet_exp_psffactor_ellipse_Ixx] FLOAT DEFAULT NULL
,  [multishapelet_exp_psffactor_ellipse_Iyy] FLOAT DEFAULT NULL
,  [multishapelet_exp_psffactor_ellipse_Ixy] FLOAT DEFAULT NULL
,  [multishapelet_exp_chisq] REAL DEFAULT NULL
,  [multishapelet_exp_flags_maxiter] BIT NOT NULL
,  [multishapelet_exp_flags_tinystep] BIT NOT NULL
,  [multishapelet_exp_flags_constraint_r] BIT NOT NULL
,  [multishapelet_exp_flags_constraint_q] BIT NOT NULL
,  [multishapelet_exp_flags_largearea] BIT NOT NULL
,  [multishapelet_combo_flux] FLOAT DEFAULT NULL
,  [multishapelet_combo_flux_err] FLOAT DEFAULT NULL
,  [multishapelet_combo_flux_flags] BIT NOT NULL
,  [multishapelet_combo_psffactor] REAL DEFAULT NULL
,  [multishapelet_combo_flags_psffactor] BIT NOT NULL
,  [multishapelet_combo_flags_badcorr] BIT NOT NULL
,  [multishapelet_combo_components_1] REAL DEFAULT NULL
,  [multishapelet_combo_components_2] REAL DEFAULT NULL
,  [multishapelet_combo_chisq] REAL DEFAULT NULL
,  [classification_extendedness] FLOAT DEFAULT NULL
,  [aperturecorrection] FLOAT DEFAULT NULL
,  [aperturecorrection_err] FLOAT DEFAULT NULL
,  [coord_raVar] FLOAT DEFAULT NULL
,  [coord_radeclCov] FLOAT DEFAULT NULL
,  [coord_declVar] FLOAT DEFAULT NULL
,  [coadd_id] BIGINT NOT NULL
,  [coadd_filter_id] INTEGER NOT NULL
)

ALTER TABLE [RunDeepSource] ADD CONSTRAINT pk_RunDeepSource PRIMARY KEY ([id])



 CREATE INDEX ix_RunDeepSource_IDX_coord_htmId20 ON [RunDeepSource]([coord_htmId20])

 CREATE INDEX ix_RunDeepSource_IDX_coord_decl ON [RunDeepSource]([coord_decl])

 CREATE INDEX ix_RunDeepSource_IDX_parent ON [RunDeepSource]([parent])

 CREATE INDEX ix_RunDeepSource_IDX_coadd_id ON [RunDeepSource]([coadd_id])

 CREATE INDEX ix_RunDeepSource_IDX_coadd_filter_id ON [RunDeepSource]([coadd_filter_id])

