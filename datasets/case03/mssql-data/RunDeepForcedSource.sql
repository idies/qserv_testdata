-- MS SQL DDL ported from MySQL version at C:\workspaces\git\LSST\idies-qserv_testdata\datasets\case03\data\RunDeepForcedSource.sql

IF OBJECT_ID('dbo.RunDeepForcedSource', 'U') IS NOT NULL
 DROP TABLE dbo.RunDeepForcedSource

CREATE TABLE [RunDeepForcedSource] (
   [id] BIGINT NOT NULL
,  [coord_ra] FLOAT DEFAULT NULL
,  [coord_decl] FLOAT DEFAULT NULL
,  [coord_htmId20] BIGINT DEFAULT NULL
,  [parent] BIGINT DEFAULT NULL
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
,  [centroid_naive_x] FLOAT DEFAULT NULL
,  [centroid_naive_y] FLOAT DEFAULT NULL
,  [centroid_naive_xVar] FLOAT DEFAULT NULL
,  [centroid_naive_xyCov] FLOAT DEFAULT NULL
,  [centroid_naive_yVar] FLOAT DEFAULT NULL
,  [centroid_naive_flags] BIT NOT NULL
,  [centroid_gaussian_x] FLOAT DEFAULT NULL
,  [centroid_gaussian_y] FLOAT DEFAULT NULL
,  [centroid_gaussian_xVar] FLOAT DEFAULT NULL
,  [centroid_gaussian_xyCov] FLOAT DEFAULT NULL
,  [centroid_gaussian_yVar] FLOAT DEFAULT NULL
,  [centroid_gaussian_flags] BIT NOT NULL
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
,  [centroid_record_x] FLOAT DEFAULT NULL
,  [centroid_record_y] FLOAT DEFAULT NULL
,  [classification_extendedness] FLOAT DEFAULT NULL
,  [aperturecorrection] FLOAT DEFAULT NULL
,  [aperturecorrection_err] FLOAT DEFAULT NULL
,  [refFlux] FLOAT DEFAULT NULL
,  [refFlux_err] FLOAT DEFAULT NULL
,  [objectId] BIGINT NOT NULL
,  [coord_raVar] FLOAT DEFAULT NULL
,  [coord_radeclCov] FLOAT DEFAULT NULL
,  [coord_declVar] FLOAT DEFAULT NULL
,  [exposure_id] BIGINT NOT NULL
,  [exposure_filter_id] INTEGER NOT NULL
,  [exposure_time] REAL DEFAULT NULL
,  [exposure_time_mid] FLOAT DEFAULT NULL
,  [cluster_id] BIGINT DEFAULT NULL
,  [cluster_coord_ra] FLOAT DEFAULT NULL
,  [cluster_coord_decl] FLOAT DEFAULT NULL
)

ALTER TABLE [RunDeepForcedSource] ADD CONSTRAINT pk_RunDeepForcedSource PRIMARY KEY ([id])



 CREATE INDEX ix_RunDeepForcedSource_IDX_coord_htmId20 ON [RunDeepForcedSource]([coord_htmId20])

 CREATE INDEX ix_RunDeepForcedSource_IDX_coord_decl ON [RunDeepForcedSource]([coord_decl])

 CREATE INDEX ix_RunDeepForcedSource_IDX_parent ON [RunDeepForcedSource]([parent])

 CREATE INDEX ix_RunDeepForcedSource_IDX_exposure_id ON [RunDeepForcedSource]([exposure_id])

 CREATE INDEX ix_RunDeepForcedSource_IDX_exposure_filter_id ON [RunDeepForcedSource]([exposure_filter_id])

 CREATE INDEX ix_RunDeepForcedSource_objectId ON [RunDeepForcedSource]([objectId])

 CREATE INDEX ix_RunDeepForcedSource_coord_ra ON [RunDeepForcedSource]([coord_ra])

