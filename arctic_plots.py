from netCDF4 import Dataset
import numpy as np
#-----------------------------------------SATELLITE
sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/satelite/mean_sate.nc'
#-----------------------------------------
#sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/BESM/grads/besm_mean_calen.nc'
#sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/CMIP5_GDFL.nc'
#sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/CMIP5_MPI.nc'
#sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/CMIP5_NCAR.nc'
#sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/CMIP6_GDFL.nc'
#sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/CMIP6_MPI.nc'
#sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/CMIP6_NCAR.nc'
fh = Dataset(sic, mode='r')
#-----------------------------------------
lons = fh.variables['lon'][:]
lats = fh.variables['lat'][:]
sic = fh.variables['icec'][9,:,:]
sic_units = fh.variables['icec'].units
fh.close()
#-----------------------------------------
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap
#-----------------------------------------
lon_0 = lons.mean()
lat_0 = lats.mean()
fig=plt.figure(figsize=(12, 10) )
m= Basemap(projection='npstere',resolution='f',boundinglat=40,round=True, lon_0= 0)
lon, lat = np.meshgrid(lons, lats)
xi, yi = m(lon, lat)
sic=m.pcolormesh(xi,yi,sic,shading='interp', cmap=plt.cm.gist_earth, vmin=0, vmax=100)
#-----------------------------------------
#plt.title(' GDFL / CM3.0')
#plt.title(' GDFL / CM4.0 ')
#plt.title(' MPI / ESM - LR ')
#plt.title(' MPI / ESM1.2 - LR ' )
#plt.title(' NCAR / CCSM4.0 ' )
#plt.title(' NCAR / CESM2.0 ')
#plt.title(' BESM-OA ')
#-----------------------------------------
m.bluemarble()
m.drawcoastlines()
m.drawparallels(np.arange(-80.,81.,20.))
m.drawmeridians(np.arange(-180.,181.,20.))
ticks=[0,15,35,50,75,100]
m.colorbar(sic, ticks=ticks,location='bottom',shrink=0.5)
plt.show()