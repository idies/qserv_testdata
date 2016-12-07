


bulk insert [Science_Ccd_Exposure_coadd_r]
from 'H:\GitHub\qserv_testdata\datasets\case03\data\Science_Ccd_Exposure_coadd_r.txt'
with (codepage = '65001')



select * from Science_ccd_exposure_coadd_r


bulk insert [AvgForcedPhot]
from 'D:\lsst\data\AvgForcedPhot2.txt'
with (
--codepage = '65001',
		fieldterminator = ',',
		ROWTERMINATOR = '''+CHAR(10)+'''
		)
		
